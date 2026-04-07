import 'dart:convert';
import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:patient_app/features/home/data/models/rook_config.dart';
import 'package:patient_app/features/home/data/services/local_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

class RookService extends ChangeNotifier {
  static const String _storageKey = 'rook_config';
  static const String _connectedWearablesKey = 'connected_wearables';
  static const String _healthDataCacheKey = 'rook_health_data_cache';
  static const String _lastSyncKey = 'rook_last_sync';
  static const String _userProfileKey = 'rook_user_profile';

  final LocalStorageService storage = LocalStorageService();

  RookConfig _config = RookConfig.initial();
  bool _isInitialized = false;
  String? _registeredUserId;
  Set<String> _connectedWearables = {};
  Map<String, dynamic> _healthDataCache = {};
  Map<String, dynamic>? _userProfile;

  Stream<DocumentSnapshot>? _realtimeStream;
  StreamSubscription<DocumentSnapshot>? _realtimeSubscription;

  Map<String, dynamic> _realtimeTodayData = {};
  int _realtimeSteps = 0;
  double _realtimeHeartRate = 0.0;
  int _realtimeCalories = 0;
  DateTime? _realtimeLastUpdated;
  bool _isRealtimeConnected = false;

  int _historicalSleepMinutes = 0;
  double _historicalWeightKg = 0.0;
  double _historicalBmi = 0.0;
  int _historicalHeightCm = 0;

  final _webhookDataReadyController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _webhookDeviceConnectedController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _webhookDeviceDisconnectedController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _webhookUserRegisteredController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _authorizationCompleteController =
      StreamController<Map<String, dynamic>>.broadcast();

  late FirebaseFunctions _functions;

  RookConfig get config => _config;
  bool get isInitialized => _isInitialized;
  bool get isReady => _config.isReady;
  Set<String> get connectedWearables => _connectedWearables;
  Map<String, dynamic> get healthDataCache => Map.from(_healthDataCache);
  Map<String, dynamic>? get userProfile => _userProfile;

  int get realtimeSteps => _realtimeSteps;
  double get realtimeHeartRate => _realtimeHeartRate;
  int get realtimeCalories => _realtimeCalories;
  DateTime? get realtimeLastUpdated => _realtimeLastUpdated;
  bool get isRealtimeConnected => _isRealtimeConnected;
  Map<String, dynamic> get realtimeTodayData => _realtimeTodayData;

  int get historicalSleepMinutes => _historicalSleepMinutes;
  double get historicalWeightKg => _historicalWeightKg;
  double get historicalBmi => _historicalBmi;
  int get historicalHeightCm => _historicalHeightCm;

  Stream<Map<String, dynamic>> get onWebhookDataReady =>
      _webhookDataReadyController.stream;
  Stream<Map<String, dynamic>> get onWebhookDeviceConnected =>
      _webhookDeviceConnectedController.stream;
  Stream<Map<String, dynamic>> get onWebhookDeviceDisconnected =>
      _webhookDeviceDisconnectedController.stream;
  Stream<Map<String, dynamic>> get onWebhookUserRegistered =>
      _webhookUserRegisteredController.stream;
  Stream<Map<String, dynamic>> get onAuthorizationComplete =>
      _authorizationCompleteController.stream;

  Future<String> _getDeviceTimezone() async {
    try {
      final timezoneInfo = await FlutterTimezone.getLocalTimezone();
      final timezoneName = timezoneInfo.identifier;
      debugPrint('[RookService] 📍 Detected device timezone: $timezoneName');
      return timezoneName;
    } catch (e) {
      debugPrint(
        '[RookService] ⚠️ Could not detect timezone, falling back to UTC: $e',
      );
      return 'UTC';
    }
  }

  Future<String> _getUserTimezone() async {
    final stored = _userProfile?['timezone'];
    if (stored != null && stored is String && stored.isNotEmpty) {
      debugPrint('[RookService] 🕐 Using stored timezone: $stored');
      return stored;
    }
    debugPrint('[RookService] 🕐 No stored timezone — detecting from device');
    return await _getDeviceTimezone();
  }

  Future<void> init({String? userId}) async {
    try {
      _functions = FirebaseFunctions.instance;

      final jsonStr = await storage.getString(_storageKey);
      if (jsonStr != null && jsonStr.isNotEmpty) {
        final jsonMap = jsonDecode(jsonStr);
        _config = RookConfig.fromJson(jsonMap);
      } else {
        _config = RookConfig.initial();
      }

      await _loadConnectedWearables();
      await _loadHealthDataCache();
      await _loadUserProfile();

      if (userId != null && userId.isNotEmpty) {
        _registeredUserId = userId;
        startRealtimeUpdates(userId);
      }
    } catch (e) {
      debugPrint('RookService init error: $e');
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> _loadConnectedWearables() async {
    try {
      final cached = await storage.getString(_connectedWearablesKey);
      if (cached != null && cached.isNotEmpty) {
        _connectedWearables = Set<String>.from(jsonDecode(cached) as List);
      }
    } catch (e) {
      debugPrint('Error loading wearables: $e');
    }
  }

  Future<void> _loadHealthDataCache() async {
    try {
      final cached = storage.getString(_healthDataCacheKey);
      if (cached != null && cached.isNotEmpty) {
        _healthDataCache = Map<String, dynamic>.from(jsonDecode(cached));
      }
    } catch (e) {
      debugPrint('Error loading health cache: $e');
    }
  }

  Future<void> _loadUserProfile() async {
    try {
      final profile = storage.getString(_userProfileKey);
      if (profile != null && profile.isNotEmpty) {
        _userProfile = Map<String, dynamic>.from(jsonDecode(profile));
      }
    } catch (e) {
      debugPrint('Error loading user profile: $e');
    }
  }

  void startRealtimeUpdates(String userId) {
    try {
      _realtimeSubscription?.cancel();

      final firestore = FirebaseFirestore.instance;
      _realtimeStream = firestore
          .collection('rook_realtime_data')
          .doc(userId)
          .snapshots(includeMetadataChanges: true);

      _realtimeSubscription = _realtimeStream!.listen(
        (snapshot) {
          if (snapshot.exists) {
            final data = snapshot.data() as Map<String, dynamic>;
            _processRealtimeData(data);
            _isRealtimeConnected = true;
          } else {
            _isRealtimeConnected = false;
          }
        },
        onError: (error) {
          debugPrint('[RookService] Firestore stream error: $error');
          _isRealtimeConnected = false;
        },
      );
    } catch (e) {
      debugPrint('[RookService] startRealtimeUpdates error: $e');
      _isRealtimeConnected = false;
    }
  }

  void stopRealtimeUpdates() {
    debugPrint('[RookService] Stopping real-time updates');
    _realtimeSubscription?.cancel();
    _realtimeStream = null;
    _isRealtimeConnected = false;
  }

  void _processRealtimeData(Map<String, dynamic> data) {
    _realtimeTodayData = data;

    if (data.containsKey('lastUpdated') && data['lastUpdated'] != null) {
      try {
        final ts = data['lastUpdated'];
        if (ts is Timestamp) {
          _realtimeLastUpdated = ts.toDate();
        }
      } catch (_) {}
    }

    if (data.containsKey('today') && data['today'] != null) {
      final todayNode = data['today'] as Map<String, dynamic>;

      if (todayNode.containsKey('steps') && todayNode['steps'] != null) {
        final steps =
            (todayNode['steps'] as Map<String, dynamic>)['total_steps'];
        if (steps != null && (steps as num).toInt() > 0) {
          _realtimeSteps = (steps).toInt();
        }
      }

      if (todayNode.containsKey('heartRate') &&
          todayNode['heartRate'] != null) {
        final hr = (todayNode['heartRate'] as Map<String, dynamic>)['avg_bpm'];
        if (hr != null) {
          final hrDouble = (hr as num).toDouble();
          if (hrDouble > 0) _realtimeHeartRate = hrDouble;
        }
      }

      if (todayNode.containsKey('calories') && todayNode['calories'] != null) {
        final cal = (todayNode['calories'] as Map<String, dynamic>)['calories'];
        if (cal != null && (cal as num).toInt() > 0) {
          _realtimeCalories = (cal).toInt();
        }
      }
    } else {
      debugPrint('[RookService] ⚠️ No "today" node in Firestore document');
    }

    if (data.containsKey('historical') && data['historical'] != null) {
      final historical = data['historical'] as Map<String, dynamic>;

      if (historical.containsKey('sleep') && historical['sleep'] != null) {
        final sleepData = historical['sleep'] as Map<String, dynamic>;
        final minutes = sleepData['minutes'] as int? ?? 0;
        if (minutes > 0) _historicalSleepMinutes = minutes;
      }

      if (historical.containsKey('body') && historical['body'] != null) {
        final bodyData = historical['body'] as Map<String, dynamic>;
        final w = (bodyData['weight_kg'] as num?)?.toDouble() ?? 0.0;
        final b = (bodyData['bmi'] as num?)?.toDouble() ?? 0.0;
        final h = bodyData['height_cm'] as int? ?? 0;
        if (w > 0) _historicalWeightKg = w;
        if (b > 0) _historicalBmi = b;
        if (h > 0) _historicalHeightCm = h;
      }
    } else {
      debugPrint('[RookService] ⚠️ No "historical" node in Firestore document');
    }

    notifyListeners();
  }

  void _processFallbackData(Map<String, dynamic> data) {
    debugPrint('[RookService] 📦 Processing fallback (yesterday) data');

    if (data.containsKey('physical') && data['physical'] != null) {
      final physical = _safeCastToMap(data['physical']);
      final physSummary = _safeCastToMap(
        _safeCastToMap(
          _safeCastToMap(physical['physical_health'])['summary'],
        )['physical_summary'],
      );

      final distance = _safeCastToMap(physSummary['distance']);
      final steps = distance['steps_int'] as int? ?? 0;
      if (steps > 0) _realtimeSteps = steps;

      final hr = _safeCastToMap(physSummary['heart_rate']);
      final hrVal = hr['hr_avg_bpm_int'] as int? ?? 0;
      if (hrVal > 0) _realtimeHeartRate = hrVal.toDouble();

      final cal = _safeCastToMap(physSummary['calories']);
      final calVal =
          (cal['calories_expenditure_kcal_float'] as num?)?.toInt() ?? 0;
      if (calVal > 0) _realtimeCalories = calVal;
    }

    if (data.containsKey('sleep') && data['sleep'] != null) {
      final sleep = _safeCastToMap(data['sleep']);
      final sleepSummary = _safeCastToMap(
        _safeCastToMap(
          _safeCastToMap(sleep['sleep_health'])['summary'],
        )['sleep_summary'],
      );
      final seconds =
          _safeCastToMap(sleepSummary['duration'])['sleep_duration_seconds_int']
              as int? ??
          0;
      if (seconds > 0) _historicalSleepMinutes = seconds ~/ 60;
    }

    if (data.containsKey('body') && data['body'] != null) {
      final body = _safeCastToMap(data['body']);
      final bodyMetrics = _safeCastToMap(
        _safeCastToMap(
          _safeCastToMap(body['body_health'])['summary'],
        )['body_summary'],
      )['body_metrics'];
      if (bodyMetrics != null) {
        final metrics = _safeCastToMap(bodyMetrics);
        final w = (metrics['weight_kg_float'] as num?)?.toDouble() ?? 0.0;
        final b = (metrics['bmi_float'] as num?)?.toDouble() ?? 0.0;
        final h = metrics['height_cm_int'] as int? ?? 0;
        if (w > 0) _historicalWeightKg = w;
        if (b > 0) _historicalBmi = b;
        if (h > 0) _historicalHeightCm = h;
      }
    }

    _realtimeLastUpdated = DateTime.now();
    notifyListeners();
  }

  Future<void> refreshTodayData(String userId) async {
    try {
      debugPrint('[RookService] 🔄 refreshTodayData() called');

      final userTimezone = await _getUserTimezone();
      debugPrint(
        '[RookService] → Calling getRealtimeTodayData with tz=$userTimezone',
      );

      final result = await _functions
          .httpsCallable('getRealtimeTodayData')
          .call({'userId': userId, 'timezone': userTimezone});

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);

        if (data.containsKey('today')) {
          debugPrint('[RookService] ✅ Processing Firestore-format today data');
          _processRealtimeData(data);
        } else if (data.containsKey('physical') ||
            data.containsKey('sleep') ||
            data.containsKey('body')) {
          debugPrint('[RookService] ✅ Processing fallback yesterday data');
          _processFallbackData(data);
        } else {
          debugPrint('[RookService] ⚠️ Unrecognised data shape: ${data.keys}');
        }
      } else {
        debugPrint(
          '[RookService] ⚠️ getRealtimeTodayData: ${responseData['message']}',
        );
      }
    } catch (e) {
      debugPrint('[RookService] ❌ Error in refreshTodayData: $e');
    }
  }

  Future<Map<String, dynamic>?> getAggregatedHealthData(
    String userId,
    String date, {
    bool forceRefresh = false,
  }) async {
    try {
      final cacheKey = _buildCacheKey('aggregated', userId, date);

      final now = DateTime.now();
      final todayStr = _formatDate(now);
      final isToday = date == todayStr;

      debugPrint(
        '[RookService] getAggregatedHealthData: date=$date, todayStr=$todayStr, isToday=$isToday',
      );

      final userTimezone = await _getUserTimezone();

      if (isToday) {
        debugPrint(
          '[RookService] Requesting real-time data from Firebase for today',
        );
        final result = await _functions
            .httpsCallable('getRealtimeTodayData')
            .call({'userId': userId, 'timezone': userTimezone});

        final responseData = _safeCastToMap(result.data);

        if (responseData['success'] == true) {
          debugPrint('[RookService] ✅ Got real-time data for today');
          return responseData;
        }

        debugPrint('[RookService] ⚠️ ${responseData['message']}');
        return responseData;
      }

      if (!forceRefresh && _healthDataCache.containsKey(cacheKey)) {
        final cached = _healthDataCache[cacheKey];
        if (cached is Map && cached.containsKey('cachedAt')) {
          try {
            final cacheTime = DateTime.parse(cached['cachedAt']);
            if (DateTime.now().difference(cacheTime).inHours < 24) {
              debugPrint(
                '[RookService] Using cached aggregated data for $date',
              );
              final cachedData = cached['data'];
              if (cachedData != null) {
                return {'success': true, 'data': cachedData};
              }
            }
          } catch (e) {
            debugPrint('[RookService] Cache parse error: $e');
          }
        }
      }

      final result = await _functions
          .httpsCallable('getAggregatedHealthData')
          .call({'userId': userId, 'date': date, 'timezone': userTimezone});

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);
        _healthDataCache[cacheKey] = {
          'data': data,
          'cachedAt': DateTime.now().toIso8601String(),
        };
        await _cacheHealthData();
        return responseData;
      }

      debugPrint('[RookService] ⚠️ No data available for $date');
      return null;
    } catch (e) {
      debugPrint('[RookService] Error fetching aggregated data: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getYesterdayData(
    String userId, {
    bool forceRefresh = false,
  }) async {
    try {
      final userTimezone = await _getUserTimezone();
      debugPrint('[RookService] getYesterdayData with tz=$userTimezone');

      final result = await _functions
          .httpsCallable('getYesterdayHealthData')
          .call({'userId': userId, 'timezone': userTimezone});

      final responseData = _safeCastToMap(result.data);
      debugPrint('[RookService] getYesterdayData: ${responseData['success']}');
      return responseData;
    } catch (e) {
      debugPrint('[RookService] Error getting yesterday data: $e');
      return {
        'success': false,
        'data': null,
        'message': 'Error fetching yesterday\'s data: $e',
      };
    }
  }

  Future<Map<String, dynamic>?> getPhysicalHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      final cacheKey = _buildCacheKey('physical', userId, date);

      if (!forceRefresh && _healthDataCache.containsKey(cacheKey)) {
        final cached = _healthDataCache[cacheKey];
        if (cached is Map && cached.containsKey('cachedAt')) {
          try {
            final cacheTime = DateTime.parse(cached['cachedAt']);
            if (DateTime.now().difference(cacheTime).inHours < 24) {
              debugPrint('[RookService] Using cached physical data for $date');
              return cached['data'];
            }
          } catch (e) {
            debugPrint('[RookService] Cache parse error: $e');
          }
        }
      }

      debugPrint('[RookService] Fetching physical health summary for $date');

      final result = await _functions
          .httpsCallable('getPhysicalHealthSummary')
          .call({'userId': userId, 'date': date});

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);
        _healthDataCache[cacheKey] = {
          'data': data,
          'cachedAt': DateTime.now().toIso8601String(),
        };
        await _cacheHealthData();
        return responseData;
      }

      return null;
    } catch (e) {
      debugPrint('[RookService] Error fetching physical health: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getSleepHealthSummary({
    required String userId,
    required String date,
    bool forceRefresh = false,
  }) async {
    try {
      final cacheKey = _buildCacheKey('sleep', userId, date);

      if (!forceRefresh && _healthDataCache.containsKey(cacheKey)) {
        final cached = _healthDataCache[cacheKey];
        if (cached is Map && cached.containsKey('cachedAt')) {
          try {
            final cacheTime = DateTime.parse(cached['cachedAt']);
            if (DateTime.now().difference(cacheTime).inHours < 24) {
              debugPrint('[RookService] Using cached sleep data for $date');
              return cached['data'];
            }
          } catch (e) {
            debugPrint('[RookService] Cache parse error: $e');
          }
        }
      }

      debugPrint('[RookService] Fetching sleep health summary for $date');

      final result = await _functions
          .httpsCallable('getSleepHealthSummary')
          .call({'userId': userId, 'date': date});

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);
        _healthDataCache[cacheKey] = {
          'data': data,
          'cachedAt': DateTime.now().toIso8601String(),
        };
        await _cacheHealthData();
        return responseData;
      }

      return null;
    } catch (e) {
      debugPrint('[RookService] Error fetching sleep health: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getHeartRateEvent({
    required String userId,
    required String date,
  }) async {
    try {
      final cacheKey = _buildCacheKey('heartrate', userId, date);

      if (_healthDataCache.containsKey(cacheKey)) {
        return _healthDataCache[cacheKey]['data'];
      }

      debugPrint('[RookService] Fetching heart rate event for $date');

      final result = await _functions.httpsCallable('getHeartRateEvent').call({
        'userId': userId,
        'date': date,
      });

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);
        _healthDataCache[cacheKey] = {
          'data': data,
          'cachedAt': DateTime.now().toIso8601String(),
        };
        await _cacheHealthData();
        return responseData;
      }

      return null;
    } catch (e) {
      debugPrint('[RookService] Error fetching heart rate event: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getStepsEvent({
    required String userId,
    required String date,
  }) async {
    try {
      final cacheKey = _buildCacheKey('steps', userId, date);

      if (_healthDataCache.containsKey(cacheKey)) {
        return _healthDataCache[cacheKey]['data'];
      }

      debugPrint('[RookService] Fetching steps event for $date');

      final result = await _functions.httpsCallable('getStepsEvent').call({
        'userId': userId,
        'date': date,
      });

      final responseData = _safeCastToMap(result.data);

      if (responseData['success'] == true && responseData['data'] != null) {
        final data = _safeCastToMap(responseData['data']);
        _healthDataCache[cacheKey] = {
          'data': data,
          'cachedAt': DateTime.now().toIso8601String(),
        };
        await _cacheHealthData();
        return responseData;
      }

      return null;
    } catch (e) {
      debugPrint('[RookService] Error fetching steps event: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAllHealthDataForDate(
    String userId,
    String date, {
    bool forceRefresh = false,
  }) {
    return getAggregatedHealthData(userId, date, forceRefresh: forceRefresh);
  }

  Future<void> registerUser(String userId) async {
    if (userId.isEmpty || userId.trim().isEmpty) {
      throw Exception('userId cannot be empty');
    }

    userId = userId.trim();
    debugPrint('[RookService] Registering user: $userId');

    if (_registeredUserId == userId) {
      debugPrint('[RookService] User $userId already registered');
      return;
    }

    try {
      final timezone = await _getDeviceTimezone();

      final payload = {
        'userId': userId,
        'timezone': timezone,
        'dateOfBirthString':
            _userProfile?['date_of_birth_string'] ?? '2000-01-01',
        'heightCmInt': _userProfile?['height_cm_int'] ?? 170,
        'weightKgFloat': _userProfile?['weight_kg_float'] ?? 70.5,
        'bmiFloat': _userProfile?['bmi_float'] ?? 24.2,
        'sexString': _userProfile?['sex_string'] ?? 'male',
      };

      debugPrint('[RookService] Register payload with timezone: $timezone');

      final result = await _functions
          .httpsCallable('registerUser')
          .call(payload);

      debugPrint('[RookService] Register response: ${result.data}');
      _registeredUserId = userId;

      _userProfile ??= {};
      _userProfile!['timezone'] = timezone;
      await storage.saveString(_userProfileKey, jsonEncode(_userProfile));

      startRealtimeUpdates(userId);
    } catch (e) {
      debugPrint('[RookService] Error registering user: $e');
      rethrow;
    }
  }

  Future<void> connectDataSource(String userId, String providerKey) async {
    try {
      await registerUser(userId);

      if (providerKey == 'apple_health') {
        throw Exception('Apple Health is not available on web');
      }

      final sources = await getAuthorizedDataSources(userId);
      if (sources != null && sources.containsKey('dataSources')) {
        final dataSources = sources['dataSources'] as List;
        final isAuthorized = dataSources.any((ds) {
          return ds['data_source']?.toString().toLowerCase() ==
                  _mapProviderKeyToDataSourceName(providerKey)?.toLowerCase() &&
              ds['authorized'] == true;
        });

        if (isAuthorized) {
          debugPrint('[RookService] Already authorized for $providerKey');
          _connectedWearables.add(providerKey);
          await _cacheConnectedWearables();
          notifyListeners();
          return;
        }
      }

      await _connectRemoteSource(userId, providerKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> disconnectDataSource(String userId, String providerKey) async {
    try {
      final dataSourceName = _mapProviderKeyToDataSourceName(providerKey);
      if (dataSourceName == null) {
        throw Exception('Unknown provider: $providerKey');
      }

      final result = await _functions.httpsCallable('revokeDataSource').call({
        'userId': userId,
        'dataSource': dataSourceName,
      });

      if (result.data != null) {
        final responseData = result.data as Map<String, dynamic>;

        if (responseData['success'] == true) {
          _connectedWearables.remove(providerKey);
          await _cacheConnectedWearables();

          _healthDataCache.removeWhere(
            (key, value) => key.contains(providerKey),
          );
          await _cacheHealthData();

          notifyListeners();

          await Future.delayed(const Duration(seconds: 2));
          await getAuthorizedDataSources(userId);
        } else {
          throw Exception('Failed to disconnect: ${responseData['message']}');
        }
      } else {
        throw Exception('No response received from revoke function');
      }
    } catch (e) {
      debugPrint('[RookService] ✗ Disconnect $providerKey failed: $e');
      rethrow;
    }
  }

  Future<void> _connectRemoteSource(String userId, String providerKey) async {
    if (_registeredUserId == null) {
      throw Exception('User not registered');
    }

    final dataSourceName = _mapProviderKeyToDataSourceName(providerKey);
    if (dataSourceName == null) {
      throw Exception('Unknown provider: $providerKey');
    }

    try {
      final result = await _functions.httpsCallable('getAuthorizationUrl').call(
        {'userId': userId, 'dataSource': dataSourceName},
      );

      final authUrl = result.data['authorizationUrl'] as String?;
      final authorized = result.data['authorized'] as bool? ?? false;

      if (authorized) {
        debugPrint('[RookService] ✓ User already authorized for $providerKey');
        _connectedWearables.add(providerKey);
        await _cacheConnectedWearables();
        notifyListeners();
        return;
      }

      if (authUrl == null || authUrl.isEmpty) {
        throw Exception(
          'No authorization URL received. Response: ${result.data}',
        );
      }

      final uri = Uri.parse(authUrl);
      if (await canLaunchUrl(uri)) {
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );

        if (!launched) {
          throw Exception('Failed to launch authorization URL');
        }

        await _verifyConnectionAfterAuth(userId, providerKey);
      } else {
        throw Exception('Cannot launch authorization URL: $authUrl');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _verifyConnectionAfterAuth(
    String userId,
    String providerKey,
  ) async {
    try {
      const int maxChecks = 15;
      int checkCount = 0;

      while (checkCount < maxChecks) {
        await Future.delayed(const Duration(seconds: 3));
        checkCount++;

        try {
          final result = await _functions
              .httpsCallable('getAuthorizedDataSources')
              .call({'userId': userId});

          final dataSources = result.data['dataSources'] as List?;
          if (dataSources != null) {
            final isConnected = dataSources.any((ds) {
              return (ds['data_source'] as String?)?.toLowerCase() ==
                      providerKey.toLowerCase() &&
                  ds['authorized'] == true;
            });

            if (isConnected) {
              _connectedWearables.add(providerKey);
              await _cacheConnectedWearables();
              notifyListeners();
              return;
            }
          }
        } catch (e) {
          debugPrint('Error verifying connection: $e');
        }
      }
      throw Exception(
        'Connection verification timed out. Please check if you completed the authorization.',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getAuthorizedDataSources(String userId) async {
    try {
      if (userId.isEmpty || userId.trim().isEmpty) {
        throw Exception('userId cannot be empty');
      }

      userId = userId.trim();
      debugPrint('[RookService] Getting authorized sources for: $userId');

      final result = await _functions
          .httpsCallable('getAuthorizedDataSources')
          .call({'userId': userId});

      debugPrint('[RookService] Raw response: ${result.data}');

      Map<String, dynamic> responseData;
      if (result.data is Map) {
        responseData = Map<String, dynamic>.from(result.data as Map);
      } else {
        debugPrint(
          '[RookService] Unexpected response type: ${result.data.runtimeType}',
        );
        return null;
      }

      if (responseData.containsKey('dataSources')) {
        final dataSources = responseData['dataSources'] as List?;
        if (dataSources != null) {
          debugPrint('[RookService] Found ${dataSources.length} data sources');

          _connectedWearables.clear();
          for (final source in dataSources) {
            if (source is Map && source['authorized'] == true) {
              final sourceName = source['data_source'] as String?;
              if (sourceName != null) {
                final providerKey = _mapDataSourceNameToProviderKey(sourceName);
                if (providerKey != null) {
                  _connectedWearables.add(providerKey);
                  debugPrint('[RookService] Added connected: $providerKey');
                }
              }
            }
          }

          await _cacheConnectedWearables();
          notifyListeners();
        }
      }

      return responseData;
    } catch (e) {
      debugPrint('[RookService] Error getting authorized sources: $e');
      return null;
    }
  }

  void handleWebhookEvent(Map<String, dynamic> event) {
    final eventType = event['event_type'] as String?;
    debugPrint('[RookService] 📨 Webhook event received: $eventType');

    switch (eventType) {
      case 'data_ready':
        _webhookDataReadyController.add(event);
        if (_registeredUserId != null) {
          refreshTodayData(_registeredUserId!);
        }
        break;

      case 'device_connected':
        _webhookDeviceConnectedController.add(event);
        final deviceType = event['device_type'] as String?;
        if (deviceType != null) {
          _connectedWearables.add(deviceType.toLowerCase());
          _cacheConnectedWearables();
          notifyListeners();
        }
        break;

      case 'device_disconnected':
        _webhookDeviceDisconnectedController.add(event);
        final deviceType = event['device_type'] as String?;
        if (deviceType != null) {
          _connectedWearables.remove(deviceType.toLowerCase());
          _cacheConnectedWearables();
          notifyListeners();
        }
        break;

      case 'user_registered':
        _webhookUserRegisteredController.add(event);
        break;
    }
  }

  Future<void> saveUserProfile({
    required String dateOfBirthString,
    required int heightCmInt,
    required double weightKgFloat,
    required double bmiFloat,
    required String sexString,
  }) async {
    try {
      _userProfile = {
        'date_of_birth_string': dateOfBirthString,
        'height_cm_int': heightCmInt,
        'weight_kg_float': weightKgFloat,
        'bmi_float': bmiFloat,
        'sex_string': sexString,
        'last_updated': DateTime.now().toIso8601String(),
      };

      await storage.saveString(_userProfileKey, jsonEncode(_userProfile));
      notifyListeners();
    } catch (e) {
      debugPrint('Error saving user profile: $e');
      rethrow;
    }
  }

  Future<void> saveConfig(RookConfig newConfig) async {
    _config = newConfig.copyWith(updatedAt: DateTime.now());
    await storage.saveString(_storageKey, jsonEncode(_config.toJson()));
    notifyListeners();
  }

  Future<void> resetConfig() async {
    _config = RookConfig.initial();
    await storage.remove(_storageKey);
    await storage.remove(_connectedWearablesKey);
    await storage.remove(_healthDataCacheKey);
    await storage.remove(_lastSyncKey);
    await storage.remove(_userProfileKey);
    _connectedWearables.clear();
    _healthDataCache.clear();
    _userProfile = null;
    _registeredUserId = null;
    stopRealtimeUpdates();
    notifyListeners();
  }

  Future<void> _cacheConnectedWearables() async {
    try {
      await storage.saveString(
        _connectedWearablesKey,
        jsonEncode(_connectedWearables.toList()),
      );
    } catch (e) {
      debugPrint('Error caching wearables: $e');
    }
  }

  Future<void> _cacheHealthData() async {
    try {
      if (_healthDataCache.length > 30) {
        final keys = _healthDataCache.keys.toList()..sort();
        for (int i = 0; i < keys.length - 30; i++) {
          _healthDataCache.remove(keys[i]);
        }
      }
      await storage.saveString(
        _healthDataCacheKey,
        jsonEncode(_healthDataCache),
      );
    } catch (e) {
      debugPrint('Error caching health data: $e');
    }
  }

  String _buildCacheKey(String type, String userId, String date) {
    return '${type}_${userId}_$date';
  }

  bool hasCachedDataForDate(String userId, String datetime) {
    return _healthDataCache.containsKey('${userId}_$datetime');
  }

  Map<String, dynamic>? getCachedDataForDate(String userId, String datetime) {
    final cacheKey = '${userId}_$datetime';
    if (_healthDataCache.containsKey(cacheKey)) {
      return Map<String, dynamic>.from(_healthDataCache[cacheKey]);
    }
    return null;
  }

  Future<void> clearCacheForDate(String userId, String datetime) async {
    try {
      _healthDataCache.removeWhere(
        (key, value) => key.contains(userId) && key.contains(datetime),
      );
      await _cacheHealthData();
      debugPrint('Cleared cache for $userId on $datetime');
    } catch (e) {
      debugPrint('Error clearing cache: $e');
    }
  }

  Future<void> clearAllCache() async {
    try {
      _healthDataCache.clear();
      await storage.remove(_healthDataCacheKey);
      await storage.remove(_lastSyncKey);
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing all cache: $e');
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String getTodayDateString() => _formatDate(DateTime.now());

  String getYesterdayDateString() =>
      _formatDate(DateTime.now().subtract(const Duration(days: 1)));

  bool hasCompleteProfile() {
    return _userProfile != null &&
        _userProfile!.containsKey('date_of_birth_string') &&
        _userProfile!.containsKey('height_cm_int') &&
        _userProfile!.containsKey('weight_kg_float') &&
        _userProfile!.containsKey('bmi_float') &&
        _userProfile!.containsKey('sex_string');
  }

  List<String> getMissingProfileFields() {
    if (_userProfile == null) {
      return [
        'date_of_birth_string',
        'height_cm_int',
        'weight_kg_float',
        'bmi_float',
        'sex_string',
      ];
    }
    return [
      if (!_userProfile!.containsKey('date_of_birth_string'))
        'date_of_birth_string',
      if (!_userProfile!.containsKey('height_cm_int')) 'height_cm_int',
      if (!_userProfile!.containsKey('weight_kg_float')) 'weight_kg_float',
      if (!_userProfile!.containsKey('bmi_float')) 'bmi_float',
      if (!_userProfile!.containsKey('sex_string')) 'sex_string',
    ];
  }

  String? _mapProviderKeyToDataSourceName(String providerKey) {
    switch (providerKey.toLowerCase()) {
      case 'fitbit':
        return 'Fitbit';
      case 'oura':
        return 'Oura';
      case 'polar':
        return 'Polar';
      case 'whoop':
        return 'Whoop';
      case 'withings':
        return 'Withings';
      case 'garmin':
        return 'Garmin';
      case 'dexcom':
        return 'Dexcom';
      default:
        return null;
    }
  }

  String? _mapDataSourceNameToProviderKey(String dataSourceName) {
    switch (dataSourceName.toLowerCase()) {
      case 'fitbit':
        return 'fitbit';
      case 'oura':
        return 'oura';
      case 'polar':
        return 'polar';
      case 'whoop':
        return 'whoop';
      case 'withings':
        return 'withings';
      case 'garmin':
        return 'garmin';
      case 'dexcom':
        return 'dexcom';
      default:
        return dataSourceName.toLowerCase();
    }
  }

  Map<String, dynamic> _safeCastToMap(dynamic value) {
    if (value == null) return {};
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      try {
        final Map<String, dynamic> result = {};
        value.forEach((key, val) {
          final stringKey = key.toString();
          if (val is Map) {
            result[stringKey] = _safeCastToMap(val);
          } else if (val is List) {
            result[stringKey] = val
                .map((e) => e is Map ? _safeCastToMap(e) : e)
                .toList();
          } else {
            result[stringKey] = val;
          }
        });
        return result;
      } catch (e) {
        debugPrint('[RookService] Error casting map: $e');
        return {};
      }
    }
    return {};
  }

  @override
  void dispose() {
    stopRealtimeUpdates();
    _webhookDataReadyController.close();
    _webhookDeviceConnectedController.close();
    _webhookDeviceDisconnectedController.close();
    _webhookUserRegisteredController.close();
    _authorizationCompleteController.close();
    super.dispose();
  }
}
