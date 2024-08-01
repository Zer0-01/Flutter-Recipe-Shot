import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/home/view/home_view.dart';
import 'package:flutter_recipe_shot/res/widgets/loading_dialog_widget.dart';

class SigninViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      showLoading(context);

      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      dismissLoading(context);
      showSnackBar('Login Success', context);

      Navigator.pushReplacementNamed(context, HomeView.id);
    } catch (e) {
      print('Error ${e.toString()}');

      dismissLoading(context);
      showSnackBar('Invalid', context);
    }
  }

  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const LoadingDialogWidget();
      },
    );
  }

  void dismissLoading(BuildContext context) {
    Navigator.pop(context);
  }

  void showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
