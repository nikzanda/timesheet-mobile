import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/schema.graphql.dart';
import 'package:timesheet/screens/timesheet.graphql.dart';
import '../helpers/helpers.dart';

class TimesheetList extends StatelessWidget {
  const TimesheetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Timesheet'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: TimesheetTable(key: key),
        ));
  }
}

class TimesheetTable extends HookWidget {
  const TimesheetTable({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    const statuses = {
      'NOT-FOUND': {
        'icon': FaIcon(
          FontAwesomeIcons.calendarXmark,
          color: Colors.white,
        ),
        'color': Colors.red
      },
      'OPEN': {
        'icon': FaIcon(FontAwesomeIcons.pen, color: Colors.white),
        'color': Color(0xff1890ff)
      },
      'PENDING': {
        'icon': FaIcon(
          FontAwesomeIcons.userClock,
          color: Colors.white,
        )
      },
      'REJECTED': {
        'icon': FaIcon(FontAwesomeIcons.calendarXmark, color: Colors.white),
        'color': Colors.redAccent,
      },
      'CLOSED': {
        'icon': FaIcon(
          FontAwesomeIcons.calendarCheck,
          color: Colors.white,
        ),
        'color': Color(0xFF389e0d)
      },
    };

    final result = useQuery$Timesheets(Options$Query$Timesheets(
        variables: Variables$Query$Timesheets(
            pageIndex: 0,
            pageSize: 12,
            filter: Input$TimesheetFilter(year: now.year.toString()))));

    if (result.result.hasException) {
      return Text(result.result.exception.toString());
    }

    if (result.result.isLoading) {
      return const CircularProgressIndicator();
    }

    final timesheets = result.result.data!['timesheets']['data'];

    return DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Mese')),
          DataColumn(label: Text('Monte ore')),
          DataColumn(label: Text('Stato')),
        ],
        rows: (timesheets as dynamic).map<DataRow>((timesheet) {
          final month = DateFormat('MMMM')
              .format(DateTime.parse(timesheet['month'] + '-01'));
          final totalTime = toTime(timesheet['totalTime']);

          final backgroundColor =
              statuses[timesheet['status']]!['color'] as Color;
          final icon = statuses[timesheet['status']]!['icon'] as FaIcon;

          return DataRow(cells: <DataCell>[
            DataCell(Text(month)),
            DataCell(Text(totalTime)),
            DataCell(Chip(
              backgroundColor: backgroundColor,
              avatar: icon,
              label: Text(
                (timesheet['status'] as String).toLowerCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ))
          ]);
        }).toList());
  }
}
