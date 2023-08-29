import 'package:flutter/material.dart';
import 'widgets/timesheets_table.dart';

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
