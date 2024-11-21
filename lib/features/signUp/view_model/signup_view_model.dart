import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signin/view/signin_view.dart';

class SignupViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isLoading => _isLoading;
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    isLoading = true;
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
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
