import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/helpers/helpers.dart';
import 'package:timesheet/schema.graphql.dart';
import '../timesheet.graphql.dart';
import '../timesheet_edit.dart';

class TimesheetTable extends HookWidget {
  const TimesheetTable({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    const statuses = {
      'NOT-FOUND': FaIcon(
        FontAwesomeIcons.calendarXmark,
        color: Colors.red,
      ),
      'OPEN': FaIcon(FontAwesomeIcons.pen, color: Color(0xff1890ff)),
      'PENDING': FaIcon(
        FontAwesomeIcons.userClock,
        color: Colors.orange,
      ),
      'REJECTED':
          FaIcon(FontAwesomeIcons.calendarXmark, color: Colors.redAccent),
      'CLOSED': FaIcon(
        FontAwesomeIcons.calendarCheck,
        color: Color(0xFF389e0d),
      ),
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

    // final timesheets = result.result.data!['timesheets']['data'] as List<Fragment$TimesheetListItem>;
    final timesheets = result.result.data!['timesheets']['data'];

    return DataTable(
        showCheckboxColumn: false,
        showBottomBorder: true,
        columns: const <DataColumn>[
          DataColumn(label: Text('Mese')),
          DataColumn(label: Text('Monte ore')),
          DataColumn(label: Text('Stato')),
        ],
        rows: timesheets.map<DataRow>(
          (timesheet) {
            // final month = DateFormat('MMMM')
            //     .format(DateTime.parse('${timesheet.month}-01'));
            // final totalTime = toTime(timesheet.totalTime);
            // final statusIcon = statuses[timesheet.status] as FaIcon;
            final month = DateFormat('MMMM')
                .format(DateTime.parse('${timesheet['month']}-01'));
            final totalTime = toTime(timesheet['totalTime']);
            final statusIcon = statuses[timesheet['status']] as FaIcon;

            return DataRow(
              cells: <DataCell>[
                DataCell(Text(month)),
                DataCell(Text(totalTime)),
                DataCell(statusIcon)
              ],
              onSelectChanged: (selected) {
                if (selected != null && selected) {
                  Navigator.pushNamed(context, '/timesheet',
                      arguments:
                          TimesheetEditArguments(timesheet['id'] as String));
                }
              },
            );
          },
        ).toList());
  }
}
