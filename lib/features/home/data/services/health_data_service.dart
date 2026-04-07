// features/home/data/services/health_data_service.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:patient_app/test_user.dart';

class HealthDataService {
  static final HealthDataService _instance = HealthDataService._internal();
  factory HealthDataService() => _instance;
  HealthDataService._internal();

  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  
  // Track the last API call to prevent duplicates
  DateTime? _lastApiCallTime;
  String? _lastApiCallParams;
  Timer? _debounceTimer;
  
  // Stream for data updates
  final _dataController = StreamController<Map<String, dynamic>?>.broadcast();
  Stream<Map<String, dynamic>?> get dataStream => _dataController.stream;
  
  // Current cached data
  Map<String, dynamic>? _cachedData;
  Map<String, dynamic>? get cachedData => _cachedData;

  Future<Map<String, dynamic>?> fetchAggregatedHealthData({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    // Create a unique key for this request
    final requestKey = '$userId-$date';
    
    // Check if we have cached data and it's less than 30 seconds old
    if (!forceRefresh && _cachedData != null && _lastApiCallTime != null) {
      final age = DateTime.now().difference(_lastApiCallTime!);
      if (age.inSeconds < 30 && _lastApiCallParams == requestKey) {
        debugPrint('[HealthDataService] Returning cached data (${age.inSeconds}s old)');
        return _cachedData;
      }
    }

    // Prevent multiple identical calls within 5 seconds
    if (_lastApiCallTime != null && _lastApiCallParams == requestKey) {
      final age = DateTime.now().difference(_lastApiCallTime!);
      if (age.inSeconds < 5) {
        debugPrint('[HealthDataService] Skipping duplicate API call (${age.inSeconds}s since last)');
        return _cachedData;
      }
    }

    try {
      debugPrint('[HealthDataService] 📤 Fetching data for $userId on $date');
      
      final result = await _functions
          .httpsCallable('getAggregatedHealthData')
          .call({
            'userId': userId,
            'date': date,
          });

      debugPrint('[HealthDataService] 📥 Response received');
      
      _lastApiCallTime = DateTime.now();
      _lastApiCallParams = requestKey;
      _cachedData = Map<String, dynamic>.from(result.data);
      
      // Emit to stream
      _dataController.add(_cachedData);
      
      return _cachedData;
    } catch (e) {
      debugPrint('[HealthDataService] ❌ Error: $e');
      return null;
    }
  }

  void clearCache() {
    _cachedData = null;
    _lastApiCallTime = null;
    _lastApiCallParams = null;
  }

  void dispose() {
    _debounceTimer?.cancel();
    _dataController.close();
  }
}