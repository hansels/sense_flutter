import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunction {
  static SharedPreferences sp;

  Future<SharedPreferences> _getPreferences() async {
    if (sp == null) sp = await SharedPreferences.getInstance();
    return sp;
  }

  Future<String> getString(String key) async {
    SharedPreferences pref = await _getPreferences();
    return pref.getString(key);
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences pref = await _getPreferences();
    await pref.setString(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences pref = await _getPreferences();
    return pref.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences pref = await _getPreferences();
    await pref.setBool(key, value);
  }

  Future<bool> remove(String key) async {
    SharedPreferences pref = await _getPreferences();
    return await pref.remove(key);
  }
}
