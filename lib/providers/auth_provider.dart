import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:timesheet/core/storage.dart';

class AuthUser {
  final String id;
  final String email;
  final String displayName;
  final bool isAdmin;

  AuthUser({
    required this.id,
    required this.email,
    required this.displayName,
    required this.isAdmin,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      isAdmin: json['isAdmin'] as bool,
    );
  }
}

class AuthOrganization {
  final String id;
  final String name;

  AuthOrganization({required this.id, required this.name});

  factory AuthOrganization.fromJson(Map<String, dynamic> json) {
    return AuthOrganization(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}

class TimesheetSettings {
  final String id;
  final String customer;
  final String project;
  final int minuteStep;
  final bool closeTimesheetAutomatically;

  TimesheetSettings({
    required this.id,
    required this.customer,
    required this.project,
    required this.minuteStep,
    required this.closeTimesheetAutomatically,
  });

  factory TimesheetSettings.fromJson(Map<String, dynamic> json) {
    return TimesheetSettings(
      id: json['id'] as String,
      customer: json['customer'] as String,
      project: json['project'] as String,
      minuteStep: json['minuteStep'] as int? ?? 1,
      closeTimesheetAutomatically:
          json['closeTimesheetAutomatically'] as bool? ?? false,
    );
  }
}

const String _meQuery = r'''
  query Me {
    me {
      id
      email
      displayName
      isAdmin
      organization {
        id
        name
        timesheetSettings {
          id
          customer
          project
          minuteStep
          closeTimesheetAutomatically
        }
      }
      currentTimesheet {
        month
      }
    }
  }
''';

const String _loginMutation = r'''
  mutation Login($input: AuthenticationLoginInput!) {
    authenticationLogin(input: $input) {
      token
    }
  }
''';

class AuthProvider extends ChangeNotifier {
  GraphQLClient? _client;
  AuthUser? _currentUser;
  AuthOrganization? _currentOrganization;
  TimesheetSettings? _settings;
  String? _currentTimesheetMonth;
  bool _loading = true;
  String? _error;

  AuthUser? get currentUser => _currentUser;
  AuthOrganization? get currentOrganization => _currentOrganization;
  TimesheetSettings? get settings => _settings;
  String? get currentTimesheetMonth => _currentTimesheetMonth;
  bool get loading => _loading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;
  bool get isAdmin => _currentUser?.isAdmin ?? false;

  bool get enableCustomers =>
      _settings != null && _settings!.customer != 'HIDDEN';
  bool get enableProjects =>
      _settings != null && _settings!.project != 'HIDDEN';
  bool get customerRequired =>
      _settings != null && _settings!.customer == 'REQUIRED';
  bool get projectRequired =>
      _settings != null && _settings!.project == 'REQUIRED';
  int get minuteStep => _settings?.minuteStep ?? 1;

  void setClient(GraphQLClient client) {
    _client = client;
  }

  Future<void> init() async {
    final token = await storage.read(key: 'token');
    if (token == null || JwtDecoder.isExpired(token)) {
      await storage.delete(key: 'token');
      _loading = false;
      notifyListeners();
      return;
    }
    await fetchMe();
  }

  Future<void> fetchMe() async {
    if (_client == null) return;

    try {
      _loading = true;
      _error = null;
      notifyListeners();

      final result = await _client!.query(
        QueryOptions(
          document: gql(_meQuery),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      if (result.hasException) {
        _error = result.exception.toString();
        _currentUser = null;
        _currentOrganization = null;
        _settings = null;
        await storage.delete(key: 'token');
      } else if (result.data != null) {
        final me = result.data!['me'] as Map<String, dynamic>;
        _currentUser = AuthUser.fromJson(me);

        final org = me['organization'] as Map<String, dynamic>;
        _currentOrganization = AuthOrganization.fromJson(org);

        final settingsJson =
            org['timesheetSettings'] as Map<String, dynamic>;
        _settings = TimesheetSettings.fromJson(settingsJson);

        final currentTimesheet =
            me['currentTimesheet'] as Map<String, dynamic>?;
        _currentTimesheetMonth = currentTimesheet?['month'] as String?;
      }
    } catch (e) {
      _error = e.toString();
      _currentUser = null;
      await storage.delete(key: 'token');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    if (_client == null) return false;

    try {
      _error = null;
      notifyListeners();

      final result = await _client!.mutate(
        MutationOptions(
          document: gql(_loginMutation),
          variables: {
            'input': {
              'email': email,
              'password': password,
            },
          },
        ),
      );

      if (result.hasException) {
        if (result.exception?.graphqlErrors.isNotEmpty == true) {
          _error = result.exception!.graphqlErrors.first.message;
        } else if (result.exception?.linkException is ServerException) {
          final serverEx =
              result.exception!.linkException as ServerException;
          final errors = serverEx.parsedResponse?.errors ?? [];
          _error = errors.isNotEmpty
              ? errors.first.message
              : 'Errore di connessione al server';
        } else {
          _error = 'Errore di connessione al server';
        }
        notifyListeners();
        return false;
      }

      final token =
          result.data!['authenticationLogin']['token'] as String;
      await storage.write(key: 'token', value: token);
      await fetchMe();
      return isAuthenticated;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    _currentUser = null;
    _currentOrganization = null;
    _settings = null;
    _currentTimesheetMonth = null;
    _error = null;
    if (_client != null) {
      _client!.cache.store.reset();
    }
    notifyListeners();
  }
}
