import 'dart:async';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import 'package:rook_sdk_apple_health/rook_sdk_apple_health.dart';
import 'package:rook_sdk_core/rook_sdk_core.dart';

class RookAppleHealthService extends ChangeNotifier {
  static final RookAppleHealthService _instance =
      RookAppleHealthService._internal();
  factory RookAppleHealthService() => _instance;
  RookAppleHealthService._internal();

  bool _isInitialized = false;
  bool _isConfigurationSet = false;
  String? _currentUserId;
  bool _permissionsGranted = false;

  StreamSubscription<Exception>? _backgroundErrorsSubscription;

  bool get isInitialized => _isInitialized;
  bool get isConfigurationSet => _isConfigurationSet;
  String? get currentUserId => _currentUserId;
  bool get permissionsGranted => _permissionsGranted;

  Future<bool> initialize({
    required String clientUUID,
    required String secretKey,
    required RookEnvironment environment,
    required bool enableBackgroundSync,
    bool enableLogs = kDebugMode,
  }) async {
    try {
      if (enableLogs) {
        AHRookConfigurationManager.enableNativeLogs();
      }

      final config = RookConfiguration(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableBackgroundSync: enableBackgroundSync,
      );

      await AHRookConfigurationManager.setConfiguration(config);
      _isConfigurationSet = true;

      await AHRookConfigurationManager.initRook();
      _isInitialized = true;

      _setupBackgroundErrorListener();

      return true;
    } catch (e) {
      _isInitialized = false;
      return false;
    }
  }

  void _setupBackgroundErrorListener() {
    _backgroundErrorsSubscription = AHRookHelpers.backgroundErrorsUpdates
        .listen((error) {
          debugPrint('[RookAppleHealth] Background sync error: $error');
        });
  }

  Future<bool> updateUserID(String userId) async {
    try {
      if (!_isConfigurationSet) {
        throw Exception('SDK configuration not set. Call initialize first.');
      }

      await AHRookConfigurationManager.updateUserID(userId);
      _currentUserId = userId;

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getUserID() async {
    try {
      return await AHRookConfigurationManager.getUserID();
    } catch (e) {
      return null;
    }
  }

  Future<bool> clearUserID() async {
    try {
      await AHRookConfigurationManager.clearUserID();
      _currentUserId = null;
      debugPrint('[RookAppleHealth] ✓ User ID cleared');
      return true;
    } catch (e) {
      debugPrint('[RookAppleHealth] Failed to clear user ID: $e');
      return false;
    }
  }

  /*  Future<bool> deleteUserFromRook() async {
    try {
      if (_currentUserId == null) {
        debugPrint('[RookAppleHealth] No current user ID to delete');
        return false;
      }

      await AHRookConfigurationManager.deleteUserFromRook(_currentUserId!);
      _currentUserId = null;
      return true;
    } catch (e) {
      return false;
    }
  } */

  Future<bool> requestPermissions({
    List<AppleHealthPermission>? permissions,
  }) async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      List<AppleHealthPermission> permissionsToRequest =
          permissions ??
          [
            AppleHealthPermission.sleepAnalysis,
            AppleHealthPermission.stepCount,
            AppleHealthPermission.heartRate,
            AppleHealthPermission.heartRateVariabilitySDNN,
            AppleHealthPermission.activeEnergyBurned,
            AppleHealthPermission.basalEnergyBurned,
            AppleHealthPermission.bodyMass,
            AppleHealthPermission.height,
            AppleHealthPermission.workout,
            AppleHealthPermission.distanceWalkingRunning,
          ];

      for (var permission in permissionsToRequest) {
        debugPrint('[RookAppleHealth]   • ${permission.toString()}');
      }

      await AHRookHealthPermissionsManager.requestPermissions(
        permissionsToRequest,
      );

      _permissionsGranted = true;
      return true;
    } catch (e) {
      _permissionsGranted = false;
      return false;
    }
  }

  Future<bool> checkHealthDataAvailability() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      try {
        await AHRookSyncManager.sync(enableLogs: kDebugMode);
        return true;
      } catch (e) {
        final errorMsg = e.toString();

        if (errorMsg.contains('sleep data') ||
            errorMsg.contains('denied all permissions')) {
          return false;
        } else {
          debugPrint('[RookAppleHealth] ✗ Unexpected sync error: $e');
          return false;
        }
      }
    } catch (e) {
      debugPrint('[RookAppleHealth] Error checking health data: $e');
      return false;
    }
  }

  Future<DailyCalories?> getTodayCaloriesCount() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      final calories = await AHRookSyncManager.getTodayCaloriesCount();

      if (calories != null) {
      } else {
        debugPrint('[RookAppleHealth] ⚠️ No calories data available for today');
      }

      return calories;
    } catch (e) {
      return null;
    }
  }

  Future<bool> enableBackgroundSync({
    required String clientUUID,
    required String secretKey,
    required RookEnvironment environment,
    bool enableNativeLogs = kDebugMode,
  }) async {
    try {
      await AHRookBackgroundSync.enableBackground(
        enableNativeLogs: enableNativeLogs,
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> disableBackgroundSync() async {
    try {
      await AHRookBackgroundSync.disableBackground();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> enableContinuousUpload({
    required String clientUUID,
    required String secretKey,
    required RookEnvironment environment,
    bool enableNativeLogs = kDebugMode,
  }) async {
    try {
      await AHRookContinuousUpload.enableContinuousUpload(
        enableNativeLogs: enableNativeLogs,
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> disableContinuousUpload() async {
    try {
      await AHRookContinuousUpload.disableContinuousUpload();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isContinuousUploadEnabled() async {
    try {
      return await AHRookContinuousUpload.isContinuousUploadEnabled();
    } catch (e) {
      debugPrint(
        '[RookAppleHealth] Failed to check continuous upload status: $e',
      );
      return false;
    }
  }

  Future<bool> syncHealthDataForDate(DateTime date) async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      final dateStr = date.toString().split(' ')[0];
      debugPrint('[RookAppleHealth] 🔄 Syncing health data for $dateStr...');

      try {
        await AHRookSyncManager.sync(date: date, enableLogs: kDebugMode);

        return true;
      } catch (e) {
        final errorMsg = e.toString();

        if (errorMsg.contains('sleep data') ||
            errorMsg.contains('denied all permissions')) {
          return false;
        } else {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> performFullSync() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      bool hasAnyData = false;
      final today = DateTime.now();

      for (int i = 0; i < 30; i++) {
        final date = today.subtract(Duration(days: i));
        try {
          await AHRookSyncManager.sync(date: date, enableLogs: kDebugMode);
          hasAnyData = true;
          debugPrint(
            '[RookAppleHealth] ✓ Day ${date.toString().split(' ')[0]} sent to Rook',
          );
        } catch (e) {
          return false;
        }
      }

      if (hasAnyData) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, bool>> checkAvailableHealthData() async {
    final availability = <String, bool>{};

    try {
      try {
        final steps = await AHRookSyncManager.getTodayStepsCount();
        availability['steps'] = steps != null && steps > 0;
      } catch (e) {
        availability['steps'] = false;
      }

      try {
        final calories = await AHRookSyncManager.getTodayCaloriesCount();
        availability['calories'] = calories != null;
      } catch (e) {
        availability['calories'] = false;
      }

      return availability;
    } catch (e) {
      return availability;
    }
  }

  Future<bool> syncUserTimeZone() async {
    try {
      await AHRookConfigurationManager.syncUserTimeZone();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setupAndSync({
    required String clientUUID,
    required String secretKey,
    required String userId,
    required RookEnvironment environment,
    bool enableLogs = kDebugMode,
  }) async {
    try {
      if (!_isInitialized) {
        final initialized = await initialize(
          clientUUID: clientUUID,
          secretKey: secretKey,
          environment: environment,
          enableBackgroundSync: true,
          enableLogs: enableLogs,
        );
        if (!initialized) {
          throw Exception('Failed to initialize SDK');
        }
      }

      final existingUserId = await getUserID();
      if (existingUserId != userId) {
        final updated = await updateUserID(userId);
        if (!updated) {
          throw Exception('Failed to set user ID');
        }
      }

      await syncUserTimeZone();

      await requestPermissions();

      await enableContinuousUpload(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableNativeLogs: enableLogs,
      );

      await enableBackgroundSync(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableNativeLogs: enableLogs,
      );
      return true;
    } catch (e) {
      debugPrint('[RookAppleHealth] ❌ Setup failed: $e');
      return false;
    }
  }

  bool isAppleHealthAvailable() {
    return !kIsWeb && Platform.isIOS;
  }

  @override
  void dispose() {
    _backgroundErrorsSubscription?.cancel();
    super.dispose();
  }
}
