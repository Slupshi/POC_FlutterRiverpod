import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'adaptive_navigation.dart';
import 'const_routeur.dart' as router;

class RootLayout extends StatelessWidget {
  const RootLayout({Key? key, required this.child, required this.currentIndex})
      : super(key: key);

  final Widget child;
  final int currentIndex;
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    void onSelected(int index) {
      final destination = router.destinations[index];
      context.go(destination.route);
    }

    return AdaptiveNavigation(
      key: _navigationRailKey,
      destinations: router.destinations
          .map(
            (e) => NavigationDestination(
              label: e.label,
              icon: e.icon,
            ),
          )
          .toList(),
      selectedIndex: currentIndex,
      onDestinationSelected: onSelected,
      child: child,
    );
  }
}
