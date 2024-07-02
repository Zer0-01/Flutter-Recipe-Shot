import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashVm extends ChangeNotifier {
  Future<void> checkSignInStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }

  }
}
