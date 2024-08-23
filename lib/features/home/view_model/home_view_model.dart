import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/recipes/view/recipes_view.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toRecipesView(BuildContext context) {
    Navigator.pushNamed(context, RecipesView.id);
  }

  void toMyRecipesView(BuildContext context) {
    Navigator.pushNamed(context, RecipesView.id);
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logged out successfully'),
          backgroundColor: Colors.green,
        ),
      );
      // Navigate to login screen or home screen after logout
      Navigator.of(context).pushReplacementNamed(SigninView.id); //
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
