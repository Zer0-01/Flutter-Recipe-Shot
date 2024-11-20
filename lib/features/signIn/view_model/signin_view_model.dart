import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';

class SigninViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    try {
      isLoading = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      String userUid = userCredential.user!.uid;

      await SharedPreferencesHelper.instance.setUserUid("USERUID", userUid);
    } catch (e) {
      print(e.toString());
      isLoading = false;
    } finally {
      isLoading = false;
    }
  }
}
