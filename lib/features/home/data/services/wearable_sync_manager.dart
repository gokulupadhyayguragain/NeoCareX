import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

import 'package:patient_app/features/home/data/services/local_storage_service.dart';
import 'package:patient_app/features/home/data/services/native_wearables_service.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';

class WearablesSyncManager extends ChangeNotifier {
  static const String _syncCacheKey = 'wearables_sync_cache';
  static const String _lastSyncTimeKey = 'wearables_last_sync_time';
  static const String _appleHealthDataKey = 'apple_health_sync_data';
  static const String _appleHealthSyncTimeKey = 'apple_health_sync_time';
  static const String _healthConnectDataKey = 'health_connect_sync_data';
  static const String _healthConnectSyncTimeKey = 'health_connect_sync_time';
  static const String _rookDataPrefix = 'rook_data_';

  final LocalStorageService _storage = LocalStorageService();

  bool _isSyncing = false;
  SyncResponse? _lastSyncResponse;
  DateTime? _lastSyncTime;
  String? _lastErrorMessage;
  Map<String, dynamic>? _appleHealthData;
  DateTime? _appleHealthSyncTime;
  Map<String, dynamic>? _healthConnectData;
  DateTime? _healthConnectSyncTime;
  bool _isLoading = false;

  int _cachedSteps = 0;
  double _cachedHeartRate = 0.0;
  Duration _cachedSleep = Duration.zero;
  double _cachedWeight = 0.0;
  int _cachedHeight = 0;
  double _cachedBMI = 0.0;

  bool get isSyncing => _isSyncing;
  bool get isLoading => _isLoading;
  SyncResponse? get lastSyncResponse => _lastSyncResponse;
  DateTime? get lastSyncTime => _lastSyncTime;
  String? get lastErrorMessage => _lastErrorMessage;
  int get cachedSteps => _cachedSteps;
  double get cachedHeartRate => _cachedHeartRate;
  Duration get cachedSleep => _cachedSleep;
  double get cachedWeight => _cachedWeight;
  int get cachedHeight => _cachedHeight;
  double get cachedBMI => _cachedBMI;

  final RookService _rookService;

  WearablesSyncManager(this._rookService) {
    _initializeAndLoad();
  }

  int getCachedSteps() => _cachedSteps;
  double getCachedHeartRate() => _cachedHeartRate;
  Duration getCachedSleep() => _cachedSleep;

  Future<void> loadFromRook(String userId, DateTime date) async {
    try {
      _isLoading = true;
      notifyListeners();

      final dateStr =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      debugPrint(
        '[WearablesSyncManager] 📥 Loading data from Rook for $dateStr',
      );
      debugPrint(
        '[WearablesSyncManager] Input DateTime: $date (year=${date.year}, month=${date.month}, day=${date.day})',
      );

      final result = await _rookService.getAggregatedHealthData(
        userId,
        dateStr,
        forceRefresh: true,
      );

      if (result != null && result['success'] == true) {
        final healthData = result['data'] as Map<String, dynamic>?;

        if (healthData != null) {
          debugPrint(
            '[WearablesSyncManager] ✅ Got data from Rook for $dateStr',
          );

          if (healthData.containsKey('steps')) {
            final steps = healthData['steps'] as Map?;
            _cachedSteps = steps?['total_steps'] as int? ?? 0;
          }

          _cachedHeartRate = healthData['heart_rate_avg'] as double? ?? 0.0;

          if (healthData.containsKey('sleep') && healthData['sleep'] != null) {
            final sleep = healthData['sleep'] as Map<String, dynamic>?;
            final sleepHealth = sleep?['sleep_health'] as Map<String, dynamic>?;
            final summary = sleepHealth?['summary'] as Map<String, dynamic>?;
            final sleepSummary =
                summary?['sleep_summary'] as Map<String, dynamic>?;
            final duration = sleepSummary?['duration'] as Map<String, dynamic>?;
            final seconds = duration?['sleep_duration_seconds_int'] as int?;

            if (seconds != null && seconds > 0) {
              _cachedSleep = Duration(seconds: seconds);
            }
          }

          if (healthData.containsKey('body') && healthData['body'] != null) {
            final body = healthData['body'] as Map<String, dynamic>?;
            final bodyHealth = body?['body_health'] as Map<String, dynamic>?;
            final summary = bodyHealth?['summary'] as Map<String, dynamic>?;
            final bodySummary =
                summary?['body_summary'] as Map<String, dynamic>?;
            final bodyMetrics =
                bodySummary?['body_metrics'] as Map<String, dynamic>?;

            _cachedWeight = bodyMetrics?['weight_kg_float'] as double? ?? 0.0;
            _cachedHeight = bodyMetrics?['height_cm_int'] as int? ?? 0;
            _cachedBMI = bodyMetrics?['bmi_float'] as double? ?? 0.0;
          }

          debugPrint(
            '[WearablesSyncManager] ✓ Updated cached values - Steps: $_cachedSteps, HR: $_cachedHeartRate, Sleep: ${_cachedSleep.inMinutes}m, Weight: ${_cachedWeight}kg',
          );

          await _storage.saveString(
            '$_rookDataPrefix$dateStr',
            jsonEncode(healthData),
          );

          _lastSyncTime = DateTime.now();
          _lastErrorMessage = null;
        }
      } else {
        
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _lastErrorMessage = e.toString();
      notifyListeners();
      
    }
  }

  Map<String, dynamic> getAppleHealth24HourSummary() {
    final hasData =
        _cachedSteps > 0 ||
        _cachedHeartRate > 0 ||
        _cachedSleep.inSeconds > 0 ||
        _cachedWeight > 0;

    debugPrint(
      '[WearablesSyncManager] Using cached data - Steps: $_cachedSteps, HR: $_cachedHeartRate, HasData: $hasData',
    );

    return {
      'steps': _cachedSteps,
      'heartRate': _cachedHeartRate > 0
          ? _cachedHeartRate.toStringAsFixed(0)
          : '0',
      'sleep': _cachedSleep.inMinutes,
      'weight': _cachedWeight,
      'hasData': hasData,
      'source': 'rook_apple_health',
      'lastUpdated': _lastSyncTime,
    };
  }

  Future<void> reloadAllFromRook(String userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      final today = DateTime.now();
      await loadFromRook(userId, today);

      _isLoading = false;
      notifyListeners();
      
    } catch (e) {
      _isLoading = false;
      
    }
  }

  Future<void> _initializeAndLoad() async {
    try {
      

      await _storage.init();
      

      final cached = await _storage.getStringAsync(_syncCacheKey);
      if (cached != null && cached.isNotEmpty) {
        final decoded = jsonDecode(cached);
        _lastSyncResponse = SyncResponse.fromJson(decoded);
        debugPrint(
          '[WearablesSyncManager] Loaded cached sync response with ${_lastSyncResponse?.data?.length ?? 0} days',
        );
      }

      final syncTimeStr = await _storage.getStringAsync(_lastSyncTimeKey);
      if (syncTimeStr != null && syncTimeStr.isNotEmpty) {
        _lastSyncTime = DateTime.parse(syncTimeStr);
        
      }

      final appleHealthCached = await _storage.getStringAsync(
        _appleHealthDataKey,
      );
      if (appleHealthCached != null && appleHealthCached.isNotEmpty) {
        _appleHealthData = Map<String, dynamic>.from(
          jsonDecode(appleHealthCached),
        );
      }

      final appleHealthTimeStr = await _storage.getStringAsync(
        _appleHealthSyncTimeKey,
      );
      if (appleHealthTimeStr != null && appleHealthTimeStr.isNotEmpty) {
        _appleHealthSyncTime = DateTime.parse(appleHealthTimeStr);
        debugPrint(
          '[WearablesSyncManager] Apple Health last sync was at $_appleHealthSyncTime',
        );
      }

      final healthConnectCached = await _storage.getStringAsync(
        _healthConnectDataKey,
      );
      if (healthConnectCached != null && healthConnectCached.isNotEmpty) {
        _healthConnectData = Map<String, dynamic>.from(
          jsonDecode(healthConnectCached),
        );
        debugPrint(
          '[WearablesSyncManager] ✓✓✓ Loaded cached Health Connect data on init',
        );
      }

      final healthConnectTimeStr = await _storage.getStringAsync(
        _healthConnectSyncTimeKey,
      );
      if (healthConnectTimeStr != null && healthConnectTimeStr.isNotEmpty) {
        _healthConnectSyncTime = DateTime.parse(healthConnectTimeStr);
      }

      notifyListeners();
      debugPrint(
        '[WearablesSyncManager] ✓✓✓ Async initialization completed successfully',
      );
    } catch (e) {
      
    }
  }

  Future<SyncResponse> syncWearableData({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    if (_isSyncing) {
      
      return _lastSyncResponse ??
          SyncResponse(success: false, message: 'Sync already in progress');
    }

    try {
      _isSyncing = true;
      _lastErrorMessage = null;
      notifyListeners();

      debugPrint(
        '[WearablesSyncManager] Starting sync from ${startDate.toIso8601String()} to ${endDate.toIso8601String()}',
      );

      final response = await NativeWearablesService.syncWearableData(
        startDate: startDate,
        endDate: endDate,
      );

      if (response.success) {
        _lastSyncResponse = response;
        _lastSyncTime = DateTime.now();
        _lastErrorMessage = null;

        await _storage.saveString(_syncCacheKey, jsonEncode(response.toJson()));
        await _storage.saveString(
          _lastSyncTimeKey,
          _lastSyncTime!.toIso8601String(),
        );

        debugPrint(
          '[WearablesSyncManager] Sync successful with ${response.data?.length ?? 0} days of data',
        );
      } else {
        _lastErrorMessage =
            response.error ?? response.message ?? 'Unknown error';
        
      }

      return response;
    } catch (e) {
      _lastErrorMessage = e.toString();
      
      return SyncResponse(
        success: false,
        error: _lastErrorMessage,
        message: 'Failed to sync wearable data',
      );
    } finally {
      _isSyncing = false;
      notifyListeners();
    }
  }

  Future<SyncResponse> syncLastNDays(int days) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    return syncWearableData(startDate: startDate, endDate: endDate);
  }

  Future<SyncResponse> syncToday() async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    return syncWearableData(startDate: startDate, endDate: now);
  }

  Future<SyncResponse> syncThisWeek() async {
    return syncLastNDays(7);
  }

  Future<SyncResponse> syncThisMonth() async {
    return syncLastNDays(30);
  }

  List<WearableMetric> getHeartRateData() {
    if (_lastSyncResponse?.data == null) return [];
    return NativeWearablesService.getHeartRateMetrics(_lastSyncResponse!.data!);
  }

  List<WearableMetric> getStepsData() {
    if (_lastSyncResponse?.data == null) return [];
    return NativeWearablesService.getStepsMetrics(_lastSyncResponse!.data!);
  }

  List<WearableMetric> getSleepData() {
    if (_lastSyncResponse?.data == null) return [];
    return NativeWearablesService.getSleepMetrics(_lastSyncResponse!.data!);
  }

  List<WearableMetric> getMetricsByType(String type) {
    if (_lastSyncResponse?.data == null) return [];
    return NativeWearablesService.getMetricsByType(
      _lastSyncResponse!.data!,
      type,
    );
  }

  double getAverageHeartRate() {
    final metrics = getHeartRateData();
    if (metrics.isEmpty) return 0;
    final total = metrics.fold<double>(0, (sum, m) => sum + m.value);
    return total / metrics.length;
  }

  int getTotalSteps() {
    final metrics = getStepsData();
    return metrics.fold<int>(0, (sum, m) => sum + m.value.toInt());
  }

  int getTotalSleep() {
    final metrics = getSleepData();
    return metrics.fold<int>(0, (sum, m) => sum + m.value.toInt());
  }

  Map<String, dynamic> getHealthConnect24HourSummary() {
    if (_lastSyncResponse?.data == null || _lastSyncResponse!.data!.isEmpty) {
      return {
        'steps': 0,
        'distance': 0.0,
        'heartRate': 0.0,
        'sleep': 0,
        'hasData': false,
      };
    }

    try {
      final todayData = _lastSyncResponse!.data!.last;

      int totalSteps = 0;
      double totalDistance = 0.0;
      double avgHeartRate = 0.0;
      int totalSleepMinutes = 0;
      int heartRateCount = 0;

      for (final metric in todayData.metrics) {
        switch (metric.type) {
          case 'steps':
            totalSteps += metric.value.toInt();
            break;
          case 'distance':
            totalDistance += metric.value;
            break;
          case 'heart_rate':
            avgHeartRate += metric.value;
            heartRateCount++;
            break;
          case 'sleep':
            totalSleepMinutes += metric.value.toInt();
            break;
        }
      }

      if (heartRateCount > 0) {
        avgHeartRate = avgHeartRate / heartRateCount;
      }

      return {
        'steps': totalSteps,
        'distance': (totalDistance / 1000).toStringAsFixed(2),
        'heartRate': avgHeartRate > 0 ? avgHeartRate.toStringAsFixed(0) : '0',
        'sleep': totalSleepMinutes,
        'hasData': true,
        'source': 'health_connect',
        'lastUpdated': _lastSyncTime,
      };
    } catch (e) {
      
      return {
        'steps': 0,
        'distance': 0.0,
        'heartRate': 0.0,
        'sleep': 0,
        'hasData': false,
      };
    }
  }

  Future<void> clearCache() async {
    try {
      await _storage.remove(_syncCacheKey);
      await _storage.remove(_lastSyncTimeKey);
      _lastSyncResponse = null;
      _lastSyncTime = null;
      _lastErrorMessage = null;
      notifyListeners();
      
    } catch (e) {
      
    }
  }

  Future<bool> requestHealthKitAccess() async {
    return NativeWearablesService.requestHealthKitAccess();
  }

  Map<String, dynamic> getStatistics() {
    if (_lastSyncResponse?.data == null || _lastSyncResponse!.data!.isEmpty) {
      return {
        'avg_heart_rate': 0,
        'total_steps': 0,
        'total_sleep_hours': 0,
        'data_points': 0,
      };
    }

    getHeartRateData();
    getStepsData();
    getSleepData();

    return {
      'avg_heart_rate': getAverageHeartRate().toStringAsFixed(1),
      'total_steps': getTotalSteps(),
      'total_sleep_hours': (getTotalSleep() / 60).toStringAsFixed(2),
      'data_points': _lastSyncResponse!.data!.fold<int>(
        0,
        (total, daily) => total + daily.metrics.length,
      ),
      'days_synced': _lastSyncResponse!.data!.length,
      'last_sync': _lastSyncTime?.toString() ?? 'Never',
    };
  }

  Future<void> storeAppleHealthSyncData(Map<String, dynamic> data) async {
    try {
      _appleHealthData = data;
      _appleHealthSyncTime = DateTime.now();

      await _storage.saveString(_appleHealthDataKey, jsonEncode(data));
      await _storage.saveString(
        _appleHealthSyncTimeKey,
        _appleHealthSyncTime!.toIso8601String(),
      );

      
      debugPrint(
        '[WearablesSyncManager] Apple Health data keys: ${data.keys.toList()}',
      );
      notifyListeners();
    } catch (e) {
      
    }
  }

  Map<String, dynamic>? getStoredAppleHealthData() {
    return _appleHealthData;
  }

  Future<void> storeHealthConnectSyncData(Map<String, dynamic> data) async {
    try {
      _healthConnectData = data;
      _healthConnectSyncTime = DateTime.now();

      await _storage.saveString(_healthConnectDataKey, jsonEncode(data));
      await _storage.saveString(
        _healthConnectSyncTimeKey,
        _healthConnectSyncTime!.toIso8601String(),
      );

      
      debugPrint(
        '[WearablesSyncManager] Health Connect data keys: ${data.keys.toList()}',
      );
      notifyListeners();
    } catch (e) {
      debugPrint(
        '[WearablesSyncManager] Error storing Health Connect data: $e',
      );
    }
  }

  Map<String, dynamic>? getStoredHealthConnectData() {
    return _healthConnectData;
  }

  Future<void> clearAppleHealthData() async {
    try {
      await _storage.remove(_appleHealthDataKey);
      await _storage.remove(_appleHealthSyncTimeKey);
      _appleHealthData = null;
      _appleHealthSyncTime = null;
      notifyListeners();
      
    } catch (e) {
      
    }
  }

  Future<void> clearHealthConnectData() async {
    try {
      await _storage.remove(_healthConnectDataKey);
      await _storage.remove(_healthConnectSyncTimeKey);
      _healthConnectData = null;
      _healthConnectSyncTime = null;
      notifyListeners();
      
    } catch (e) {
      debugPrint(
        '[WearablesSyncManager] Error clearing Health Connect data: $e',
      );
    }
  }

  DateTime? getAppleHealthSyncTime() {
    return _appleHealthSyncTime;
  }

  DateTime? getHealthConnectSyncTime() {
    return _healthConnectSyncTime;
  }

  Future<void> reloadCachedData() async {
    await _initializeAndLoad();
  }

  bool get isInitialized => _storage.isInitialized;

  void setCachedSteps(int steps) {
    _cachedSteps = steps;
    notifyListeners();
    
  }

  void setCachedHeartRate(double heartRate) {
    _cachedHeartRate = heartRate;
    notifyListeners();
    debugPrint(
      '[WearablesSyncManager] Cached heart rate: ${heartRate.toStringAsFixed(1)} bpm',
    );
  }

  void setCachedWeight(double weight) {
    _cachedWeight = weight;
    notifyListeners();
    debugPrint(
      '[WearablesSyncManager] Cached weight: ${weight.toStringAsFixed(1)} kg',
    );
  }

  void setCachedHeight(int height) {
    _cachedHeight = height;
    notifyListeners();
    
  }

  void setCachedBMI(double bmi) {
    _cachedBMI = bmi;
    notifyListeners();
    
  }

  void setCachedSleep(Duration sleep) {
    _cachedSleep = sleep;
    notifyListeners();
    
  }
}
