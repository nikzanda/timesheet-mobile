import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/projects/widgets/project_form.dart';

// ---------------------------------------------------------------------------
// GraphQL documents
// ---------------------------------------------------------------------------

const String _projectQuery = r'''
  query Project($id: ID!) {
    project(id: $id) { id name color status description tag }
  }
''';

const String _projectUpdateMutation = r'''
  mutation ProjectUpdate($input: ProjectUpdateInput!) {
    projectUpdate(input: $input) {
      project { id name color status description tag }
    }
  }
''';

// ---------------------------------------------------------------------------
// ProjectEditScreen
// ---------------------------------------------------------------------------

class ProjectEditScreen extends StatefulWidget {
  final String projectId;

  const ProjectEditScreen({super.key, required this.projectId});

  @override
  State<ProjectEditScreen> createState() => _ProjectEditScreenState();
}

class _ProjectEditScreenState extends State<ProjectEditScreen> {
  Map<String, dynamic>? _project;
  bool _loading = true;
  bool _hasError = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchProject());
  }

  // ---------------------------------------------------------------------------
  // Fetch project data
  // ---------------------------------------------------------------------------

  Future<void> _fetchProject() async {
    setState(() {
      _loading = true;
      _hasError = false;
    });

    try {
      final client = GraphQLProvider.of(context).value;
      final result = await client.query(
        QueryOptions(
          document: gql(_projectQuery),
          variables: {'id': widget.projectId},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (!mounted) return;

      if (result.hasException || result.data?['project'] == null) {
        setState(() {
          _hasError = true;
          _loading = false;
        });
        return;
      }

      setState(() {
        _project =
            Map<String, dynamic>.from(result.data!['project'] as Map);
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _loading = false;
      });
    }
  }

  // ---------------------------------------------------------------------------
  // Submit handler
  // ---------------------------------------------------------------------------

  Future<void> _onSubmit(ProjectFormData data) async {
    setState(() => _saving = true);

    try {
      final input = <String, dynamic>{
        'id': widget.projectId,
        'name': data.name,
        'status': data.status,
      };
      if (data.colorHex != null) {
        input['color'] = data.colorHex;
      } else {
        input['color'] = null;
      }
      if (data.tag != null) {
        input['tag'] = data.tag;
      } else {
        input['tag'] = null;
      }
      if (data.description != null) {
        input['description'] = data.description;
      } else {
        input['description'] = null;
      }

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_projectUpdateMutation),
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
        const SnackBar(content: Text('Progetto aggiornato con successo')),
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
    final theme = Theme.of(context);
    final title = _project != null
        ? (_project!['name'] as String? ?? 'Modifica Progetto')
        : 'Modifica Progetto';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Errore nel caricamento',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchProject,
                        child: const Text('Riprova'),
                      ),
                    ],
                  ),
                )
              : ProjectForm(
                  saving: _saving,
                  onSubmit: _onSubmit,
                  showStatus: true,
                  initialName: _project!['name'] as String?,
                  initialColorHex: _project!['color'] as String?,
                  initialTag: _project!['tag'] as String?,
                  initialDescription: _project!['description'] as String?,
                  initialStatus: _project!['status'] as String? ?? 'IN_PROGRESS',
                ),
    );
  }
}
