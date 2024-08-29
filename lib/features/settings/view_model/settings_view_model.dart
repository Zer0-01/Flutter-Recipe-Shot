import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';

class SettingsViewModel extends ChangeNotifier {
    final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() {
    SharedPreferencesHelper.instance.clear();
    _auth.signOut();
  }
}