import 'package:flutter/cupertino.dart';
import 'package:timesheet/helpers/storage.dart';

class AuthObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPush(route, previousRoute);
    final token = await storage.read(key: 'token');
    if (token == null && route.settings.name != '/login') {
      navigator!.pushReplacementNamed('/login');
    }
  }
}
