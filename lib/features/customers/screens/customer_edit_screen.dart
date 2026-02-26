import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/customers/widgets/customer_form.dart';

// ---------------------------------------------------------------------------
// GraphQL documents
// ---------------------------------------------------------------------------

const String _customerQuery = r'''
  query Customer($id: ID!) {
    customer(id: $id) { id name color isActive }
  }
''';

const String _customerUpdateMutation = r'''
  mutation CustomerUpdate($input: CustomerUpdateInput!) {
    customerUpdate(input: $input) {
      customer { id name color isActive }
    }
  }
''';

// ---------------------------------------------------------------------------
// CustomerEditScreen
// ---------------------------------------------------------------------------

class CustomerEditScreen extends StatefulWidget {
  final String customerId;

  const CustomerEditScreen({super.key, required this.customerId});

  @override
  State<CustomerEditScreen> createState() => _CustomerEditScreenState();
}

class _CustomerEditScreenState extends State<CustomerEditScreen> {
  Map<String, dynamic>? _customer;
  bool _loading = true;
  bool _hasError = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchCustomer());
  }

  // ---------------------------------------------------------------------------
  // Fetch customer data
  // ---------------------------------------------------------------------------

  Future<void> _fetchCustomer() async {
    setState(() {
      _loading = true;
      _hasError = false;
    });

    try {
      final client = GraphQLProvider.of(context).value;
      final result = await client.query(
        QueryOptions(
          document: gql(_customerQuery),
          variables: {'id': widget.customerId},
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (!mounted) return;

      if (result.hasException || result.data?['customer'] == null) {
        setState(() {
          _hasError = true;
          _loading = false;
        });
        return;
      }

      setState(() {
        _customer =
            Map<String, dynamic>.from(result.data!['customer'] as Map);
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

  Future<void> _onSubmit(CustomerFormData data) async {
    setState(() => _saving = true);

    try {
      final input = <String, dynamic>{
        'id': widget.customerId,
        'name': data.name,
        'isActive': data.isActive,
      };
      if (data.colorHex != null) {
        input['color'] = data.colorHex;
      } else {
        input['color'] = null;
      }

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_customerUpdateMutation),
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
        const SnackBar(content: Text('Cliente aggiornato con successo')),
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
    final title = _customer != null
        ? (_customer!['name'] as String? ?? 'Modifica Cliente')
        : 'Modifica Cliente';

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
                        onPressed: _fetchCustomer,
                        child: const Text('Riprova'),
                      ),
                    ],
                  ),
                )
              : CustomerForm(
                  saving: _saving,
                  onSubmit: _onSubmit,
                  showIsActive: true,
                  initialName: _customer!['name'] as String?,
                  initialColorHex: _customer!['color'] as String?,
                  initialIsActive: _customer!['isActive'] as bool? ?? true,
                ),
    );
  }
}
