import 'package:flutter/material.dart';

import '../styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bonjour"), backgroundColor: darkGreen),
      body: const Center(
        child: Text("HomePage",
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
      ),
    );
  }
}
