import 'package:flutter/material.dart';
import 'package:poc_flutter_riverpod/features/message/presentation/styles.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
  });

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      // if (constrains.isMobile) {
      //   return Scaffold(
      //     appBar: AppBar(
      //       title: const Text('application_todo_nav sur desktop'),
      //     ),
      //     body: child,
      //     bottomNavigationBar: NavigationBar(
      //       destinations: destinations,
      //       selectedIndex: selectedIndex,
      //       onDestinationSelected: onDestinationSelected,
      //     ),
      //   );
      // } else {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: constrains.maxWidth >= 800,
              minExtendedWidth: 180,
              destinations: destinations
                  .map((e) => NavigationRailDestination(
                        icon: e.icon,
                        label: Text(e.label),
                      ))
                  .toList(),
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              backgroundColor: darkGreen,
              unselectedLabelTextStyle: TextStyle(
                color: Color(Colors.white.value),
                fontSize: 15,
              ),
              selectedLabelTextStyle: TextStyle(
                color: Color(Colors.orange.value),
                fontSize: 15,
              ),
              selectedIconTheme:
                  IconThemeData(color: Color(Colors.orange.value)),
              unselectedIconTheme:
                  IconThemeData(color: Color(Colors.white.value)),
            ),
            Expanded(child: child),
          ],
        ),
      );
    }
        // },
        );
  }
}
