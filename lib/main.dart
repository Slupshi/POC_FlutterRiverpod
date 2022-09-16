import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/navigation/const_routeur.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: appRouteur
          .routeInformationParser, // permet de parser les routes en donnée générique pour le routeurDelegate
      routerDelegate: appRouteur
          .routerDelegate, // décide de la page à afficher en fonction de la route
      routeInformationProvider: appRouteur.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
