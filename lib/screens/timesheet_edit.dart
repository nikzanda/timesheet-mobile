import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/screens/timesheet.graphql.dart';

class TimesheetEditArguments {
  final String timesheetId;

  TimesheetEditArguments(this.timesheetId);
}

class TimesheetEdit extends HookWidget {
  const TimesheetEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TimesheetEditArguments;
    final timesheetId = args.timesheetId;

    final result = useQuery$Timesheet(Options$Query$Timesheet(
      variables: Variables$Query$Timesheet(id: timesheetId)
    ));

    if (result.result.hasException) {
      return Text(result.result.exception.toString());
    }

    if (result.result.isLoading) {
      return const CircularProgressIndicator();
    }

    // final timesheet = result.result.data!['timesheet'] as Fragment$TimesheetDetail;
    final timesheet = result.result.data!['timesheet'];

    final month = DateFormat('MMMM yyyy').format(DateTime.parse('${timesheet['month']}-01'));
    // final month = DateFormat('MMMM').format(DateTime.parse('${timesheet.month}-01'));

    return Scaffold(
      appBar: AppBar(
        title: Text(month),
      ),
      body: Text(timesheet.toString())
    );
  }
}
