import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/features/customers/widgets/customer_form.dart';

// ---------------------------------------------------------------------------
// GraphQL mutation
// ---------------------------------------------------------------------------

const String _customerCreateMutation = r'''
  mutation CustomerCreate($input: CustomerCreateInput!) {
    customerCreate(input: $input) {
      customer { id name color isActive }
    }
  }
''';

// ---------------------------------------------------------------------------
// CustomerCreateScreen
// ---------------------------------------------------------------------------

class CustomerCreateScreen extends StatefulWidget {
  const CustomerCreateScreen({super.key});

  @override
  State<CustomerCreateScreen> createState() => _CustomerCreateScreenState();
}

class _CustomerCreateScreenState extends State<CustomerCreateScreen> {
  bool _saving = false;

  // ---------------------------------------------------------------------------
  // Submit handler
  // ---------------------------------------------------------------------------

  Future<void> _onSubmit(CustomerFormData data) async {
    setState(() => _saving = true);

    try {
      final input = <String, dynamic>{
        'name': data.name,
      };
      if (data.colorHex != null) {
        input['color'] = data.colorHex;
      }

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_customerCreateMutation),
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
        const SnackBar(content: Text('Cliente creato con successo')),
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
        title: const Text('Nuovo Cliente'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: CustomerForm(
        saving: _saving,
        onSubmit: _onSubmit,
        showIsActive: false,
      ),
    );
  }
}
