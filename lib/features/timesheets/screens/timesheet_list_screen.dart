import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/core/time_utils.dart';
import 'package:timesheet/core/extensions.dart';
import 'package:timesheet/shared/widgets/status_icon.dart';

const String _timesheetsQuery = r'''
  query Timesheets($pageIndex: Int!, $pageSize: Int!, $filter: TimesheetFilter) {
    timesheets(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data { id month status totalTime }
      pageInfo { total }
    }
  }
''';

const String _yearsQuery = r'''
  query Years { years }
''';

class TimesheetListScreen extends StatefulWidget {
  const TimesheetListScreen({super.key});

  @override
  State<TimesheetListScreen> createState() => _TimesheetListScreenState();
}

class _TimesheetListScreenState extends State<TimesheetListScreen> {
  late int _selectedYear;
  List<int> _availableYears = [];
  List<Map<String, dynamic>> _timesheets = [];
  bool _loading = true;
  String? _error;
  bool _initialFetchDone = false;

  @override
  void initState() {
    super.initState();
    _selectedYear = DateTime.now().year;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialFetchDone) {
      _initialFetchDone = true;
      _fetchYears();
      _fetchTimesheets();
    }
  }

  GraphQLClient get _client => GraphQLProvider.of(context).value;

  String _extractErrorMessage(OperationException? exception) {
    if (exception == null) return 'Errore sconosciuto';
    // Check operation-level graphql errors
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    // Check link-level errors (ServerException with parsedResponse)
    final linkEx = exception.linkException;
    if (linkEx is ServerException) {
      final errors = linkEx.parsedResponse?.errors ?? [];
      if (errors.isNotEmpty) {
        return errors.first.message;
      }
    }
    return 'Errore di connessione al server';
  }

  Future<void> _fetchYears() async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(_yearsQuery),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        debugPrint('Years query error: ${result.exception}');
        return;
      }

      final years = (result.data?['years'] as List<dynamic>?)
              ?.map((e) => e is int ? e : int.parse(e.toString()))
              .toList() ??
          [];

      if (mounted) {
        setState(() {
          _availableYears = years..sort();
        });
      }
    } catch (e) {
      debugPrint('Years fetch error: $e');
    }
  }

  Future<void> _fetchTimesheets() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(_timesheetsQuery),
          variables: {
            'pageIndex': 0,
            'pageSize': 12,
            'filter': {
              'year': _selectedYear.toString(),
            },
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        if (mounted) {
          setState(() {
            _error = _extractErrorMessage(result.exception);
            _loading = false;
          });
        }
        return;
      }

      final data =
          (result.data?['timesheets']?['data'] as List<dynamic>?) ?? [];

      if (mounted) {
        setState(() {
          _timesheets = data.cast<Map<String, dynamic>>();
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      _fetchYears(),
      _fetchTimesheets(),
    ]);
  }

  List<_MonthRow> _buildMonthRows() {
    final now = DateTime.now();
    final monthCount =
        _selectedYear == now.year ? now.month : 12;

    final rows = <_MonthRow>[];

    for (int m = 1; m <= monthCount; m++) {
      final monthStr = m.toString().padLeft(2, '0');
      final monthKey = '$_selectedYear-$monthStr';

      final match = _timesheets.cast<Map<String, dynamic>?>().firstWhere(
        (t) {
          final tMonth = t?['month'] as String?;
          if (tMonth == null) return false;
          final parts = tMonth.split('-');
          if (parts.length < 2) return false;
          return int.tryParse(parts[1]) == m;
        },
        orElse: () => null,
      );

      if (match != null) {
        rows.add(_MonthRow(
          month: match['month'] as String? ?? monthKey,
          status: match['status'] as String? ?? 'NOT-FOUND',
          totalTime: (match['totalTime'] as num?)?.toInt() ?? 0,
          id: match['id'] as String? ?? '',
        ));
      } else {
        rows.add(_MonthRow(
          month: monthKey,
          status: 'NOT-FOUND',
          totalTime: 0,
          id: '',
        ));
      }
    }

    return rows;
  }

  String _formatMonthName(String monthKey) {
    final parts = monthKey.split('-');
    if (parts.length < 2) return monthKey;
    final year = int.tryParse(parts[0]) ?? DateTime.now().year;
    final month = int.tryParse(parts[1]) ?? 1;
    final date = DateTime(year, month);
    final formatted = DateFormat('MMMM', 'it').format(date);
    return formatted.capitalize();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rows = _buildMonthRows();
    final totalMillis = rows.fold<int>(0, (sum, r) => sum + r.totalTime);

    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Errore nel caricamento',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _error!,
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _onRefresh,
                        child: const Text('Riprova'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: Column(
                    children: [
                      _buildYearSelector(theme),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          itemCount: rows.length + 1,
                          itemBuilder: (context, index) {
                            if (index == rows.length) {
                              return _buildTotalRow(theme, totalMillis);
                            }
                            return _buildMonthCard(
                                context, theme, rows[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildYearSelector(ThemeData theme) {
    final years = _availableYears.isNotEmpty
        ? List<int>.from(_availableYears)
        : [DateTime.now().year];

    if (!years.contains(_selectedYear)) {
      years.add(_selectedYear);
      years.sort();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Timesheet $_selectedYear',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButton<int>(
            value: _selectedYear,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.calendar_today, size: 20),
            items: years.reversed
                .map((y) => DropdownMenuItem(
                      value: y,
                      child: Text(y.toString()),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null && value != _selectedYear) {
                setState(() {
                  _selectedYear = value;
                });
                _fetchTimesheets();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMonthCard(
      BuildContext context, ThemeData theme, _MonthRow row) {
    final isNotFound = row.status == 'NOT-FOUND';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          _formatMonthName(row.month),
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: isNotFound
                ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              toTime(row.totalTime),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontFeatures: const [FontFeature.tabularFigures()],
                color: isNotFound
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                    : null,
              ),
            ),
            const SizedBox(width: 12),
            StatusIcon(status: row.status, size: 12),
          ],
        ),
        onTap: () {
          context.go('/timesheets/${row.month}');
        },
      ),
    );
  }

  Widget _buildTotalRow(ThemeData theme, int totalMillis) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        color: theme.colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTALE',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              Text(
                toTime(totalMillis),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFeatures: const [FontFeature.tabularFigures()],
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MonthRow {
  final String month;
  final String status;
  final int totalTime;
  final String id;

  const _MonthRow({
    required this.month,
    required this.status,
    required this.totalTime,
    required this.id,
  });
}
