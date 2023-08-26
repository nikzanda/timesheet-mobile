import 'package:flutter/cupertino.dart';

class AuthObserver extends NavigatorObserver {
  final bool isLoggedIn;

  AuthObserver({required this.isLoggedIn});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (!isLoggedIn && route.settings.name != '/login') {
      navigator?.pushReplacementNamed('/login');
    }
  }
}
