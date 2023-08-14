import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timesheet/schema.graphql.dart';
import 'package:timesheet/screens/timesheet.graphql.dart';

class ActivityCreateArguments {
  final Fragment$TimesheetDetail timesheet;

  ActivityCreateArguments(this.timesheet);
}

class ActivityCreate extends StatefulHookWidget {
  const ActivityCreate({Key? key}) : super(key: key);

  @override
  State<ActivityCreate> createState() => _ActivityCreateState();
}

class _ActivityCreateState extends State<ActivityCreate> {
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ActivityCreateArguments;
    final timesheet = args.timesheet;

    final formKey = GlobalKey<FormState>();
    final create =
        useMutation$ActivitiesCreate(WidgetOptions$Mutation$ActivitiesCreate(
      onCompleted: (p0, p1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Attività inserita')),
        );

        Navigator.pop(context);
      },
    ));

    if (create.result.hasException) {
      return Text(create.result.exception.toString());
    }

    if (create.result.isLoading) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuova attività'),
        ),
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    minLines: 5,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: descriptionController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          DateTime startTime =
                              DateTime(2023, 8, 14, 19, 0, 0, 0, 0);
                          DateTime endTime =
                              DateTime(2023, 8, 14, 20, 0, 0, 0, 0);

                          List<Input$ActivityCreateInput> activities = [
                            Input$ActivityCreateInput(
                                startTime:
                                    startTime.millisecondsSinceEpoch.toDouble(),
                                endTime:
                                    endTime.millisecondsSinceEpoch.toDouble(),
                                description: descriptionController.text)
                          ];

                          final variables = Variables$Mutation$ActivitiesCreate(
                              input: Input$ActivitiesCreateInput(
                                  timesheetId: timesheet.id,
                                  activities: activities));

                          create.runMutation(variables);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
