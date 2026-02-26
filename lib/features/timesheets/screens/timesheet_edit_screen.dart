import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/core/extensions.dart';
import 'package:timesheet/core/time_utils.dart';
import 'package:timesheet/shared/widgets/color_dot.dart';
import 'package:timesheet/shared/widgets/confirm_dialog.dart';
import 'package:timesheet/shared/widgets/status_icon.dart';

// ---------------------------------------------------------------------------
// GraphQL documents
// ---------------------------------------------------------------------------

const String _timesheetQuery = r'''
query Timesheet($id: ID, $month: YearMonth) {
  timesheet(id: $id, month: $month) {
    id month status totalTime
    activities {
      id
      customer { id name color }
      project { id name color tag }
      description startTime endTime isActive
    }
  }
}
''';

const String _timesheetCreateMutation = r'''
mutation TimesheetCreate($input: TimesheetCreateInput!) {
  timesheetCreate(input: $input) {
    timesheet {
      id month status totalTime
      activities {
        id
        customer { id name color }
        project { id name color tag }
        description startTime endTime isActive
      }
    }
  }
}
''';

const String _timesheetUpdateMutation = r'''
mutation TimesheetUpdate($input: TimesheetUpdateInput!) {
  timesheetUpdate(input: $input) {
    timesheet {
      id month status totalTime
      activities {
        id
        customer { id name color }
        project { id name color tag }
        description startTime endTime isActive
      }
    }
  }
}
''';

const String _activitiesDeleteMutation = r'''
mutation ActivitiesDelete($input: ActivitiesDeleteInput!) {
  activitiesDelete(input: $input) {
    timesheet {
      id month status totalTime
      activities {
        id
        customer { id name color }
        project { id name color tag }
        description startTime endTime isActive
      }
    }
  }
}
''';

// ---------------------------------------------------------------------------
// Grouped activity model
// ---------------------------------------------------------------------------

class _GroupedActivity {
  final List<String> ids;
  final Map<String, dynamic>? customer;
  final Map<String, dynamic>? project;
  final String? description;
  DateTime startTime;
  DateTime endTime;
  int breakTime; // milliseconds
  final List<Map<String, dynamic>> times;

  _GroupedActivity({
    required this.ids,
    this.customer,
    this.project,
    this.description,
    required this.startTime,
    required this.endTime,
    this.breakTime = 0,
    required this.times,
  });

  /// Serialize to a Map so it can be passed via GoRouter extra.
  Map<String, dynamic> toMap() {
    return {
      'ids': ids,
      'customer': customer,
      'project': project,
      'description': description,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'breakTime': breakTime,
      'times': times,
    };
  }
}

// ---------------------------------------------------------------------------
// Grouping logic (port of ActivitiesList.tsx)
// ---------------------------------------------------------------------------

DateTime _msToDateTime(dynamic value) {
  if (value is num) {
    return DateTime.fromMillisecondsSinceEpoch(value.toInt());
  }
  if (value is String) {
    final ms = int.tryParse(value);
    if (ms != null) return DateTime.fromMillisecondsSinceEpoch(ms);
    return DateTime.parse(value);
  }
  return DateTime.now();
}

List<_GroupedActivity> _groupActivities(List<dynamic> activities) {
  final List<_GroupedActivity> result = [];

  for (final activity in activities) {
    final activityStart = _msToDateTime(activity['startTime']);
    final activityEnd = _msToDateTime(activity['endTime']);

    final existing = result.cast<_GroupedActivity?>().firstWhere(
      (item) {
        if (item == null) return false;

        // Same date (day of month)
        if (item.startTime.day != activityStart.day ||
            item.startTime.month != activityStart.month ||
            item.startTime.year != activityStart.year) {
          return false;
        }

        // Customer match
        final itemCustomer = item.customer;
        final actCustomer = activity['customer'] as Map<String, dynamic>?;
        if ((itemCustomer != null || actCustomer != null) &&
            itemCustomer?['id'] != actCustomer?['id']) {
          return false;
        }

        // Project match
        final itemProject = item.project;
        final actProject = activity['project'] as Map<String, dynamic>?;
        if ((itemProject != null || actProject != null) &&
            itemProject?['id'] != actProject?['id']) {
          return false;
        }

        // Description match
        final itemDesc = item.description;
        final actDesc = activity['description'] as String?;
        if (itemDesc != actDesc) {
          return false;
        }

        return true;
      },
      orElse: () => null,
    );

    final timeEntry = {
      'id': activity['id'],
      'startTime': activityStart.millisecondsSinceEpoch,
      'endTime': activityEnd.millisecondsSinceEpoch,
    };

    if (existing != null) {
      existing.ids.add(activity['id'] as String);
      // breakTime = activity.startTime - previousGroup.endTime (in ms)
      existing.breakTime +=
          activityStart.millisecondsSinceEpoch - existing.endTime.millisecondsSinceEpoch;
      existing.endTime = activityEnd;
      existing.times.add(timeEntry);
    } else {
      result.add(
        _GroupedActivity(
          ids: [activity['id'] as String],
          customer: activity['customer'] as Map<String, dynamic>?,
          project: activity['project'] as Map<String, dynamic>?,
          description: activity['description'] as String?,
          startTime: activityStart,
          endTime: activityEnd,
          breakTime: 0,
          times: [timeEntry],
        ),
      );
    }
  }

  return result;
}

// ---------------------------------------------------------------------------
// Helper: check if a yyyy-MM string is the current month
// ---------------------------------------------------------------------------

bool _isCurrentMonth(String month) {
  final now = DateTime.now();
  final current = DateFormat('yyyy-MM').format(now);
  return month == current;
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class TimesheetEditScreen extends StatefulWidget {
  final String month;

  const TimesheetEditScreen({super.key, required this.month});

  @override
  State<TimesheetEditScreen> createState() => _TimesheetEditScreenState();
}

class _TimesheetEditScreenState extends State<TimesheetEditScreen> {
  Map<String, dynamic>? _timesheet;
  bool _loading = true;
  bool _hasError = false;
  bool _createCalled = false;
  bool _updateLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchTimesheet());
  }

  // ---- Data fetching ----

  Future<void> _fetchTimesheet() async {
    setState(() {
      _loading = true;
      _hasError = false;
    });

    try {
      final client = GraphQLProvider.of(context).value;

      final result = await client.query(
        QueryOptions(
          document: gql(_timesheetQuery),
          variables: {'month': widget.month},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (!mounted) return;

      if (result.hasException) {
        // GraphQL errors can be at the operation level or inside the
        // ServerException's parsedResponse when data is null.
        final gqlErrors = result.exception?.graphqlErrors ?? [];
        final linkEx = result.exception?.linkException;
        final serverErrors = (linkEx is ServerException)
            ? (linkEx.parsedResponse?.errors ?? [])
            : <GraphQLError>[];
        final allErrors = [...gqlErrors, ...serverErrors];

        debugPrint('=== Timesheet fetch error for ${widget.month} ===');
        debugPrint('graphqlErrors: $gqlErrors');
        debugPrint('linkException type: ${linkEx.runtimeType}');
        debugPrint('serverErrors: $serverErrors');
        debugPrint('allErrors: $allErrors');
        debugPrint('full exception: ${result.exception}');

        final isNotFound =
            allErrors.any((e) => e.message == 'notFound');

        if (isNotFound && _isCurrentMonth(widget.month) && !_createCalled) {
          _autoCreate(client);
          return;
        }

        // For non-current months that don't exist, just treat as empty
        if (isNotFound) {
          setState(() {
            _loading = false;
            _hasError = false;
            _timesheet = null;
          });
          return;
        }

        setState(() {
          _loading = false;
          _hasError = true;
        });
        return;
      }

      setState(() {
        _timesheet = result.data?['timesheet'] as Map<String, dynamic>?;
        _loading = false;
      });
    } catch (e) {
      debugPrint('Error fetching timesheet: $e');
      if (!mounted) return;
      setState(() {
        _loading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _autoCreate(GraphQLClient client) async {
    setState(() {
      _createCalled = true;
    });

    final result = await client.mutate(
      MutationOptions(
        document: gql(_timesheetCreateMutation),
        variables: {
          'input': {'month': widget.month},
        },
      ),
    );

    if (!mounted) return;

    if (result.hasException || result.data == null) {
      setState(() {
        _loading = false;
        _hasError = true;
      });
      return;
    }

    setState(() {
      _timesheet =
          result.data!['timesheetCreate']['timesheet'] as Map<String, dynamic>;
      _loading = false;
    });
  }

  // ---- Mutations ----

  Future<void> _changeStatus(String newStatus) async {
    if (_timesheet == null) return;

    setState(() => _updateLoading = true);

    final client = GraphQLProvider.of(context).value;
    final result = await client.mutate(
      MutationOptions(
        document: gql(_timesheetUpdateMutation),
        variables: {
          'input': {
            'id': _timesheet!['id'],
            'status': newStatus,
          },
        },
      ),
    );

    if (!mounted) return;

    if (!result.hasException && result.data != null) {
      setState(() {
        _timesheet =
            result.data!['timesheetUpdate']['timesheet'] as Map<String, dynamic>;
      });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Errore durante l\'aggiornamento')),
        );
      }
    }

    setState(() => _updateLoading = false);
  }

  Future<void> _deleteActivities(List<String> activityIds) async {
    if (_timesheet == null) return;

    final client = GraphQLProvider.of(context).value;
    final result = await client.mutate(
      MutationOptions(
        document: gql(_activitiesDeleteMutation),
        variables: {
          'input': {
            'timesheetId': _timesheet!['id'],
            'activitiesIds': activityIds,
          },
        },
      ),
    );

    if (!mounted) return;

    if (!result.hasException && result.data != null) {
      setState(() {
        _timesheet =
            result.data!['activitiesDelete']['timesheet'] as Map<String, dynamic>;
      });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Errore durante l\'eliminazione')),
        );
      }
    }
  }

  // ---- Helpers ----

  String _buildTitle() {
    final regex = RegExp(r'^\d{4}-(0?[1-9]|1[012])$');
    if (!regex.hasMatch(widget.month)) return '-';

    final parts = widget.month.split('-');
    final date = DateTime(int.parse(parts[0]), int.parse(parts[1]));
    return date.formatMonthYear().capitalize();
  }

  String get _status =>
      (_timesheet?['status'] as String?) ?? '';

  bool get _isOpen => _status.toUpperCase() == 'OPEN';
  bool get _isClosed => _status.toUpperCase() == 'CLOSED';

  // ---- Build ----

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = _buildTitle();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/timesheets'),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (_timesheet != null) ...[
              const SizedBox(width: 8),
              StatusIcon(status: _status),
            ],
          ],
        ),
        actions: _buildActions(),
      ),
      body: _buildBody(theme),
      floatingActionButton: (_timesheet != null && _isOpen)
          ? FloatingActionButton(
              onPressed: () {
                context.push(
                  '/activity-create/${widget.month}?timesheetId=${_timesheet!['id']}',
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  List<Widget> _buildActions() {
    final actions = <Widget>[];

    if (_timesheet == null) return actions;

    if (_isOpen) {
      actions.add(
        TextButton(
          onPressed: _updateLoading
              ? null
              : () async {
                  final confirmed = await showConfirmDialog(
                    context,
                    title: 'Chiudere il timesheet?',
                    content:
                        'Sei sicuro di voler chiudere il timesheet? Non potrai piu\' modificare le attivita\'.',
                    confirmText: 'Chiudi',
                  );
                  if (confirmed) {
                    _changeStatus('CLOSED');
                  }
                },
          child: _updateLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Chiudi'),
        ),
      );
    }

    if (_isClosed) {
      actions.add(
        TextButton(
          onPressed: _updateLoading
              ? null
              : () async {
                  final confirmed = await showConfirmDialog(
                    context,
                    title: 'Riaprire il timesheet?',
                    content:
                        'Sei sicuro di voler riaprire il timesheet?',
                    confirmText: 'Riapri',
                  );
                  if (confirmed) {
                    _changeStatus('OPEN');
                  }
                },
          child: _updateLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Riapri'),
        ),
      );
    }

    return actions;
  }

  Widget _buildBody(ThemeData theme) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_hasError && (_timesheet == null)) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(FontAwesomeIcons.triangleExclamation,
                size: 48, color: Colors.orange),
            const SizedBox(height: 16),
            const Text('Qualcosa e\' andato storto'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/timesheets'),
              child: const Text('Indietro'),
            ),
          ],
        ),
      );
    }

    if (_timesheet == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(FontAwesomeIcons.calendarXmark,
                size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Nessun timesheet per questo mese'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/timesheets'),
              child: const Text('Indietro'),
            ),
          ],
        ),
      );
    }

    final activities =
        (_timesheet!['activities'] as List<dynamic>?) ?? [];
    final grouped = _groupActivities(activities);

    // Sort by startTime descending (most recent first)
    grouped.sort((a, b) => b.startTime.compareTo(a.startTime));

    if (grouped.isEmpty) {
      return RefreshIndicator(
        onRefresh: _fetchTimesheet,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 120),
            Center(
              child: Text(
                'Nessuna attivita\'',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchTimesheet,
      child: SlidableAutoCloseBehavior(
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 0,
            right: 0,
            top: 8,
            bottom: 88,
          ),
          itemCount: grouped.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final group = grouped[index];
            return _ActivityCard(
              group: group,
              isOpen: _isOpen,
              month: widget.month,
              timesheetId: _timesheet!['id'] as String,
              onDelete: () async {
                final confirmed = await showConfirmDialog(
                  context,
                  title: 'Eliminare l\'attivita\'?',
                  content:
                      'Sei sicuro di voler eliminare questa attivita\'?',
                  confirmText: 'Elimina',
                  destructive: true,
                );
                if (confirmed) {
                  _deleteActivities(group.ids);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Activity card widget
// ---------------------------------------------------------------------------

class _ActivityCard extends StatelessWidget {
  final _GroupedActivity group;
  final bool isOpen;
  final String month;
  final String timesheetId;
  final VoidCallback onDelete;

  const _ActivityCard({
    required this.group,
    required this.isOpen,
    required this.month,
    required this.timesheetId,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = DateFormat('dd/MM/yyyy').format(group.startTime);
    final startStr = DateFormat('HH:mm').format(group.startTime);
    final endStr = DateFormat('HH:mm').format(group.endTime);
    final realTimeMs = group.endTime.millisecondsSinceEpoch -
        group.startTime.millisecondsSinceEpoch -
        group.breakTime;
    final realTimeStr = toTime(realTimeMs);
    final breakStr = toTime(group.breakTime);

    final cardContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date row
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.calendar,
              size: 14,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              dateStr,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Time row
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.clock,
              size: 14,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              '$startStr - $endStr',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '($realTimeStr)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (group.breakTime > 0) ...[
              const SizedBox(width: 12),
              FaIcon(
                FontAwesomeIcons.mugHot,
                size: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                breakStr,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),

        // Customer
        if (group.customer != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              ColorDot(
                colorHex: group.customer!['color'] as String?,
                size: 10,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  group.customer!['name'] as String? ?? '',
                  style: theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],

        // Project
        if (group.project != null) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              ColorDot(
                colorHex: group.project!['color'] as String?,
                size: 10,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  group.project!['name'] as String? ?? '',
                  style: theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],

        // Description
        if (group.description != null &&
            group.description!.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            group.description!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );

    final card = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: isOpen
          ? Row(
              children: [
                Expanded(child: cardContent),
                Icon(
                  Icons.chevron_left,
                  size: 18,
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                ),
              ],
            )
          : cardContent,
    );

    if (!isOpen) return card;

    return Slidable(
      key: ValueKey(group.ids.join('-')),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          CustomSlidableAction(
            onPressed: (_) {
              context.push(
                '/activity-edit/$month',
                extra: {
                  'timesheetId': timesheetId,
                  'activity': group.toMap(),
                },
              );
            },
            padding: EdgeInsets.zero,
            backgroundColor: Colors.blue,
            child: const Icon(Icons.edit, color: Colors.white),
          ),
          CustomSlidableAction(
            onPressed: (_) {
              context.push(
                '/activity-edit/$month',
                extra: {
                  'timesheetId': timesheetId,
                  'activity': group.toMap(),
                  'clone': true,
                },
              );
            },
            padding: EdgeInsets.zero,
            backgroundColor: Colors.orange,
            child: const Icon(Icons.copy, color: Colors.white),
          ),
          CustomSlidableAction(
            onPressed: (_) => onDelete(),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      child: card,
    );
  }
}
