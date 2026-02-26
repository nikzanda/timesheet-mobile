import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:timesheet/providers/auth_provider.dart';

class ShellScreen extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const ShellScreen({super.key, required this.state, required this.child});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        final tabs = _buildTabs(auth);
        final currentIndex = _calculateSelectedIndex(context, tabs);

        return Scaffold(
          appBar: AppBar(
            title: Text(_titleForIndex(currentIndex, tabs)),
            actions: [
              if (auth.isAdmin)
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.gear, size: 20),
                  onPressed: () => context.push('/settings'),
                  tooltip: 'Impostazioni',
                ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.user, size: 20),
                onPressed: () => context.push('/profile'),
                tooltip: 'Profilo',
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              context.go(tabs[index].route);
            },
            destinations: tabs
                .map((tab) => NavigationDestination(
                      icon: FaIcon(tab.icon, size: 20),
                      selectedIcon: FaIcon(tab.selectedIcon, size: 20),
                      label: tab.label,
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  List<_TabItem> _buildTabs(AuthProvider auth) {
    final tabs = <_TabItem>[
      _TabItem(
        route: '/dashboard',
        label: 'Dashboard',
        icon: FontAwesomeIcons.chartPie,
        selectedIcon: FontAwesomeIcons.chartPie,
      ),
      _TabItem(
        route: '/timesheets',
        label: 'Timesheet',
        icon: FontAwesomeIcons.clock,
        selectedIcon: FontAwesomeIcons.solidClock,
      ),
    ];

    if (auth.enableCustomers) {
      tabs.add(_TabItem(
        route: '/customers',
        label: 'Clienti',
        icon: FontAwesomeIcons.userGroup,
        selectedIcon: FontAwesomeIcons.userGroup,
      ));
    }

    if (auth.enableProjects) {
      tabs.add(_TabItem(
        route: '/projects',
        label: 'Progetti',
        icon: FontAwesomeIcons.diagramProject,
        selectedIcon: FontAwesomeIcons.diagramProject,
      ));
    }

    return tabs;
  }

  int _calculateSelectedIndex(BuildContext context, List<_TabItem> tabs) {
    final location = state.matchedLocation;
    for (int i = tabs.length - 1; i >= 0; i--) {
      if (location.startsWith(tabs[i].route)) return i;
    }
    return 0;
  }

  String _titleForIndex(int index, List<_TabItem> tabs) {
    if (index < 0 || index >= tabs.length) return 'Timesheet';
    return tabs[index].label;
  }
}

class _TabItem {
  final String route;
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  _TabItem({
    required this.route,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}
