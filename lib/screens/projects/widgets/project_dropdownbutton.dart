import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timesheet/schema.graphql.dart';
import 'package:timesheet/screens/projects/project.graphql.dart';

class ProjectDropdownButton extends StatefulHookWidget {
  final String? value;
  final void Function(dynamic)? onChanged;

  const ProjectDropdownButton({super.key, this.value, this.onChanged});

  @override
  State<ProjectDropdownButton> createState() => _ProjectDropdownButtonState();
}

class _ProjectDropdownButtonState extends State<ProjectDropdownButton> {
  @override
  Widget build(BuildContext context) {
    final result = useQuery$ProjectSearcher(Options$Query$ProjectSearcher(
        variables: Variables$Query$ProjectSearcher(
            filter: Input$ProjectFilter(
      status: [Enum$ProjectStatusEnum.IN_PROGRESS],
      sortBy: Enum$ProjectSortEnum.NAME,
      sortDirection: Enum$SortDirectionEnum.ASC,
    ))));

    if (result.result.hasException) {
      throw Exception(result.result.exception.toString());
    }

    if (result.result.isLoading) {
      return const CircularProgressIndicator();
    }

    final projects = result.result.data!['projects']['data'];

    List<DropdownMenuItem<String>> items = [];
    projects.forEach((project) {
      final item = DropdownMenuItem(
          value: project['id'] as String, child: Text(project['name']));
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
