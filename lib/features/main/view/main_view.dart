import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  static const String id = 'main_view';

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        leading: const Icon(Icons.person),
        title: const Text('Recipe Shot'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
