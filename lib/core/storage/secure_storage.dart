import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageService {
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(value); // store as JSON string
    await prefs.setString(key, jsonString);
  }

  Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    if (value != null) {
      return value;
    }
    return null;
  }

  Future<Map<String, dynamic>?> readMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
