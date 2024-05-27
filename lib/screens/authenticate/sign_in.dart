import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/constants/constants.dart';
import 'package:flutter_recipe_shot/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Sign In to Recipe Shot',
          style: TextStyle(color: text),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(color: text),
          ),
          onPressed: () async {
            dynamic result = await _authService.signInAnonymously();
          },
        ),
      ),
    );
  }
}
