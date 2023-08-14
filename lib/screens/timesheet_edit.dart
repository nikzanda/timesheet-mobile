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
        variables: Variables$Query$Timesheet(id: timesheetId)));

    if (result.result.hasException) {
      return Text(result.result.exception.toString());
    }

    if (result.result.isLoading) {
      return const CircularProgressIndicator();
    }

    final timesheet =
        Fragment$TimesheetDetail.fromJson(result.result.data!['timesheet']);
    final month =
        DateFormat('MMMM yyyy').format(DateTime.parse('${timesheet.month}-01'));

    return Scaffold(
        appBar: AppBar(
          title: Text(month),
        ),
        body: ListView.builder(
          itemCount: timesheet.activities.length,
          itemBuilder: (context, index) {
            final activity = timesheet.activities[index];

            final from = DateFormat('dd MMMM HH:mm').format(
                DateTime.fromMillisecondsSinceEpoch(
                    activity.startTime.toInt()));
            final to = DateFormat('HH:mm').format(
                DateTime.fromMillisecondsSinceEpoch(activity.endTime!.toInt()));

            // Text(activity.description ?? '')
            return ListTile(
                title: Text('$from - $to'),
                subtitle: Text(activity.description ?? ''));
          },
        ));
  }
}
