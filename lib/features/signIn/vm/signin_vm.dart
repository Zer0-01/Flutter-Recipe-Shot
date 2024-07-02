import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninVm extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

                Navigator.pushReplacementNamed(context, '/home');

    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
}
