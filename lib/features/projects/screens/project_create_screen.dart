import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/projects/widgets/project_form.dart';

// ---------------------------------------------------------------------------
// GraphQL mutation
// ---------------------------------------------------------------------------

const String _projectCreateMutation = r'''
  mutation ProjectCreate($input: ProjectCreateInput!) {
    projectCreate(input: $input) {
      project { id name color status description tag }
    }
  }
''';

// ---------------------------------------------------------------------------
// ProjectCreateScreen
// ---------------------------------------------------------------------------

class ProjectCreateScreen extends StatefulWidget {
  const ProjectCreateScreen({super.key});

  @override
  State<ProjectCreateScreen> createState() => _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends State<ProjectCreateScreen> {
  bool _saving = false;

  // ---------------------------------------------------------------------------
  // Submit handler
  // ---------------------------------------------------------------------------

  Future<void> _onSubmit(ProjectFormData data) async {
    setState(() => _saving = true);

    try {
      final input = <String, dynamic>{
        'name': data.name,
      };
      if (data.colorHex != null) {
        input['color'] = data.colorHex;
      }
      if (data.tag != null) {
        input['tag'] = data.tag;
      }
      if (data.description != null) {
        input['description'] = data.description;
      }

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_projectCreateMutation),
          variables: {'input': input},
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Progetto creato con successo')),
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
        title: const Text('Nuovo Progetto'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: ProjectForm(
        saving: _saving,
        onSubmit: _onSubmit,
        showStatus: false,
      ),
    );
  }
}
