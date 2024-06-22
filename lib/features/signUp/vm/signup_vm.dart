import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupVm extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool status = false;

  Future<void> signUpUserWithEmailAndPassword() async {
    isLoading = true;
    notifyListeners();
    try {
      print('hello');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: emailController.text);

      print('success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}
