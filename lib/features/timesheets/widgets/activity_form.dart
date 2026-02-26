import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesheet/providers/auth_provider.dart';
import 'package:timesheet/core/extensions.dart';

// ---------------------------------------------------------------------------
// TimeRange model
// ---------------------------------------------------------------------------

class TimeRange {
  final String? id;
  int startHour;
  int startMinute;
  int endHour;
  int endMinute;

  TimeRange({
    this.id,
    this.startHour = 9,
    this.startMinute = 0,
    this.endHour = 18,
    this.endMinute = 0,
  });

  TimeRange copyWith({
    String? id,
    int? startHour,
    int? startMinute,
    int? endHour,
    int? endMinute,
  }) {
    return TimeRange(
      id: id ?? this.id,
      startHour: startHour ?? this.startHour,
      startMinute: startMinute ?? this.startMinute,
      endHour: endHour ?? this.endHour,
      endMinute: endMinute ?? this.endMinute,
    );
  }
}

// ---------------------------------------------------------------------------
// ActivityFormData — returned to the parent screens
// ---------------------------------------------------------------------------

class ActivityFormData {
  final DateTime date;
  final List<TimeRange> times;
  final String? customerId;
  final String? projectId;
  final String? description;

  ActivityFormData({
    required this.date,
    required this.times,
    this.customerId,
    this.projectId,
    this.description,
  });
}

// ---------------------------------------------------------------------------
// Utility: build activity input maps from form data
// ---------------------------------------------------------------------------

List<Map<String, dynamic>> getActivities(
  DateTime date,
  List<TimeRange> times,
  String? customerId,
  String? projectId,
  String? description, {
  bool creating = true,
}) {
  return times.map((t) {
    final start = DateTime(date.year, date.month, date.day, t.startHour,
            t.startMinute)
        .millisecondsSinceEpoch
        .toDouble();
    final end = DateTime(
            date.year, date.month, date.day, t.endHour, t.endMinute)
        .millisecondsSinceEpoch
        .toDouble();

    final map = <String, dynamic>{
      'startTime': start,
      'endTime': end,
      if (customerId != null && customerId.isNotEmpty) 'customerId': customerId,
      if (projectId != null && projectId.isNotEmpty) 'projectId': projectId,
      if (description != null && description.isNotEmpty)
        'description': description,
    };

    if (!creating && t.id != null) {
      map['id'] = t.id;
    }

    return map;
  }).toList();
}

// ---------------------------------------------------------------------------
// GraphQL documents
// ---------------------------------------------------------------------------

const String _customersQuery = r'''
  query CustomersSearcher($pageIndex: Int!, $pageSize: Int!, $filter: CustomerFilter) {
    customers(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data { id name projects { id } }
    }
  }
''';

const String _projectsQuery = r'''
  query ProjectsSearcher($pageIndex: Int!, $pageSize: Int!, $filter: ProjectFilter) {
    projects(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data { id name tag }
    }
  }
''';

// ---------------------------------------------------------------------------
// ActivityForm widget
// ---------------------------------------------------------------------------

class ActivityForm extends StatefulWidget {
  /// The timesheet month in "yyyy-MM" format.
  final String month;

  /// Optional initial values (for edit / clone).
  final DateTime? initialDate;
  final List<TimeRange>? initialTimes;
  final String? initialCustomerId;
  final String? initialProjectId;
  final String? initialDescription;

  /// Whether the form is currently submitting (disables save button).
  final bool saving;

  /// Callback with the validated form data.
  final void Function(ActivityFormData data) onSubmit;

  const ActivityForm({
    super.key,
    required this.month,
    required this.onSubmit,
    this.initialDate,
    this.initialTimes,
    this.initialCustomerId,
    this.initialProjectId,
    this.initialDescription,
    this.saving = false,
  });

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _selectedDate;
  late List<TimeRange> _times;
  String? _customerId;
  String? _projectId;
  late TextEditingController _descriptionController;

  // Data fetched from the server
  List<Map<String, dynamic>> _customers = [];
  List<Map<String, dynamic>> _projects = [];
  bool _loadingCustomers = false;
  bool _loadingProjects = false;
  bool _initialFetchDone = false;

  // Derived from the month string
  late DateTime _monthStart;
  late DateTime _monthEnd;

  @override
  void initState() {
    super.initState();

    // Parse the month "yyyy-MM"
    final parts = widget.month.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    _monthStart = DateTime(year, month, 1);
    _monthEnd = DateTime(year, month + 1, 0); // last day of month

    _selectedDate = widget.initialDate ?? _clampDate(DateTime.now());
    _times = widget.initialTimes != null && widget.initialTimes!.isNotEmpty
        ? widget.initialTimes!.map((t) => t.copyWith()).toList()
        : [TimeRange()];
    _customerId = widget.initialCustomerId;
    _projectId = widget.initialProjectId;
    _descriptionController =
        TextEditingController(text: widget.initialDescription ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialFetchDone) {
      _initialFetchDone = true;
      final auth = context.read<AuthProvider>();
      if (auth.enableCustomers) {
        _fetchCustomers();
      }
      if (auth.enableProjects) {
        _fetchProjects();
      }
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  DateTime _clampDate(DateTime d) {
    if (d.isBefore(_monthStart)) return _monthStart;
    if (d.isAfter(_monthEnd)) return _monthEnd;
    return DateTime(d.year, d.month, d.day);
  }

  int _roundMinute(int minute, int step) {
    if (step <= 1) return minute;
    final rounded = (minute / step).round() * step;
    return rounded >= 60 ? 60 - step : rounded;
  }

  String _formatTime(int hour, int minute) {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  // ---------------------------------------------------------------------------
  // Data fetching
  // ---------------------------------------------------------------------------

  Future<void> _fetchCustomers() async {
    setState(() => _loadingCustomers = true);
    try {
      final client = GraphQLProvider.of(context).value;
      final result = await client.query(
        QueryOptions(
          document: gql(_customersQuery),
          variables: const {
            'pageIndex': 0,
            'pageSize': 1000,
            'filter': {'isActive': true},
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      if (result.data != null && !result.hasException) {
        final data = result.data!['customers']['data'] as List;
        setState(() {
          _customers =
              data.map((c) => Map<String, dynamic>.from(c as Map)).toList();
        });
      }
    } catch (_) {
      // Silently handle — dropdown will be empty
    } finally {
      if (mounted) setState(() => _loadingCustomers = false);
    }
  }

  Future<void> _fetchProjects() async {
    setState(() => _loadingProjects = true);
    try {
      final client = GraphQLProvider.of(context).value;
      final result = await client.query(
        QueryOptions(
          document: gql(_projectsQuery),
          variables: const {
            'pageIndex': 0,
            'pageSize': 1000,
            'filter': {'status': 'IN_PROGRESS'},
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      if (result.data != null && !result.hasException) {
        final data = result.data!['projects']['data'] as List;
        setState(() {
          _projects =
              data.map((p) => Map<String, dynamic>.from(p as Map)).toList();
        });
      }
    } catch (_) {
      // Silently handle
    } finally {
      if (mounted) setState(() => _loadingProjects = false);
    }
  }

  // ---------------------------------------------------------------------------
  // Filtered projects: when a customer is selected, show only that customer's
  // projects (by matching project ids in customer.projects).
  // ---------------------------------------------------------------------------

  List<Map<String, dynamic>> get _filteredProjects {
    if (_customerId == null || _customerId!.isEmpty) {
      return _projects;
    }
    // Find the selected customer
    final customer = _customers.cast<Map<String, dynamic>?>().firstWhere(
          (c) => c?['id'] == _customerId,
          orElse: () => null,
        );
    if (customer == null) return _projects;

    final customerProjects = customer['projects'] as List?;
    if (customerProjects == null || customerProjects.isEmpty) {
      return _projects;
    }

    final projectIds =
        customerProjects.map((p) => (p as Map)['id'] as String).toSet();
    return _projects.where((p) => projectIds.contains(p['id'])).toList();
  }

  // ---------------------------------------------------------------------------
  // Time picker helpers
  // ---------------------------------------------------------------------------

  Future<void> _pickTime({
    required int index,
    required bool isStart,
  }) async {
    final auth = context.read<AuthProvider>();
    final step = auth.minuteStep;
    final range = _times[index];
    final initial = isStart
        ? TimeOfDay(
            hour: range.startHour,
            minute: _roundMinute(range.startMinute, step))
        : TimeOfDay(
            hour: range.endHour,
            minute: _roundMinute(range.endMinute, step));

    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked == null) return;

    final roundedMinute = _roundMinute(picked.minute, step);

    setState(() {
      if (isStart) {
        _times[index] = range.copyWith(
          startHour: picked.hour,
          startMinute: roundedMinute,
        );
      } else {
        _times[index] = range.copyWith(
          endHour: picked.hour,
          endMinute: roundedMinute,
        );
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Date picker
  // ---------------------------------------------------------------------------

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _monthStart,
      lastDate: _monthEnd,
      locale: const Locale('it'),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit(
      ActivityFormData(
        date: _selectedDate,
        times: _times,
        customerId:
            (_customerId != null && _customerId!.isNotEmpty) ? _customerId : null,
        projectId:
            (_projectId != null && _projectId!.isNotEmpty) ? _projectId : null,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------------------------------------------------------------
          // Date picker
          // ---------------------------------------------------------------
          Text('Data', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          InkWell(
            onTap: _pickDate,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(_selectedDate.formatDate()),
            ),
          ),

          const SizedBox(height: 24),

          // ---------------------------------------------------------------
          // Time ranges
          // ---------------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Orari', style: theme.textTheme.titleSmall),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                tooltip: 'Aggiungi intervallo',
                onPressed: () {
                  setState(() {
                    _times.add(TimeRange());
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 4),
          ..._buildTimeRanges(auth),

          const SizedBox(height: 24),

          // ---------------------------------------------------------------
          // Customer dropdown
          // ---------------------------------------------------------------
          if (auth.enableCustomers) ...[
            Text('Cliente', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            _loadingCustomers
                ? const LinearProgressIndicator()
                : DropdownButtonFormField<String>(
                    initialValue: _customers.any((c) => c['id'] == _customerId)
                        ? _customerId
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Seleziona cliente',
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Nessuno'),
                      ),
                      ..._customers.map((c) => DropdownMenuItem<String>(
                            value: c['id'] as String,
                            child: Text(c['name'] as String),
                          )),
                    ],
                    onChanged: (val) {
                      setState(() {
                        _customerId = val;
                        // Reset project when customer changes, if current
                        // project is not in the new filtered list
                        if (_projectId != null) {
                          final filtered = _filteredProjects;
                          if (!filtered.any((p) => p['id'] == _projectId)) {
                            _projectId = null;
                          }
                        }
                      });
                    },
                    validator: auth.customerRequired
                        ? (val) {
                            if (val == null || val.isEmpty) {
                              return 'Il cliente è obbligatorio';
                            }
                            return null;
                          }
                        : null,
                  ),
            const SizedBox(height: 24),
          ],

          // ---------------------------------------------------------------
          // Project dropdown
          // ---------------------------------------------------------------
          if (auth.enableProjects) ...[
            Text('Progetto', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            _loadingProjects
                ? const LinearProgressIndicator()
                : DropdownButtonFormField<String>(
                    initialValue: _filteredProjects.any((p) => p['id'] == _projectId)
                        ? _projectId
                        : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Seleziona progetto',
                    ),
                    items: [
                      const DropdownMenuItem<String>(
                        value: '',
                        child: Text('Nessuno'),
                      ),
                      ..._filteredProjects.map((p) {
                        final tag = p['tag'] as String?;
                        final name = p['name'] as String;
                        final label =
                            tag != null && tag.isNotEmpty ? '[$tag] $name' : name;
                        return DropdownMenuItem<String>(
                          value: p['id'] as String,
                          child: Text(label),
                        );
                      }),
                    ],
                    onChanged: (val) {
                      setState(() => _projectId = val);
                    },
                    validator: auth.projectRequired
                        ? (val) {
                            if (val == null || val.isEmpty) {
                              return 'Il progetto è obbligatorio';
                            }
                            return null;
                          }
                        : null,
                  ),
            const SizedBox(height: 24),
          ],

          // ---------------------------------------------------------------
          // Description
          // ---------------------------------------------------------------
          Text('Descrizione', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Descrizione attività',
            ),
            maxLines: 4,
            textInputAction: TextInputAction.newline,
          ),

          const SizedBox(height: 32),

          // ---------------------------------------------------------------
          // Submit button
          // ---------------------------------------------------------------
          FilledButton.icon(
            onPressed: widget.saving ? null : _handleSubmit,
            icon: widget.saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            label: Text(widget.saving ? 'Salvataggio...' : 'Salva'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Time range rows
  // ---------------------------------------------------------------------------

  List<Widget> _buildTimeRanges(AuthProvider auth) {
    final step = auth.minuteStep;
    return List.generate(_times.length, (index) {
      final range = _times[index];
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            // Start time
            Expanded(
              child: InkWell(
                onTap: () => _pickTime(index: index, isStart: true),
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Inizio',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  child: Text(
                    _formatTime(
                      range.startHour,
                      _roundMinute(range.startMinute, step),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.arrow_forward, size: 18),
            ),
            // End time
            Expanded(
              child: InkWell(
                onTap: () => _pickTime(index: index, isStart: false),
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fine',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                  child: Text(
                    _formatTime(
                      range.endHour,
                      _roundMinute(range.endMinute, step),
                    ),
                  ),
                ),
              ),
            ),
            // Remove button (only show if more than 1 range)
            if (_times.length > 1)
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.trashCan,
                  size: 16,
                  color: Colors.red,
                ),
                tooltip: 'Rimuovi intervallo',
                onPressed: () {
                  setState(() {
                    _times.removeAt(index);
                  });
                },
              )
            else
              const SizedBox(width: 48), // spacer to keep alignment
          ],
        ),
      );
    });
  }
}
