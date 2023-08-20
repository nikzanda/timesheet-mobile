import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timesheet/screens/timesheets/timesheet.graphql.dart';

import 'activity_create.dart';


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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/timesheet/activity/new',
                      arguments: ActivityCreateArguments(timesheet));
                },
                icon: const FaIcon(FontAwesomeIcons.plus))
          ],
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

            final List<RichText> subtitle = [];

            if (activity.customer != null) {
              final customer = activity.customer!;

              final String hexString =
                  customer.color != null ? customer.color! : '#000000';
              final hex = hexString.replaceAll('#', '');
              final int colorInt = int.parse(hex, radix: 16);
              final Color color = Color(colorInt).withOpacity(1.0);

              subtitle.add(RichText(
                  text: TextSpan(
                      text: 'Cliente: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    TextSpan(
                        text: customer.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          WidgetSpan(
                              child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: color,
                            size: 10,
                          ))
                        ])
                  ])));
            }

            if (activity.project != null) {
              final project = activity.project!;

              final String hexString =
                  project.color != null ? project.color! : '#000000';
              final hex = hexString.replaceAll('#', '');
              final int colorInt = int.parse(hex, radix: 16);
              final Color color = Color(colorInt).withOpacity(1.0);

              subtitle.add(RichText(
                  text: TextSpan(
                      text: 'Progetto: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                    TextSpan(
                        text: project.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          WidgetSpan(
                              child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: color,
                            size: 10,
                          ))
                        ])
                  ])));
            }

            if (activity.description != null && activity.description != '') {
              subtitle.add(RichText(
                  text: TextSpan(
                text: activity.description,
                style: const TextStyle(color: Colors.grey),
              )));
            }

            return ListTile(
              title: Text('$from - $to'),
              subtitle: subtitle.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: subtitle,
                    )
                  : null,
            );
          },
        ));
  }
}
