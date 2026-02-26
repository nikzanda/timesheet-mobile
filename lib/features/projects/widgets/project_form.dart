import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' hide colorToHex;
import 'package:timesheet/core/constants.dart';
import 'package:timesheet/shared/widgets/color_dot.dart';

// ---------------------------------------------------------------------------
// ProjectFormData — returned to the parent screens
// ---------------------------------------------------------------------------

class ProjectFormData {
  final String name;
  final String? colorHex;
  final String? tag;
  final String? description;
  final String status;

  ProjectFormData({
    required this.name,
    this.colorHex,
    this.tag,
    this.description,
    required this.status,
  });
}

// ---------------------------------------------------------------------------
// ProjectForm widget
// ---------------------------------------------------------------------------

class ProjectForm extends StatefulWidget {
  final void Function(ProjectFormData data) onSubmit;
  final bool saving;
  final bool showStatus;

  final String? initialName;
  final String? initialColorHex;
  final String? initialTag;
  final String? initialDescription;
  final String? initialStatus;

  const ProjectForm({
    super.key,
    required this.onSubmit,
    this.saving = false,
    this.showStatus = false,
    this.initialName,
    this.initialColorHex,
    this.initialTag,
    this.initialDescription,
    this.initialStatus,
  });

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _tagController;
  late TextEditingController _descriptionController;
  String? _colorHex;
  late String _status;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _tagController = TextEditingController(text: widget.initialTag ?? '');
    _descriptionController =
        TextEditingController(text: widget.initialDescription ?? '');
    _colorHex = widget.initialColorHex;
    _status = widget.initialStatus ?? 'IN_PROGRESS';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Color picker bottom sheet
  // ---------------------------------------------------------------------------

  void _showColorPicker() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Seleziona colore',
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor:
                          _colorHex != null ? hexToColor(_colorHex) : Colors.grey,
                      availableColors: presetColors,
                      onColorChanged: (color) {
                        setState(() {
                          _colorHex = colorToHex(color);
                        });
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _colorHex = null;
                    });
                    Navigator.of(ctx).pop();
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text('Rimuovi colore'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit(
      ProjectFormData(
        name: _nameController.text.trim(),
        colorHex: _colorHex,
        tag: _tagController.text.trim().isNotEmpty
            ? _tagController.text.trim()
            : null,
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        status: _status,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -----------------------------------------------------------------
          // Name field
          // -----------------------------------------------------------------
          Text('Nome', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nome progetto',
              prefixIcon: Icon(Icons.folder),
            ),
            textInputAction: TextInputAction.next,
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'Il nome è obbligatorio';
              }
              return null;
            },
          ),

          const SizedBox(height: 24),

          // -----------------------------------------------------------------
          // Tag field
          // -----------------------------------------------------------------
          Text('Tag', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextFormField(
            controller: _tagController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tag progetto',
              prefixIcon: Icon(Icons.label),
            ),
            textInputAction: TextInputAction.next,
          ),

          const SizedBox(height: 24),

          // -----------------------------------------------------------------
          // Color picker
          // -----------------------------------------------------------------
          Text('Colore', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          InkWell(
            onTap: _showColorPicker,
            borderRadius: BorderRadius.circular(12),
            child: InputDecorator(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.color_lens),
              ),
              child: Row(
                children: [
                  ColorDot(colorHex: _colorHex, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    _colorHex ?? 'Nessun colore',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: _colorHex == null
                          ? theme.colorScheme.onSurface.withValues(alpha: 0.5)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // -----------------------------------------------------------------
          // Description field
          // -----------------------------------------------------------------
          Text('Descrizione', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Descrizione progetto',
            ),
            maxLines: 4,
            textInputAction: TextInputAction.newline,
          ),

          // -----------------------------------------------------------------
          // Status
          // -----------------------------------------------------------------
          if (widget.showStatus) ...[
            const SizedBox(height: 24),
            Text('Stato', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'IN_PROGRESS',
                  label: Text('In Corso'),
                  icon: Icon(Icons.play_circle_outline),
                ),
                ButtonSegment(
                  value: 'COMPLETED',
                  label: Text('Completato'),
                  icon: Icon(Icons.check_circle_outline),
                ),
              ],
              selected: {_status},
              onSelectionChanged: (selected) {
                setState(() => _status = selected.first);
              },
            ),
          ],

          const SizedBox(height: 32),

          // -----------------------------------------------------------------
          // Submit button
          // -----------------------------------------------------------------
          FilledButton.icon(
            onPressed: widget.saving ? null : _handleSubmit,
            icon: widget.saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            label: Text(widget.saving ? 'Salvataggio...' : 'Salva'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ],
      ),
    );
  }
}
