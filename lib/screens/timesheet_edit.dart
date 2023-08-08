import 'package:flutter/material.dart';

class TimesheetEditArguments {
  final String timesheetId;

  TimesheetEditArguments(this.timesheetId);
}

class TimesheetEdit extends StatelessWidget {
  const TimesheetEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TimesheetEditArguments;

    print(args.timesheetId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
