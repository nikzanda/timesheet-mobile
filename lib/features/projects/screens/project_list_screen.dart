import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/core/constants.dart';
import 'package:timesheet/core/time_utils.dart';
import 'package:timesheet/shared/widgets/color_dot.dart';
import 'package:timesheet/shared/widgets/confirm_dialog.dart';

// ---------------------------------------------------------------------------
// GraphQL documents
// ---------------------------------------------------------------------------

const String _projectsQuery = r'''
  query Projects($pageIndex: Int!, $pageSize: Int!, $filter: ProjectFilter) {
    projects(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data {
        id name color status description tag totalTime createdAt
        canDelete { model count }
      }
      pageInfo { total }
    }
  }
''';

const String _projectDeleteMutation = r'''
  mutation ProjectDelete($input: ProjectDeleteInput!) {
    projectDelete(input: $input) {
      project { id }
    }
  }
''';

// ---------------------------------------------------------------------------
// ProjectListScreen
// ---------------------------------------------------------------------------

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  List<Map<String, dynamic>> _projects = [];
  int _total = 0;
  int _pageIndex = 0;
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;
  bool _initialFetchDone = false;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  String? _statusFilter; // null = all, 'IN_PROGRESS', 'COMPLETED'

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialFetchDone) {
      _initialFetchDone = true;
      _fetchProjects();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  GraphQLClient get _client => GraphQLProvider.of(context).value;

  // ---------------------------------------------------------------------------
  // Data fetching
  // ---------------------------------------------------------------------------

  Future<void> _fetchProjects({bool loadMore = false}) async {
    if (mounted) {
      setState(() {
        if (loadMore) {
          _loadingMore = true;
        } else {
          _loading = true;
          _error = null;
          _pageIndex = 0;
        }
      });
    }

    try {
      final filter = <String, dynamic>{};
      if (_searchText.isNotEmpty) {
        filter['name'] = _searchText;
      }
      if (_statusFilter != null) {
        filter['status'] = [_statusFilter];
      }

      final pageIndex = loadMore ? _pageIndex + 1 : 0;

      final result = await _client.query(
        QueryOptions(
          document: gql(_projectsQuery),
          variables: {
            'pageIndex': pageIndex,
            'pageSize': defaultPageSize,
            if (filter.isNotEmpty) 'filter': filter,
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (!mounted) return;

      if (result.hasException) {
        setState(() {
          _error = _extractErrorMessage(result.exception);
          _loading = false;
          _loadingMore = false;
        });
        return;
      }

      final data =
          (result.data?['projects']?['data'] as List<dynamic>?) ?? [];
      final total =
          (result.data?['projects']?['pageInfo']?['total'] as int?) ?? 0;

      final projects =
          data.map((p) => Map<String, dynamic>.from(p as Map)).toList();

      setState(() {
        if (loadMore) {
          _projects.addAll(projects);
          _pageIndex = pageIndex;
        } else {
          _projects = projects;
          _pageIndex = 0;
        }
        _total = total;
        _loading = false;
        _loadingMore = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _loading = false;
          _loadingMore = false;
        });
      }
    }
  }

  String _extractErrorMessage(OperationException? exception) {
    if (exception == null) return 'Errore sconosciuto';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    final linkEx = exception.linkException;
    if (linkEx is ServerException) {
      final errors = linkEx.parsedResponse?.errors ?? [];
      if (errors.isNotEmpty) {
        return errors.first.message;
      }
    }
    return 'Errore di connessione al server';
  }

  // ---------------------------------------------------------------------------
  // Delete
  // ---------------------------------------------------------------------------

  Future<void> _deleteProject(Map<String, dynamic> project) async {
    final canDelete = project['canDelete'] as List<dynamic>? ?? [];
    if (canDelete.isNotEmpty) {
      final details = canDelete
          .map((d) => '${d['model']}: ${d['count']}')
          .join(', ');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossibile eliminare: dipendenze ($details)'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final confirmed = await showConfirmDialog(
      context,
      title: 'Elimina progetto',
      content:
          'Sei sicuro di voler eliminare "${project['name']}"?',
      confirmText: 'Elimina',
      destructive: true,
    );

    if (!confirmed || !mounted) return;

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql(_projectDeleteMutation),
          variables: {
            'input': {'id': project['id']},
          },
        ),
      );

      if (!mounted) return;

      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_extractErrorMessage(result.exception)),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Progetto eliminato')),
      );
      _fetchProjects();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Errore: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------------

  Future<void> _navigateToCreate() async {
    final result = await context.push('/project-create');
    if (result == true) {
      _fetchProjects();
    }
  }

  Future<void> _navigateToEdit(String id) async {
    final result = await context.push('/project-edit/$id');
    if (result == true) {
      _fetchProjects();
    }
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  String _statusLabel(String status) {
    switch (status) {
      case 'IN_PROGRESS':
        return 'In Corso';
      case 'COMPLETED':
        return 'Completato';
      default:
        return status;
    }
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          // -----------------------------------------------------------------
          // Search bar
          // -----------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cerca progetti...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: _searchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchText = '');
                          _fetchProjects();
                        },
                      )
                    : null,
              ),
              onSubmitted: (val) {
                setState(() => _searchText = val.trim());
                _fetchProjects();
              },
            ),
          ),

          // -----------------------------------------------------------------
          // Status filter
          // -----------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SegmentedButton<String?>(
              segments: const [
                ButtonSegment(value: null, label: Text('Tutti')),
                ButtonSegment(
                    value: 'IN_PROGRESS', label: Text('In Corso')),
                ButtonSegment(
                    value: 'COMPLETED', label: Text('Completati')),
              ],
              selected: {_statusFilter},
              onSelectionChanged: (selected) {
                setState(() => _statusFilter = selected.first);
                _fetchProjects();
              },
            ),
          ),

          // -----------------------------------------------------------------
          // Content
          // -----------------------------------------------------------------
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Errore nel caricamento',
                              style: theme.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _error!,
                              style: theme.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => _fetchProjects(),
                              child: const Text('Riprova'),
                            ),
                          ],
                        ),
                      )
                    : _projects.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_outlined,
                                  size: 64,
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.3),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Nessun progetto trovato',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => _fetchProjects(),
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              itemCount: _projects.length +
                                  (_projects.length < _total ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == _projects.length) {
                                  return _buildLoadMoreButton();
                                }
                                return _buildProjectItem(
                                    context, theme, _projects[index]);
                              },
                            ),
                          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreate,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Project list item
  // ---------------------------------------------------------------------------

  Widget _buildProjectItem(
      BuildContext context, ThemeData theme, Map<String, dynamic> project) {
    final name = project['name'] as String? ?? '';
    final colorHex = project['color'] as String?;
    final status = project['status'] as String? ?? 'IN_PROGRESS';
    final tag = project['tag'] as String?;
    final totalTime = (project['totalTime'] as num?)?.toInt() ?? 0;

    final subtitle = [
      if (tag != null && tag.isNotEmpty) '[$tag]',
      toTime(totalTime),
    ].join(' ');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => _navigateToEdit(project['id'] as String),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Modifica',
            ),
            SlidableAction(
              onPressed: (_) => _deleteProject(project),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Elimina',
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: ColorDot(colorHex: colorHex, size: 16),
            title: Text(
              name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(subtitle),
            trailing: Chip(
              label: Text(
                _statusLabel(status),
                style: TextStyle(
                  fontSize: 12,
                  color: status == 'COMPLETED'
                      ? Colors.green.shade700
                      : Colors.blue.shade700,
                ),
              ),
              backgroundColor: status == 'COMPLETED'
                  ? Colors.green.shade50
                  : Colors.blue.shade50,
              side: BorderSide.none,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            onTap: () => _navigateToEdit(project['id'] as String),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Load more button
  // ---------------------------------------------------------------------------

  Widget _buildLoadMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: _loadingMore
            ? const CircularProgressIndicator()
            : OutlinedButton(
                onPressed: () => _fetchProjects(loadMore: true),
                child: const Text('Carica altri'),
              ),
      ),
    );
  }
}
