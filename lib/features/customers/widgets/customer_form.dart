import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart' hide colorToHex;
import 'package:timesheet/core/constants.dart';
import 'package:timesheet/shared/widgets/color_dot.dart';

// ---------------------------------------------------------------------------
// CustomerFormData — returned to the parent screens
// ---------------------------------------------------------------------------

class CustomerFormData {
  final String name;
  final String? colorHex;
  final bool isActive;

  CustomerFormData({
    required this.name,
    this.colorHex,
    required this.isActive,
  });
}

// ---------------------------------------------------------------------------
// CustomerForm widget
// ---------------------------------------------------------------------------

class CustomerForm extends StatefulWidget {
  final void Function(CustomerFormData data) onSubmit;
  final bool saving;
  final bool showIsActive;

  final String? initialName;
  final String? initialColorHex;
  final bool? initialIsActive;

  const CustomerForm({
    super.key,
    required this.onSubmit,
    this.saving = false,
    this.showIsActive = false,
    this.initialName,
    this.initialColorHex,
    this.initialIsActive,
  });

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  String? _colorHex;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _colorHex = widget.initialColorHex;
    _isActive = widget.initialIsActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
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
      CustomerFormData(
        name: _nameController.text.trim(),
        colorHex: _colorHex,
        isActive: _isActive,
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
              hintText: 'Nome cliente',
              prefixIcon: Icon(Icons.business),
            ),
            textInputAction: TextInputAction.done,
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'Il nome è obbligatorio';
              }
              return null;
            },
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

          // -----------------------------------------------------------------
          // IsActive switch
          // -----------------------------------------------------------------
          if (widget.showIsActive) ...[
            const SizedBox(height: 24),
            SwitchListTile(
              title: const Text('Attivo'),
              value: _isActive,
              onChanged: (val) => setState(() => _isActive = val),
              contentPadding: EdgeInsets.zero,
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
