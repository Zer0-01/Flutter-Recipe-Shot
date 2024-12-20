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

  Future<bool> setUserName(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  String? getUserUid(String key) {
    return _prefs?.getString(key);
  }

  String? getUserName(String key) {
    return _prefs?.getString(key);
  }

  // Remove a key
  Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  // Clear all data
  Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}
