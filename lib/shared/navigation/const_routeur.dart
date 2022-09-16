import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_flutter_riverpod/features/message/presentation/views/home_view.dart';
import 'package:poc_flutter_riverpod/features/message/presentation/views/message_view.dart';

import 'root_layout.dart';

//permet de renseigner la navigation avec la route direcement
class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

//Permet d'avoir la liste des destinations en constantes
const List<NavigationDestination> destinations = [
  NavigationDestination(
    route: '/',
    label: 'Accueil',
    icon: Icon(Icons.home),
  ),
  NavigationDestination(
    route: '/messages',
    label: 'Conversations',
    icon: Icon(Icons.list),
  ),
];

final appRouteur = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(
          child: RootLayout(currentIndex: 0, child: HomeView())),
    ),
    GoRoute(
      path: '/messages',
      pageBuilder: (context, state) => const MaterialPage(
          child: RootLayout(currentIndex: 1, child: MessageView())),
      // routes: [
      //   GoRoute(
      //     path: 'souslist',
      //     name: 'souslist',
      //     pageBuilder: (context, state) => MaterialPage(
      //         child: RootLayout(currentIndex: 1, child: HomeScreen())),
      //   ),
      //   GoRoute(
      //     path: ':id',
      //     pageBuilder: (context, state) => MaterialPage(
      //         child: RootLayout(
      //       currentIndex: 1,
      //       child: ListScreenDetail(
      //         item: todoProvider.getTodoById(state.params['id']!),
      //       ),
      //     )),
      //   ),
      // ],
    ),
  ],
);
