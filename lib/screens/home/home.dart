import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/constants/constants.dart';
import 'package:flutter_recipe_shot/services/auth_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text(
          'Recipe Shot',
          style: TextStyle(color: text),
        ),
        backgroundColor: primary,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _authService.signOut();
            },
            label: Text(
              'Sign Out',
            ),
            icon: Icon(Icons.person),
            style: TextButton.styleFrom(foregroundColor: text),
          ),
        ],
      ),
    );
  }
}