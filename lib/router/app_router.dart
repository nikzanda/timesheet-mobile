import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timesheet/features/auth/screens/login_screen.dart';
import 'package:timesheet/features/customers/screens/customer_create_screen.dart';
import 'package:timesheet/features/customers/screens/customer_edit_screen.dart';
import 'package:timesheet/features/customers/screens/customer_list_screen.dart';
import 'package:timesheet/features/dashboard/screens/dashboard_screen.dart';
import 'package:timesheet/features/profile/screens/profile_screen.dart';
import 'package:timesheet/features/projects/screens/project_create_screen.dart';
import 'package:timesheet/features/projects/screens/project_edit_screen.dart';
import 'package:timesheet/features/projects/screens/project_list_screen.dart';
import 'package:timesheet/features/settings/screens/settings_screen.dart';
import 'package:timesheet/features/shell/shell_screen.dart';
import 'package:timesheet/features/timesheets/screens/activity_create_screen.dart';
import 'package:timesheet/features/timesheets/screens/activity_edit_screen.dart';
import 'package:timesheet/features/timesheets/screens/timesheet_edit_screen.dart';
import 'package:timesheet/features/timesheets/screens/timesheet_list_screen.dart';
import 'package:timesheet/providers/auth_provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthProvider authProvider) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/timesheets',
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.isAuthenticated;
      final isLoading = authProvider.loading;
      final isLoginRoute = state.matchedLocation == '/login';

      if (isLoading) return null;

      if (!isLoggedIn && !isLoginRoute) return '/login';
      if (isLoggedIn && isLoginRoute) return '/timesheets';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      // Full-screen routes (no bottom nav) — unique paths to avoid conflicts
      GoRoute(
        path: '/activity-create/:month',
        builder: (context, state) {
          final month = state.pathParameters['month']!;
          final timesheetId = state.uri.queryParameters['timesheetId'];
          return ActivityCreateScreen(
            month: month,
            timesheetId: timesheetId ?? '',
          );
        },
      ),
      GoRoute(
        path: '/activity-edit/:month',
        builder: (context, state) {
          final month = state.pathParameters['month']!;
          final extra = state.extra as Map<String, dynamic>?;
          return ActivityEditScreen(
            month: month,
            timesheetId: extra?['timesheetId'] as String? ?? '',
            activity: extra?['activity'] as Map<String, dynamic>?,
            clone: extra?['clone'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/customer-create',
        builder: (context, state) => const CustomerCreateScreen(),
      ),
      GoRoute(
        path: '/customer-edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return CustomerEditScreen(customerId: id);
        },
      ),
      GoRoute(
        path: '/project-create',
        builder: (context, state) => const ProjectCreateScreen(),
      ),
      GoRoute(
        path: '/project-edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProjectEditScreen(projectId: id);
        },
      ),

      // Shell routes (with bottom nav)
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScreen(state: state, child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/timesheets',
            builder: (context, state) => const TimesheetListScreen(),
          ),
          GoRoute(
            path: '/timesheets/:month',
            builder: (context, state) {
              final month = state.pathParameters['month']!;
              return TimesheetEditScreen(month: month);
            },
          ),
          GoRoute(
            path: '/customers',
            builder: (context, state) => const CustomerListScreen(),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectListScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
