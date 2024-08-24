import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferences? _prefs;

  SharedPreferencesHelper._privateConstructor();

  static final SharedPreferencesHelper instance =
      SharedPreferencesHelper._privateConstructor();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setUserUid(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  String? getUserUid(String key) {
    return _prefs?.getString(key);
  }
}
