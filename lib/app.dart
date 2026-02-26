import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/core/graphql_client.dart';
import 'package:timesheet/providers/auth_provider.dart';
import 'package:timesheet/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:timesheet/router/app_router.dart';

class TimesheetApp extends StatefulWidget {
  const TimesheetApp({super.key});

  @override
  State<TimesheetApp> createState() => _TimesheetAppState();
}

class _TimesheetAppState extends State<TimesheetApp> {
  late final ValueNotifier<GraphQLClient> _client;
  late final AuthProvider _authProvider;
  late final ThemeProvider _themeProvider;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _client = createGraphQLClient();
    _authProvider = AuthProvider();
    _themeProvider = ThemeProvider();
    _authProvider.setClient(_client.value);
    _router = createRouter(_authProvider);
    _init();
  }

  Future<void> _init() async {
    try {
      await _themeProvider.loadTheme();
      await _authProvider.init();
    } catch (e) {
      debugPrint('Initialization error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _authProvider),
        ChangeNotifierProvider.value(value: _themeProvider),
      ],
      child: GraphQLProvider(
        client: _client,
        child: Consumer2<AuthProvider, ThemeProvider>(
          builder: (context, auth, theme, _) {
            return MaterialApp.router(
              title: 'Timesheet',
              debugShowCheckedModeBanner: false,
              themeMode: theme.themeMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.dark,
                ),
                useMaterial3: true,
              ),
              locale: const Locale('it'),
              supportedLocales: const [Locale('it')],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: _router,
            );
          },
        ),
      ),
    );
  }
}
