/* import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rook_sdk_health_connect/rook_sdk_health_connect.dart';
import 'package:rook_sdk_core/rook_sdk_core.dart';

class RookHealthConnectService extends ChangeNotifier {
  static final RookHealthConnectService _instance =
      RookHealthConnectService._internal();
  factory RookHealthConnectService() => _instance;
  RookHealthConnectService._internal();

  bool _isInitialized = false;
  bool _isConfigurationSet = false;
  String? _currentUserId;
  bool _permissionsGranted = false;
  bool _backgroundSyncScheduled = false;

  StreamSubscription<bool>? _backgroundSyncSubscription;

  bool get isInitialized => _isInitialized;
  bool get isConfigurationSet => _isConfigurationSet;
  String? get currentUserId => _currentUserId;
  bool get permissionsGranted => _permissionsGranted;
  bool get backgroundSyncScheduled => _backgroundSyncScheduled;

  Future<bool> initialize({
    required String clientUUID,
    required String secretKey,
    required RookEnvironment environment,
    bool enableLogs = kDebugMode,
  }) async {
    try {

      if (enableLogs) {
        try {
          await HCRookConfigurationManager.enableNativeLogs();
        } catch (e) {
          debugPrint(
            '[RookHealthConnect] ⚠ enableNativeLogs not available (this is normal): ${e.toString().substring(0, 80)}',
          );
        }
      }

      final config = RookConfiguration(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableBackgroundSync: true,
      );

      try {
        await HCRookConfigurationManager.setConfiguration(config);
        _isConfigurationSet = true;
        debugPrint('[RookHealthConnect] Configuration set successfully');
      } catch (e) {
        debugPrint(
          '[RookHealthConnect] ⚠ setConfiguration not available (this is normal): ${e.toString().substring(0, 80)}',
        );
        _isConfigurationSet = true;
      }

      try {
        await HCRookConfigurationManager.initRook();
        debugPrint('[RookHealthConnect] SDK initialized via initRook()');
      } catch (e) {
        debugPrint(
          '[RookHealthConnect] ⚠ initRook not available (SDK may initialize differently): ${e.toString().substring(0, 80)}',
        );
      }

      _isInitialized = true;
      debugPrint(
        '[RookHealthConnect] ✓ SDK initialization completed successfully',
      );
      return true;
    } catch (e) {
      debugPrint(
        '[RookHealthConnect] ✗ Unexpected error during initialization: $e',
      );
      _isInitialized = false;
      return false;
    }
  }

  Future<HCAvailabilityStatus> checkHealthConnectAvailability() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Checking Health Connect availability...');
      final status =
          await HCRookHealthPermissionsManager.checkHealthConnectAvailability();

      debugPrint('[RookHealthConnect] Availability status: $status');
      return status;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error checking availability: $e');
      rethrow;
    }
  }

  Future<bool> updateUserID(String userId) async {
    try {
      if (!_isConfigurationSet) {
        throw Exception('Configuration not set. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Updating user ID to: $userId');

      await HCRookConfigurationManager.updateUserID(userId);
      _currentUserId = userId;

      debugPrint('[RookHealthConnect] ✓ User ID updated successfully');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] ✗ Failed to update user ID: $e');
      return false;
    }
  }

  Future<String?> getUserID() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      final userId = await HCRookConfigurationManager.getUserID();
      _currentUserId = userId;

      debugPrint('[RookHealthConnect] Current user ID: $userId');
      return userId;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error getting user ID: $e');
      return null;
    }
  }

  Future<bool> clearUserID() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Clearing user ID...');

      await HCRookConfigurationManager.clearUserID();
      _currentUserId = null;

      debugPrint('[RookHealthConnect] ✓ User ID cleared successfully');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] ✗ Failed to clear user ID: $e');
      return false;
    }
  }

  Future<bool> deleteUserFromRook(String userId) async {
    try {
      if (!_isConfigurationSet) {
        throw Exception('Configuration not set. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Deleting user from Rook: $userId');

      await HCRookConfigurationManager.deleteUserFromRook();

      debugPrint('[RookHealthConnect] ✓ User deleted from Rook successfully');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] ✗ Failed to delete user: $e');
      return false;
    }
  }

  Future<bool> checkHealthConnectPermissions() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Checking Health Connect permissions...');

      final granted =
          await HCRookHealthPermissionsManager.checkHealthConnectPermissions();
      _permissionsGranted = granted;

      debugPrint(
        '[RookHealthConnect] Health Connect permissions granted: $granted',
      );
      return granted;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error checking permissions: $e');
      return false;
    }
  }

  Future<bool> checkAndroidPermissions() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Checking Android permissions...');

      final granted =
          await HCRookHealthPermissionsManager.checkAndroidPermissions();

      debugPrint('[RookHealthConnect] Android permissions granted: $granted');
      return granted;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error checking Android permissions: $e');
      return false;
    }
  }

  Future<bool> requestHealthConnectPermissions() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint(
        '[RookHealthConnect] Requesting Health Connect permissions...',
      );

      final status =
          await HCRookHealthPermissionsManager.requestHealthConnectPermissions();

      debugPrint('[RookHealthConnect] Permission request status: $status');

      final granted = await checkHealthConnectPermissions();
      _permissionsGranted = granted;

      return granted;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error requesting permissions: $e');
      return false;
    }
  }

  Future<bool> requestAndroidPermissions() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Requesting Android permissions...');

      final status =
          await HCRookHealthPermissionsManager.requestAndroidPermissions();

      debugPrint(
        '[RookHealthConnect] Android permission request status: $status',
      );

      final granted = await checkAndroidPermissions();

      return granted;
    } catch (e) {
      debugPrint(
        '[RookHealthConnect] Error requesting Android permissions: $e',
      );
      return false;
    }
  }

  Future<bool> checkHealthConnectPermissionsPartially() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint(
        '[RookHealthConnect] Checking partial Health Connect permissions...',
      );

      final granted =
          await HCRookHealthPermissionsManager.checkHealthConnectPermissionsPartially();

      debugPrint(
        '[RookHealthConnect] Partial Health Connect permissions granted: $granted',
      );
      return granted;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error checking partial permissions: $e');
      return false;
    }
  }

  Future<bool> revokeHealthConnectPermissions() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint(
        '[RookHealthConnect] Revoking all Health Connect permissions...',
      );

      await HCRookHealthPermissionsManager.revokeHealthConnectPermissions();
      _permissionsGranted = false;

      debugPrint('[RookHealthConnect] ✓ Health Connect permissions revoked');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error revoking permissions: $e');
      return false;
    }
  }

  Future<bool> syncUserTimeZone() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Syncing user timezone...');

      await HCRookConfigurationManager.syncUserTimeZone();

      debugPrint('[RookHealthConnect] ✓ User timezone synced');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error syncing timezone: $e');
      return false;
    }
  }

  Future<Object> checkBackgroundReadStatus() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Checking background read status...');

      final status =
          await HCRookHealthPermissionsManager.checkBackgroundReadStatus();

      debugPrint('[RookHealthConnect] Background read status: $status');
      return status;
    } catch (e) {
      debugPrint(
        '[RookHealthConnect] Error checking background read status: $e',
      );
      return false;
    }
  }

  Future<bool> syncHealthDataForDate(DateTime date) async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Syncing health data for date: $date');

      try {
        await HCRookSyncManager.sync(date: date, enableLogs: kDebugMode);
      } catch (e) {
        debugPrint('[RookHealthConnect] Retrying sync without enableLogs...');
        await HCRookSyncManager.sync(date: date);
      }

      debugPrint('[RookHealthConnect] ✓ Health data synced for date: $date');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error syncing health data: $e');
      return false;
    }
  }

  Future<bool> syncSummaryForDate(
    DateTime date,
    HCSummarySyncType summaryType,
  ) async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Syncing $summaryType for date: $date');

      try {
        await HCRookSyncManager.sync(
          date: date,
          summary: summaryType,
          enableLogs: kDebugMode,
        );
      } catch (e) {
        debugPrint('[RookHealthConnect] Retrying sync without enableLogs...');
        await HCRookSyncManager.sync(date: date, summary: summaryType);
      }

      debugPrint('[RookHealthConnect] ✓ $summaryType synced for date: $date');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error syncing summary: $e');
      return false;
    }
  }

  Future<bool> syncHistoricHealthData() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint('[RookHealthConnect] Syncing historic health data...');

      try {
        await HCRookSyncManager.sync(enableLogs: kDebugMode);
      } catch (e) {
        debugPrint('[RookHealthConnect] Retrying sync without enableLogs...');
        await HCRookSyncManager.sync();
      }

      debugPrint('[RookHealthConnect] ✓ Historic health data synced');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] Error syncing historic data: $e');
      return false;
    }
  }

  Future<Object> isBackgroundSyncScheduled() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }

      debugPrint(
        '[RookHealthConnect] Checking if background sync is scheduled...',
      );

      final isScheduled = await HCRookBackgroundSync.isScheduled;

      debugPrint('[RookHealthConnect] Background sync scheduled: $isScheduled');
      return isScheduled;
    } catch (e) {
      debugPrint(
        '[RookHealthConnect] Error checking background sync status: $e',
      );
      return false;
    }
  }

  Future<bool> cancelBackgroundSync() async {
    try {
      if (!_isInitialized) {
        throw Exception('SDK not initialized. Call initialize first.');
      }


      await HCRookBackgroundSync.disableBackground();
      _backgroundSyncScheduled = false;

      await _backgroundSyncSubscription?.cancel();
      _backgroundSyncSubscription = null;

      return true;
    } catch (e) {
      return false;
    }
  }

  void _setupBackgroundSyncListener() {
    _backgroundSyncSubscription?.cancel();

    _backgroundSyncSubscription = HCRookBackgroundSync.isScheduledUpdates.listen(
      (isScheduled) {
        _backgroundSyncScheduled = isScheduled;
      
        notifyListeners();
      },
      onError: (error) {
        debugPrint(
          '[RookHealthConnect] Background sync listener error: $error',
        );
      },
    );
  }

  Future<bool> setupAndSync({
    required String clientUUID,
    required String secretKey,
    required RookEnvironment environment,
    required String userId,
  }) async {
    try {

      final initialized = await initialize(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
      );

      if (!initialized) {
        throw Exception('Failed to initialize SDK');
      }

      final userUpdated = await updateUserID(userId);
      if (!userUpdated) {
        throw Exception('Failed to update user ID');
      }

      await syncUserTimeZone();

      final permissionsGranted = await requestHealthConnectPermissions();
      if (!permissionsGranted) {
        debugPrint(
          '[RookHealthConnect] ⚠ Health Connect permissions not granted',
        );
      }

      _setupBackgroundSyncListener();

      final bgSyncScheduled = await isBackgroundSyncScheduled();
      debugPrint(
        '[RookHealthConnect] Background sync scheduled: $bgSyncScheduled',
      );

      final synced = await syncHistoricHealthData();
      if (!synced) {
        debugPrint('[RookHealthConnect] ⚠ Failed to sync historic data');
      }

      debugPrint('[RookHealthConnect] ✓ Complete setup and sync finished');
      return true;
    } catch (e) {
      debugPrint('[RookHealthConnect] ✗ Setup and sync failed: $e');
      return false;
    }
  }

  @override
  void dispose() {
    _backgroundSyncSubscription?.cancel();
    super.dispose();
  }
}
 */