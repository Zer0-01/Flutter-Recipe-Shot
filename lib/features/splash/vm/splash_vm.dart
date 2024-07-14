import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/home/view/home_view.dart';
import 'package:flutter_recipe_shot/features/signin/view/signin_view.dart';

class SplashVm extends ChangeNotifier {
  Future<void> checkSignInStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, HomeView.id);
    } else {
      Navigator.pushReplacementNamed(context, SigninView.id);
    }

  }
}
