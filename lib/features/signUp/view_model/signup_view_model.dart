import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isSuccess = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isSuccess => _isSuccess;
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  Future<bool> signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      if (userCredential.user != null) {
        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          'name': nameController.text,
          'email': emailController.text,
          'uid': userCredential.user!.uid,
        });
        await _auth.signOut();

        return true;
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      return false;
    } finally {}
    return false;
  }
}
