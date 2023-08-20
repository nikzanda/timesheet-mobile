import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:timesheet/schema.graphql.dart';
import 'package:timesheet/helpers/date_utils.dart';
import 'package:timesheet/screens/customers/widgets/customer_dropdownbutton.dart';
import 'package:timesheet/screens/projects/widgets/project_dropdownbutton.dart';
import 'package:timesheet/screens/timesheets/timesheet.graphql.dart';

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
  DateTime? selectedDate = DateTime.now();
  TimeRange? selectedTimeRange;
  String? customerId;
  String? projectId;

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
                  // Date picker
                  ListTile(
                    title: Text(selectedDate == null
                        ? 'Select Date'
                        : 'Selected Date: ${selectedDate!.toLocal()}'),
                    onTap: () async {
                      final month = DateTime.parse('${timesheet.month}-01');

                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate:
                            DateTime.now(), // TODO: initialDate month != now
                        firstDate: DateTime(month.year, month.month, 1),
                        lastDate: DateTime(month.year, month.month + 1, 0),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                  ),
                  // Time range picker
                  ListTile(
                    title: Text(selectedTimeRange == null
                        ? 'Select Time Range'
                        : 'Selected Time Range: ${selectedTimeRange!.startTime.format(context)} - ${selectedTimeRange!.endTime.format(context)}'),
                    onTap: () async {
                      final TimeRange? result = await showTimeRangePicker(
                        context: context,
                      );
                      if (result != null) {
                        setState(() {
                          selectedTimeRange = result;
                        });
                      }
                    },
                  ),
                  // Customer
                  // CustomerDropdownButton(customerId, onCha)
                  CustomerDropdownButton(
                    value: customerId,
                    onChanged: (newValue) {
                      setState(() {
                        customerId = newValue;
                      });
                    },
                  ),
                  // Project
                  ProjectDropdownButton(
                    value: projectId,
                    onChanged: (newValue) {
                      setState(() {
                        projectId = newValue;
                      });
                    },
                  ),
                  // Description
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
                        if (formKey.currentState!.validate()) {
                          DateTime startTime = selectedDate!.copyWith(
                              hour: selectedTimeRange!.startTime.hour,
                              minute: selectedTimeRange!.startTime.minute);
                          DateTime endTime = selectedDate!.copyWith(
                              hour: selectedTimeRange!.endTime.hour,
                              minute: selectedTimeRange!.endTime.minute);

                          List<Input$ActivityCreateInput> activities = [
                            Input$ActivityCreateInput(
                              startTime:
                                  startTime.millisecondsSinceEpoch.toDouble(),
                              endTime:
                                  endTime.millisecondsSinceEpoch.toDouble(),
                              customerId: customerId,
                              projectId: projectId,
                              description: descriptionController.text,
                            )
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
