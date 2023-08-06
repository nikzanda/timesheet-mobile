import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/helpers/helpers.dart';
import 'queries.graphql.dart' as constants;

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

class TimesheetTable extends StatelessWidget {
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

    return Query(
        options:
            QueryOptions(document: gql(constants.timesheetsQuery), variables: {
          'pageIndex': 0,
          'pageSize': 12,
          'filter': {'year': now.year.toString()}
        }),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const CircularProgressIndicator();
          }

          final timesheets = result.data!['timesheets']['data'];

          return DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Mese')),
                DataColumn(label: Text('Monte ore')),
                DataColumn(label: Text('Stato')),
              ],
              rows: timesheets.map<DataRow>((timesheet) {
                final month = DateFormat('MMMM')
                    .format(DateTime.parse(timesheet['month'] + '-01'));
                final totalTime = toTime(timesheet['totalTime']);

                final backgroundColor =
                    statuses[timesheet['status']]!['color'] as Color;

                return DataRow(cells: <DataCell>[
                  DataCell(Text(month)),
                  DataCell(Text(totalTime)),
                  DataCell(Chip(
                    backgroundColor: backgroundColor,
                    avatar:
                        const FaIcon(FontAwesomeIcons.pen, color: Colors.white),
                    label: Text(
                      timesheet['status'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
                ]);
              }).toList());
        });
  }
}
