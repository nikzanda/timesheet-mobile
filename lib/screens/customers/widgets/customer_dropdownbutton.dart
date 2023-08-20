import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timesheet/schema.graphql.dart';
import 'package:timesheet/screens/customers/customer.graphql.dart';

class CustomerDropdownButton extends StatefulHookWidget {
  final String? value;
  final void Function(dynamic)? onChanged;

  const CustomerDropdownButton({super.key, this.value, this.onChanged});

  @override
  State<CustomerDropdownButton> createState() => _CustomerDropdownButtonState();
}

class _CustomerDropdownButtonState extends State<CustomerDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final result = useQuery$CustomerSearcher(Options$Query$CustomerSearcher(
        variables: Variables$Query$CustomerSearcher(
            filter: Input$CustomerFilter(
      isActive: true,
      sortBy: Enum$CustomerSortEnum.NAME,
      sortDirection: Enum$SortDirectionEnum.ASC,
    ))));

    if (result.result.hasException) {
      throw Exception(result.result.exception.toString());
    }

    if (result.result.isLoading) {
      return const CircularProgressIndicator();
    }

    final customers = result.result.data!['customers']['data'];

    List<DropdownMenuItem<String>> items = [];
    customers.forEach((customer) {
      final item = DropdownMenuItem(value: customer['id'] as String, child: Text(customer['name']));
      items.add(item);
    });

    return DropdownButtonFormField(
      value: widget.value,
      items: items,
      onChanged: widget.onChanged,
      isExpanded: true,
    );
  }
}
