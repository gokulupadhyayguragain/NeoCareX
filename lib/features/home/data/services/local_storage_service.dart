import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  SharedPreferences? _prefs;
  Future<SharedPreferences>? _initFuture;

  Future<void> init() async {
    if (_prefs != null) return; 
    _initFuture ??= SharedPreferences.getInstance();
    _prefs = await _initFuture;
  }

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs != null) return _prefs!;
    await init();
    return _prefs!;
  }

  Future<void> saveString(String key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, value);
    debugPrint('[LocalStorageService] Saved $key: $value');
  }

  
  String? getString(String key) {
    if (_prefs == null) {
      return null;
    }
    final value = _prefs!.getString(key);
 
    return value;
  }

 
  Future<String?> getStringAsync(String key) async {
    final prefs = await _getPrefs();
    final value = prefs.getString(key);
    if (value != null) {
      debugPrint('[LocalStorageService] ✓ Async read "$key": ${value.length} bytes');
    }
    return value;
  }

  Future<void> saveList(String key, List<Map<String, dynamic>> items) async {
    await init();
    final jsonString = jsonEncode(items);
    await _prefs!.setString(key, jsonString);
  }

  List<Map<String, dynamic>> getList(String key) {
    try {
      final jsonString = _prefs?.getString(key);
      if (jsonString == null) return [];
      final decoded = jsonDecode(jsonString);
      if (decoded is List) {
        return decoded.cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      debugPrint('Error loading list from $key: $e');
      return [];
    }
  }

  Future<void> remove(String key) async {
    final prefs = await _getPrefs();
    await prefs.remove(key);
    debugPrint('[LocalStorageService] Removed $key');
  }

  Future<void> clear() async {
    final prefs = await _getPrefs();
    await prefs.clear();
    debugPrint('[LocalStorageService] Cleared all storage');
  }

  bool get isInitialized => _prefs != null;
}
