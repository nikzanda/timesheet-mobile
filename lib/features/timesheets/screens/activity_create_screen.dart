import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/timesheets/widgets/activity_form.dart';

// ---------------------------------------------------------------------------
// GraphQL mutation
// ---------------------------------------------------------------------------

const String _activitiesCreateMutation = r'''
  mutation ActivitiesCreate($input: ActivitiesCreateInput!) {
    activitiesCreate(input: $input) {
      timesheet { id month status totalTime }
    }
  }
''';

// ---------------------------------------------------------------------------
// ActivityCreateScreen
// ---------------------------------------------------------------------------

class ActivityCreateScreen extends StatefulWidget {
  final String month;
  final String timesheetId;

  const ActivityCreateScreen({
    super.key,
    required this.month,
    required this.timesheetId,
  });

  @override
  State<ActivityCreateScreen> createState() => _ActivityCreateScreenState();
}

class _ActivityCreateScreenState extends State<ActivityCreateScreen> {
  bool _saving = false;

  // ---------------------------------------------------------------------------
  // Submit handler: calls ActivitiesCreate and pops back
  // ---------------------------------------------------------------------------

  Future<void> _onSubmit(ActivityFormData data) async {
    setState(() => _saving = true);

    try {
      final activities = getActivities(
        data.date,
        data.times,
        data.customerId,
        data.projectId,
        data.description,
        creating: true,
      );

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_activitiesCreateMutation),
          variables: {
            'input': {
              'timesheetId': widget.timesheetId,
              'activities': activities,
            },
          },
        ),
      );

      if (!mounted) return;

      if (result.hasException) {
        final message = result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Errore durante il salvataggio';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
        setState(() => _saving = false);
        return;
      }

      // Success — navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Attività creata con successo')),
      );
      context.pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Errore: $e'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => _saving = false);
    }
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuova Attività'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: ActivityForm(
        month: widget.month,
        saving: _saving,
        onSubmit: _onSubmit,
      ),
    );
  }
}
