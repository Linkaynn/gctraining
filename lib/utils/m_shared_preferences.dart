import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class MSharedPreferencesKeys {
  static const TAGS = 'TAGS';
  static const AMOUNT = 'AMOUNT';
}

class MSharedPreferences {
  static SharedPreferences _ref;

  static setString(String key, String value) async {
    await _ref.setString(key, value);
  }

  static String getString(String key) {
    String value = _ref.getString(key);

    return value;
  }

  static setBool(String key, bool value) async {
    await _ref.setBool(key, value);
  }

  static bool getBool(String key) {
    bool value = _ref.getBool(key);

    if (value == null) {
      return false;
    }

    return value;
  }

  static Future<void> partialClear() {}

  static check() {
    if (_ref == null) throw Exception('Error: SharedPreferences not initialized');
  }

  static Future<void> initialize() async {
    if (_ref == null) _ref = await SharedPreferences.getInstance();
  }

  static bool initializated() {
    return _ref != null;
  }
}
