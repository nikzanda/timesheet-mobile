import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/providers/auth_provider.dart';

// ---------------------------------------------------------------------------
// GraphQL mutation
// ---------------------------------------------------------------------------

const String _settingUpdateMutation = r'''
  mutation SettingUpdate($input: SettingUpdateInput!) {
    settingUpdate(input: $input) {
      setting {
        id
        customer
        project
        minuteStep
        closeTimesheetAutomatically
      }
    }
  }
''';

// ---------------------------------------------------------------------------
// SettingsScreen
// ---------------------------------------------------------------------------

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _saving = false;

  late String _customer;
  late String _project;
  late int _minuteStep;
  late bool _closeTimesheetAutomatically;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      final auth = context.read<AuthProvider>();
      final settings = auth.settings;
      _customer = settings?.customer ?? 'HIDDEN';
      _project = settings?.project ?? 'HIDDEN';
      _minuteStep = settings?.minuteStep ?? 5;
      _closeTimesheetAutomatically =
          settings?.closeTimesheetAutomatically ?? true;
    }
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    try {
      final auth = context.read<AuthProvider>();
      final settingId = auth.settings?.id;
      if (settingId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impostazioni non trovate'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() => _saving = false);
        return;
      }

      final client = GraphQLProvider.of(context).value;
      final result = await client.mutate(
        MutationOptions(
          document: gql(_settingUpdateMutation),
          variables: {
            'input': {
              'id': settingId,
              'customer': _customer,
              'project': _project,
              'minuteStep': _minuteStep,
              'closeTimesheetAutomatically': _closeTimesheetAutomatically,
            },
          },
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

      // Refresh auth provider to pick up new settings
      await auth.fetchMe();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impostazioni salvate con successo')),
      );
      setState(() => _saving = false);
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
  // Helpers
  // ---------------------------------------------------------------------------

  String _settingLabel(String value) {
    switch (value) {
      case 'HIDDEN':
        return 'Nascosto';
      case 'VISIBLE':
        return 'Mostra';
      case 'REQUIRED':
        return 'Obbligatorio';
      default:
        return value;
    }
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Impostazioni'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ---------------------------------------------------------------
            // Customer visibility
            // ---------------------------------------------------------------
            Text('Visibilità cliente', style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'Controlla se i clienti sono selezionabili nelle attività.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _customer,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
              items: ['HIDDEN', 'VISIBLE', 'REQUIRED']
                  .map((v) => DropdownMenuItem(
                        value: v,
                        child: Text(_settingLabel(v)),
                      ))
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _customer = val);
              },
            ),

            const SizedBox(height: 24),

            // ---------------------------------------------------------------
            // Project visibility
            // ---------------------------------------------------------------
            Text('Visibilità progetto', style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'Controlla se i progetti sono selezionabili nelle attività.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _project,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.folder),
              ),
              items: ['HIDDEN', 'VISIBLE', 'REQUIRED']
                  .map((v) => DropdownMenuItem(
                        value: v,
                        child: Text(_settingLabel(v)),
                      ))
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _project = val);
              },
            ),

            const SizedBox(height: 24),

            // ---------------------------------------------------------------
            // Minute step
            // ---------------------------------------------------------------
            Text('Intervallo di minuti', style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              'I minuti inclusi nell\'intervallo verranno esclusi dalla selezione degli orari.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: _minuteStep > 1
                      ? () => setState(() => _minuteStep--)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Expanded(
                  child: TextFormField(
                    key: ValueKey(_minuteStep),
                    initialValue: _minuteStep.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.timer),
                      suffixText: 'min',
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (val) {
                      final n = int.tryParse(val);
                      if (n != null && n >= 1 && n <= 59) {
                        setState(() => _minuteStep = n);
                      }
                    },
                    validator: (val) {
                      final n = int.tryParse(val ?? '');
                      if (n == null || n < 1 || n > 59) {
                        return 'Valore 1-59';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  onPressed: _minuteStep < 59
                      ? () => setState(() => _minuteStep++)
                      : null,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------------------------------------------------------------
            // Auto-close timesheet
            // ---------------------------------------------------------------
            SwitchListTile(
              title: const Text('Chiudi timesheet automaticamente'),
              subtitle: const Text(
                'Il timesheet viene chiuso al primo accesso dopo l\'ultimo giorno del mese.',
              ),
              value: _closeTimesheetAutomatically,
              onChanged: (val) =>
                  setState(() => _closeTimesheetAutomatically = val),
              contentPadding: EdgeInsets.zero,
            ),

            const SizedBox(height: 32),

            // ---------------------------------------------------------------
            // Save button
            // ---------------------------------------------------------------
            FilledButton.icon(
              onPressed: _saving ? null : _handleSubmit,
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.save),
              label: Text(_saving ? 'Salvataggio...' : 'Salva'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
