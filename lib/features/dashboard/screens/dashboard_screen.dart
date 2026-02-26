import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/core/extensions.dart';
import 'package:timesheet/core/time_utils.dart';
import 'package:timesheet/providers/auth_provider.dart';

// ---------------------------------------------------------------------------
// GraphQL queries
// ---------------------------------------------------------------------------

const String _statisticsByMonthQuery = r'''
  query StatisticsByMonth($year: Int) {
    statisticsByMonth(year: $year) {
      month
      value
    }
  }
''';

const String _statisticsByTagQuery = r'''
  query StatisticsByTag($startMonth: YearMonth, $endMonth: YearMonth) {
    statisticsByTag(startMonth: $startMonth, endMonth: $endMonth) {
      tag
      value
    }
  }
''';

const String _statisticsByCustomerQuery = r'''
  query StatisticsByCustomer($startMonth: YearMonth, $endMonth: YearMonth) {
    statisticsByCustomer(startMonth: $startMonth, endMonth: $endMonth) {
      customer { id name }
      value
    }
  }
''';

const String _statisticsByProjectQuery = r'''
  query StatisticsByProject($startMonth: YearMonth, $endMonth: YearMonth) {
    statisticsByProject(startMonth: $startMonth, endMonth: $endMonth) {
      project { id name }
      value
    }
  }
''';

// ---------------------------------------------------------------------------
// Chart colors
// ---------------------------------------------------------------------------

const List<Color> _chartColors = [
  Color(0xFF1677FF),
  Color(0xFF52C41A),
  Color(0xFFFA8C16),
  Color(0xFFF5222D),
  Color(0xFF722ED1),
  Color(0xFF13A8A8),
  Color(0xFFEB2F96),
  Color(0xFF2F54EB),
  Color(0xFF8BBB11),
  Color(0xFFFADB14),
];

// ---------------------------------------------------------------------------
// DashboardScreen
// ---------------------------------------------------------------------------

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> _monthData = [];
  List<Map<String, dynamic>> _tagData = [];
  List<Map<String, dynamic>> _customerData = [];
  List<Map<String, dynamic>> _projectData = [];
  bool _loading = true;
  String? _error;
  bool _initialFetchDone = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialFetchDone) {
      _initialFetchDone = true;
      _fetchAll();
    }
  }

  GraphQLClient get _client => GraphQLProvider.of(context).value;

  // ---------------------------------------------------------------------------
  // Data fetching
  // ---------------------------------------------------------------------------

  Future<void> _fetchAll() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final auth = context.read<AuthProvider>();
      final year = DateTime.now().year;

      final futures = <Future<QueryResult>>[
        _client.query(QueryOptions(
          document: gql(_statisticsByMonthQuery),
          variables: {'year': year},
          fetchPolicy: FetchPolicy.networkOnly,
        )),
      ];

      if (auth.enableProjects) {
        futures.add(_client.query(QueryOptions(
          document: gql(_statisticsByTagQuery),
          fetchPolicy: FetchPolicy.networkOnly,
        )));
        futures.add(_client.query(QueryOptions(
          document: gql(_statisticsByProjectQuery),
          fetchPolicy: FetchPolicy.networkOnly,
        )));
      }

      if (auth.enableCustomers) {
        futures.add(_client.query(QueryOptions(
          document: gql(_statisticsByCustomerQuery),
          fetchPolicy: FetchPolicy.networkOnly,
        )));
      }

      final results = await Future.wait(futures);

      if (!mounted) return;

      // Check for errors
      for (final r in results) {
        if (r.hasException) {
          setState(() {
            _error = _extractErrorMessage(r.exception);
            _loading = false;
          });
          return;
        }
      }

      int idx = 0;

      // Month data (always present)
      final monthResult = results[idx++];
      _monthData = _parseList(monthResult.data?['statisticsByMonth']);

      // Tag + Project (if enableProjects)
      if (auth.enableProjects) {
        final tagResult = results[idx++];
        _tagData = _parseList(tagResult.data?['statisticsByTag']);

        final projectResult = results[idx++];
        _projectData = _parseList(projectResult.data?['statisticsByProject']);
      }

      // Customer (if enableCustomers)
      if (auth.enableCustomers) {
        final customerResult = results[idx++];
        _customerData =
            _parseList(customerResult.data?['statisticsByCustomer']);
      }

      setState(() => _loading = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  List<Map<String, dynamic>> _parseList(dynamic data) {
    if (data == null) return [];
    return (data as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  String _extractErrorMessage(OperationException? exception) {
    if (exception == null) return 'Errore sconosciuto';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    return 'Errore di connessione al server';
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthProvider>();

    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Errore nel caricamento', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(_error!, style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchAll,
              child: const Text('Riprova'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchAll,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          _buildMonthChart(theme),
          if (auth.enableProjects && _tagData.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildPieSection(theme, 'Ore per Tag', _tagData, (e) => e['tag'] as String? ?? 'NO-TAG'),
          ],
          if (auth.enableCustomers && _customerData.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildPieSection(theme, 'Ore per Cliente', _customerData,
                (e) => (e['customer'] as Map?)?['name'] as String? ?? ''),
          ],
          if (auth.enableProjects && _projectData.isNotEmpty) ...[
            const SizedBox(height: 24),
            _buildProjectChart(theme),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Month bar chart
  // ---------------------------------------------------------------------------

  Widget _buildMonthChart(ThemeData theme) {
    final maxValue = _monthData.fold<double>(
      0,
      (max, e) => ((e['value'] as num?)?.toDouble() ?? 0) > max
          ? (e['value'] as num?)?.toDouble() ?? 0
          : max,
    );
    // Convert ms to hours for Y axis
    final maxHours = maxValue / (1000 * 60 * 60);
    final yMax = maxHours > 0 ? (maxHours * 1.2).ceilToDouble() : 10;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ore Mensili', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: yMax.toDouble(),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final ms = _monthData.length > groupIndex
                            ? (_monthData[groupIndex]['value'] as num?)
                                    ?.toDouble() ??
                                0
                            : 0.0;
                        return BarTooltipItem(
                          toTime(ms),
                          const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= _monthData.length) {
                            return const SizedBox.shrink();
                          }
                          final monthStr =
                              _monthData[idx]['month'] as String? ?? '';
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(_shortMonthLabel(monthStr),
                                style: const TextStyle(fontSize: 10)),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          return Text('${value.toInt()}h',
                              style: const TextStyle(fontSize: 10));
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: true, drawVerticalLine: false),
                  barGroups: List.generate(_monthData.length, (i) {
                    final ms =
                        (_monthData[i]['value'] as num?)?.toDouble() ?? 0;
                    final hours = ms / (1000 * 60 * 60);
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: hours,
                          color: theme.colorScheme.primary,
                          width: 16,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _shortMonthLabel(String yearMonth) {
    final parts = yearMonth.split('-');
    if (parts.length < 2) return yearMonth;
    final month = int.tryParse(parts[1]) ?? 1;
    final dt = DateTime(2024, month);
    return DateFormat('MMM', 'it').format(dt).capitalize();
  }

  // ---------------------------------------------------------------------------
  // Pie chart section (Tag / Customer)
  // ---------------------------------------------------------------------------

  Widget _buildPieSection(
    ThemeData theme,
    String title,
    List<Map<String, dynamic>> data,
    String Function(Map<String, dynamic>) labelExtractor,
  ) {
    final total =
        data.fold<double>(0, (sum, e) => sum + ((e['value'] as num?)?.toDouble() ?? 0));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: List.generate(data.length, (i) {
                    final value =
                        (data[i]['value'] as num?)?.toDouble() ?? 0;
                    final pct =
                        total > 0 ? (value / total * 100).toStringAsFixed(0) : '0';
                    return PieChartSectionData(
                      color: _chartColors[i % _chartColors.length],
                      value: value,
                      title: '$pct%',
                      titleStyle: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      radius: 50,
                      badgeWidget: null,
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Legend
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: List.generate(data.length, (i) {
                final label = labelExtractor(data[i]);
                final ms = (data[i]['value'] as num?)?.toDouble() ?? 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _chartColors[i % _chartColors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text('$label (${toTime(ms)})',
                        style: theme.textTheme.bodySmall),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Project horizontal bar chart
  // ---------------------------------------------------------------------------

  Widget _buildProjectChart(ThemeData theme) {
    final maxMs = _projectData.fold<double>(
      0,
      (max, e) => ((e['value'] as num?)?.toDouble() ?? 0) > max
          ? (e['value'] as num?)?.toDouble() ?? 0
          : max,
    );

    const rowHeight = 36.0;
    const nameWidth = 110.0;
    const timeWidth = 52.0;
    final maxChartHeight = MediaQuery.of(context).size.height * 0.45;
    final contentHeight = _projectData.length * rowHeight;
    final needsScroll = contentHeight > maxChartHeight;
    final displayHeight = needsScroll ? maxChartHeight : contentHeight;

    Widget rows = Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_projectData.length, (i) {
        final ms =
            (_projectData[i]['value'] as num?)?.toDouble() ?? 0;
        final name =
            (_projectData[i]['project'] as Map?)?['name'] as String? ?? '';
        final fraction = maxMs > 0 ? ms / maxMs : 0.0;
        final color = _chartColors[i % _chartColors.length];

        return SizedBox(
          height: rowHeight,
          child: Row(
            children: [
              SizedBox(
                width: nameWidth,
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic,
                        height: 20,
                        width: constraints.maxWidth * fraction,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(4),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: timeWidth,
                child: Text(
                  toTime(ms),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      }),
    );

    if (needsScroll) {
      rows = SizedBox(
        height: displayHeight,
        child: SingleChildScrollView(child: rows),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ore per Progetto', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            rows,
          ],
        ),
      ),
    );
  }
}
