import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  static Future initializeSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void setStringValue(String key, String value) async {
    if (_preferences != null) {
      _preferences!.setString(key, value);
    }
  }

  static getStringValue(String key) async {
    return _preferences?.getString(key) ?? "";
  }

  static void setBoolValue(String key, bool value) async {
    if (_preferences != null) {
      _preferences!.setBool(key, value);
    }
  }

  static getBoolValue(String key) async {
    return _preferences!.getBool(key) ?? false;
  }

  static clearData() async {
    if (_preferences != null) {
      _preferences!.clear();
    }
  }

  static deleteData(String key) async {
    if (_preferences != null) {
      return _preferences!.remove(key);
    }
  }
}
