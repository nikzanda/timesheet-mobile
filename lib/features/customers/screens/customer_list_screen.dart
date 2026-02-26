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

const String _customersQuery = r'''
  query Customers($pageIndex: Int!, $pageSize: Int!, $filter: CustomerFilter) {
    customers(pageIndex: $pageIndex, pageSize: $pageSize, filter: $filter) {
      data {
        id name color isActive totalTime createdAt
        canDelete { model count }
      }
      pageInfo { total }
    }
  }
''';

const String _customerDeleteMutation = r'''
  mutation CustomerDelete($input: CustomerDeleteInput!) {
    customerDelete(input: $input) {
      customer { id }
    }
  }
''';

// ---------------------------------------------------------------------------
// CustomerListScreen
// ---------------------------------------------------------------------------

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  List<Map<String, dynamic>> _customers = [];
  int _total = 0;
  int _pageIndex = 0;
  bool _loading = true;
  bool _loadingMore = false;
  String? _error;
  bool _initialFetchDone = false;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  bool? _isActiveFilter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialFetchDone) {
      _initialFetchDone = true;
      _fetchCustomers();
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

  Future<void> _fetchCustomers({bool loadMore = false}) async {
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
      if (_isActiveFilter != null) {
        filter['isActive'] = _isActiveFilter;
      }

      final pageIndex = loadMore ? _pageIndex + 1 : 0;

      final result = await _client.query(
        QueryOptions(
          document: gql(_customersQuery),
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
          (result.data?['customers']?['data'] as List<dynamic>?) ?? [];
      final total =
          (result.data?['customers']?['pageInfo']?['total'] as int?) ?? 0;

      final customers =
          data.map((c) => Map<String, dynamic>.from(c as Map)).toList();

      setState(() {
        if (loadMore) {
          _customers.addAll(customers);
          _pageIndex = pageIndex;
        } else {
          _customers = customers;
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

  Future<void> _deleteCustomer(Map<String, dynamic> customer) async {
    final canDelete = customer['canDelete'] as List<dynamic>? ?? [];
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
      title: 'Elimina cliente',
      content:
          'Sei sicuro di voler eliminare "${customer['name']}"?',
      confirmText: 'Elimina',
      destructive: true,
    );

    if (!confirmed || !mounted) return;

    try {
      final result = await _client.mutate(
        MutationOptions(
          document: gql(_customerDeleteMutation),
          variables: {
            'input': {'id': customer['id']},
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
        const SnackBar(content: Text('Cliente eliminato')),
      );
      _fetchCustomers();
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
    final result = await context.push('/customer-create');
    if (result == true) {
      _fetchCustomers();
    }
  }

  Future<void> _navigateToEdit(String id) async {
    final result = await context.push('/customer-edit/$id');
    if (result == true) {
      _fetchCustomers();
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
                hintText: 'Cerca clienti...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: _searchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchText = '');
                          _fetchCustomers();
                        },
                      )
                    : null,
              ),
              onSubmitted: (val) {
                setState(() => _searchText = val.trim());
                _fetchCustomers();
              },
            ),
          ),

          // -----------------------------------------------------------------
          // Status filter
          // -----------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: SegmentedButton<bool?>(
              segments: const [
                ButtonSegment(value: null, label: Text('Tutti')),
                ButtonSegment(value: true, label: Text('Attivi')),
                ButtonSegment(value: false, label: Text('Inattivi')),
              ],
              selected: {_isActiveFilter},
              onSelectionChanged: (selected) {
                setState(() => _isActiveFilter = selected.first);
                _fetchCustomers();
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
                              onPressed: () => _fetchCustomers(),
                              child: const Text('Riprova'),
                            ),
                          ],
                        ),
                      )
                    : _customers.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.business_outlined,
                                  size: 64,
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.3),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Nessun cliente trovato',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () => _fetchCustomers(),
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              itemCount: _customers.length +
                                  (_customers.length < _total ? 1 : 0),
                              itemBuilder: (context, index) {
                                if (index == _customers.length) {
                                  return _buildLoadMoreButton();
                                }
                                return _buildCustomerItem(
                                    context, theme, _customers[index]);
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
  // Customer list item
  // ---------------------------------------------------------------------------

  Widget _buildCustomerItem(
      BuildContext context, ThemeData theme, Map<String, dynamic> customer) {
    final name = customer['name'] as String? ?? '';
    final colorHex = customer['color'] as String?;
    final isActive = customer['isActive'] as bool? ?? true;
    final totalTime = (customer['totalTime'] as num?)?.toInt() ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => _navigateToEdit(customer['id'] as String),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Modifica',
            ),
            SlidableAction(
              onPressed: (_) => _deleteCustomer(customer),
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
            subtitle: Text(toTime(totalTime)),
            trailing: Chip(
              label: Text(
                isActive ? 'Attivo' : 'Inattivo',
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? Colors.green.shade700 : Colors.red.shade700,
                ),
              ),
              backgroundColor:
                  isActive ? Colors.green.shade50 : Colors.red.shade50,
              side: BorderSide.none,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            onTap: () => _navigateToEdit(customer['id'] as String),
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
                onPressed: () => _fetchCustomers(loadMore: true),
                child: const Text('Carica altri'),
              ),
      ),
    );
  }
}
