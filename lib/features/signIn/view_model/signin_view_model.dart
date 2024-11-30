import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/firebase/firestore_collections.dart';
import 'package:flutter_recipe_shot/data/local/shared_preference_key.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/models/user/user.dart';

class SigninViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn() async {
    try {
      isLoading = true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      String userUid = userCredential.user!.uid;

      final DocumentReference docRef =
          _firestore.collection(FirestoreCollections.users).doc(userUid);

      final DocumentSnapshot snapshot = await docRef.get();
      final UserModel user =
          UserModel.fromJson(snapshot.data() as Map<String, dynamic>);

      await SharedPreferencesHelper.instance
          .setUserUid(SharedPreferenceKeys.USERUID, userUid);
      await SharedPreferencesHelper.instance
          .setUserName(SharedPreferenceKeys.USERNAME, user.name);
    } catch (e) {
      print(e.toString());
      isLoading = false;
    } finally {
      isLoading = false;
    }
  }
}
