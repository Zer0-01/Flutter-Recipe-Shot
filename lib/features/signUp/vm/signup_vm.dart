import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signin/view/signin_view.dart';

class SignupVm extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signUp(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      if (userCredential.user != null) {
        await _auth.signOut();
        showSnackbar(context, 'Register Successful');

        Navigator.pushReplacementNamed(context, SigninView.id);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      showSnackbar(context, e.toString());
    }

    isLoading = false;
    notifyListeners();
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
