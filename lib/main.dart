import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/screens/authentication/login_screen.dart';

import 'screens/timesheets/activity_create.dart';
import 'screens/timesheets/timesheet_edit.dart';
import 'screens/timesheets/timesheet_list.dart';
import './helpers/storage.dart';

void main() async {
  await dotenv.load();
  await initHiveForFlutter();
  runApp(const TimesheetApp());
}

class TimesheetApp extends StatelessWidget {
  const TimesheetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(dotenv.env['GRAPHQLURI']!);

    final Link authLink = Link.function((request, [next]) {
      return next!(request).asyncMap((response) async {
        final String? token = await storage.read(key: 'token');
        if (token != null) {
          final modifiedRequest = request.updateContextEntry<HttpLinkHeaders>(
              (headers) => HttpLinkHeaders(headers: <String, String>{
                    ...headers?.headers ?? {},
                    'Authorization': 'Bearer $token'
                  }));

          return next(modifiedRequest).first;
        }
        return response;
      });
    });

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    ));

    return GraphQLProvider(
        client: client,
        child: CacheProvider(
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a blue toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            initialRoute: '/login',
            routes: {
              '/login': (context) => const LoginScreen(),
              '/': (context) => const TimesheetList(),
              '/timesheet': (context) => const TimesheetEdit(),
              '/timesheet/activity/new': (context) => const ActivityCreate(),
            },
          ),
        ));
  }
}
