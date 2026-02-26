import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/timesheets/widgets/activity_form.dart';

// ---------------------------------------------------------------------------
// GraphQL mutations
// ---------------------------------------------------------------------------

const String _activitiesCreateMutation = r'''
  mutation ActivitiesCreate($input: ActivitiesCreateInput!) {
    activitiesCreate(input: $input) {
      timesheet { id month status totalTime }
    }
  }
''';

const String _activitiesUpdateMutation = r'''
  mutation ActivitiesUpdate($input: ActivitiesUpdateInput!) {
    activitiesUpdate(input: $input) {
      timesheet { id }
    }
  }
''';

const String _activitiesDeleteMutation = r'''
  mutation ActivitiesDelete($input: ActivitiesDeleteInput!) {
    activitiesDelete(input: $input) {
      timesheet { id }
    }
  }
''';

// ---------------------------------------------------------------------------
// ActivityEditScreen
// ---------------------------------------------------------------------------

class ActivityEditScreen extends StatefulWidget {
  final String month;
  final String timesheetId;
  final Map<String, dynamic>? activity;
  final bool clone;

  const ActivityEditScreen({
    super.key,
    required this.month,
    required this.timesheetId,
    this.activity,
    this.clone = false,
  });

  @override
  State<ActivityEditScreen> createState() => _ActivityEditScreenState();
}

class _ActivityEditScreenState extends State<ActivityEditScreen> {
  bool _saving = false;

  // ---------------------------------------------------------------------------
  // Extract initial values from the activity map
  // ---------------------------------------------------------------------------

  DateTime? get _initialDate {
    final act = widget.activity;
    if (act == null) return null;
    final startTime = act['startTime'];
    if (startTime == null) return null;
    final ms = (startTime is num) ? startTime.toInt() : int.tryParse(startTime.toString());
    if (ms == null) return null;
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    return DateTime(dt.year, dt.month, dt.day);
  }

  List<TimeRange>? get _initialTimes {
    final act = widget.activity;
    if (act == null) return null;

    // The activity might be a single activity or contain grouped time entries.
    // A single activity has startTime and endTime directly.
    // Grouped activities have individual entries under a 'times' key.
    final List<Map<String, dynamic>> entries = [];

    if (act.containsKey('times') && act['times'] is List) {
      for (final a in (act['times'] as List)) {
        entries.add(Map<String, dynamic>.from(a as Map));
      }
    } else {
      entries.add(act);
    }

    return entries.map((a) {
      final startMs = (a['startTime'] is num)
          ? (a['startTime'] as num).toInt()
          : int.tryParse(a['startTime'].toString()) ?? 0;
      final endMs = (a['endTime'] is num)
          ? (a['endTime'] as num).toInt()
          : int.tryParse(a['endTime'].toString()) ?? 0;

      final startDt = DateTime.fromMillisecondsSinceEpoch(startMs);
      final endDt = DateTime.fromMillisecondsSinceEpoch(endMs);

      return TimeRange(
        // For clone we strip the id so a new activity is created
        id: widget.clone ? null : (a['id'] as String?),
        startHour: widget.clone ? 9 : startDt.hour,
        startMinute: widget.clone ? 0 : startDt.minute,
        endHour: widget.clone ? 18 : endDt.hour,
        endMinute: widget.clone ? 0 : endDt.minute,
      );
    }).toList();
  }

  String? get _initialCustomerId {
    final act = widget.activity;
    if (act == null) return null;
    // customer can be nested { id } or a direct customerId
    if (act['customer'] is Map) {
      return (act['customer'] as Map)['id'] as String?;
    }
    return act['customerId'] as String?;
  }

  String? get _initialProjectId {
    final act = widget.activity;
    if (act == null) return null;
    if (act['project'] is Map) {
      return (act['project'] as Map)['id'] as String?;
    }
    return act['projectId'] as String?;
  }

  String? get _initialDescription {
    return widget.activity?['description'] as String?;
  }

  // ---------------------------------------------------------------------------
  // Collect the original activity ids (for determining deletes)
  // ---------------------------------------------------------------------------

  Set<String> get _originalIds {
    final act = widget.activity;
    if (act == null) return {};
    final ids = <String>{};

    if (act.containsKey('ids') && act['ids'] is List) {
      for (final id in (act['ids'] as List)) {
        if (id is String) ids.add(id);
      }
    } else if (act.containsKey('times') && act['times'] is List) {
      for (final a in (act['times'] as List)) {
        final id = (a as Map)['id'] as String?;
        if (id != null) ids.add(id);
      }
    } else {
      final id = act['id'] as String?;
      if (id != null) ids.add(id);
    }
    return ids;
  }

  // ---------------------------------------------------------------------------
  // Submit handler: determines creates / updates / deletes
  // ---------------------------------------------------------------------------

  Future<void> _onSubmit(ActivityFormData data) async {
    setState(() => _saving = true);

    try {
      final client = GraphQLProvider.of(context).value;

      if (widget.clone) {
        // Clone mode — always create new activities
        final activities = getActivities(
          data.date,
          data.times,
          data.customerId,
          data.projectId,
          data.description,
          creating: true,
        );

        final result = await client.mutate(
          MutationOptions(
            document: gql(_activitiesCreateMutation),
            variables: {
              'input': {
                'timesheetId': widget.timesheetId,
                'activities': activities,
              },
            },
          ),
        );

        if (!mounted) return;
        if (result.hasException) {
          _showError(result);
          return;
        }
      } else {
        // Edit mode — determine which to create, update, delete
        final allActivities = getActivities(
          data.date,
          data.times,
          data.customerId,
          data.projectId,
          data.description,
          creating: false,
        );

        final toCreate = <Map<String, dynamic>>[];
        final toUpdate = <Map<String, dynamic>>[];
        final submittedIds = <String>{};

        for (final a in allActivities) {
          if (a.containsKey('id') && a['id'] != null) {
            toUpdate.add(a);
            submittedIds.add(a['id'] as String);
          } else {
            toCreate.add(a);
          }
        }

        // Activities that were in the original but are no longer present
        final toDeleteIds =
            _originalIds.difference(submittedIds).toList();

        // Execute mutations in parallel-ish (await each)
        String? errorMessage;

        if (toCreate.isNotEmpty) {
          final result = await client.mutate(
            MutationOptions(
              document: gql(_activitiesCreateMutation),
              variables: {
                'input': {
                  'timesheetId': widget.timesheetId,
                  'activities': toCreate,
                },
              },
            ),
          );
          if (result.hasException) {
            errorMessage = _extractError(result);
          }
        }

        if (toUpdate.isNotEmpty && errorMessage == null) {
          final result = await client.mutate(
            MutationOptions(
              document: gql(_activitiesUpdateMutation),
              variables: {
                'input': {
                  'timesheetId': widget.timesheetId,
                  'activities': toUpdate,
                },
              },
            ),
          );
          if (result.hasException) {
            errorMessage = _extractError(result);
          }
        }

        if (toDeleteIds.isNotEmpty && errorMessage == null) {
          final result = await client.mutate(
            MutationOptions(
              document: gql(_activitiesDeleteMutation),
              variables: {
                'input': {
                  'timesheetId': widget.timesheetId,
                  'activitiesIds': toDeleteIds,
                },
              },
            ),
          );
          if (result.hasException) {
            errorMessage = _extractError(result);
          }
        }

        if (!mounted) return;

        if (errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
          );
          setState(() => _saving = false);
          return;
        }
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.clone
              ? 'Attività duplicata con successo'
              : 'Attività aggiornata con successo'),
        ),
      );
      context.pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Errore: $e'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => _saving = false);
    }
  }

  // ---------------------------------------------------------------------------
  // Error helpers
  // ---------------------------------------------------------------------------

  String _extractError(QueryResult result) {
    if (result.exception?.graphqlErrors.isNotEmpty == true) {
      return result.exception!.graphqlErrors.first.message;
    }
    return 'Errore durante il salvataggio';
  }

  void _showError(QueryResult result) {
    final message = _extractError(result);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
    setState(() => _saving = false);
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final title = widget.clone ? 'Duplica Attività' : 'Modifica Attività';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: ActivityForm(
        month: widget.month,
        saving: _saving,
        onSubmit: _onSubmit,
        initialDate: _initialDate,
        initialTimes: _initialTimes,
        initialCustomerId: _initialCustomerId,
        initialProjectId: _initialProjectId,
        initialDescription: _initialDescription,
      ),
    );
  }
}
