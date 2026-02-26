import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:timesheet/core/storage.dart';

ValueNotifier<GraphQLClient> createGraphQLClient() {
  final httpLink = HttpLink(dotenv.env['GRAPHQLURI']!);

  final authLink = AuthLink(
    getToken: () async {
      final token = await storage.read(key: 'token');
      return token != null ? 'Bearer $token' : null;
    },
  );

  final link = authLink.concat(httpLink);

  return ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    ),
  );
}
