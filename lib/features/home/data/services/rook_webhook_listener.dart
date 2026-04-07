import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RookWebhookEvent {
  final String id;
  final String userId;
  final String eventType;
  final String? dataType;
  final String? date;
  final String? deviceType;
  final DateTime timestamp;

  RookWebhookEvent({
    required this.id,
    required this.userId,
    required this.eventType,
    this.dataType,
    this.date,
    this.deviceType,
    required this.timestamp,
  });

  factory RookWebhookEvent.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RookWebhookEvent(
      id: doc.id,
      userId: data['userId'] ?? '',
      eventType: data['event_type'] ?? '',
      dataType: data['dataType'],
      date: data['date'],
      deviceType: data['deviceType'],
      timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class RookWebhookListener extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _webhookEventController = StreamController<RookWebhookEvent>.broadcast();
  final _dataReadyController = StreamController<RookWebhookEvent>.broadcast();
  final _deviceConnectedController = StreamController<RookWebhookEvent>.broadcast();
  final _deviceDisconnectedController = StreamController<RookWebhookEvent>.broadcast();
  final _userRegisteredController = StreamController<RookWebhookEvent>.broadcast();
  final _rawWebhookController = StreamController<Map<String, dynamic>>.broadcast();

  StreamSubscription<QuerySnapshot>? _webhookSubscription;
  StreamSubscription<QuerySnapshot>? _rawWebhookSubscription;
  
  DateTime? _lastWebhookReceived;

  Stream<RookWebhookEvent> get onWebhookEvent => _webhookEventController.stream;
  Stream<RookWebhookEvent> get onDataReady => _dataReadyController.stream;
  Stream<RookWebhookEvent> get onDeviceConnected => _deviceConnectedController.stream;
  Stream<RookWebhookEvent> get onDeviceDisconnected => _deviceDisconnectedController.stream;
  Stream<RookWebhookEvent> get onUserRegistered => _userRegisteredController.stream;
  
  /// Raw webhook events as received from Firebase (before processing)
  Stream<Map<String, dynamic>> get onRawWebhook => _rawWebhookController.stream;
  
  /// Get timestamp of last webhook received
  DateTime? get lastWebhookReceived => _lastWebhookReceived;

  void startListening(String userId) {
    debugPrint('[RookWebhookListener] Starting to listen for events for user: $userId');

    _webhookSubscription?.cancel();
    _rawWebhookSubscription?.cancel();

    // Listen to processed webhook events
    _webhookSubscription = _firestore
        .collection('rook_webhooks')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .limit(100)
        .snapshots()
        .listen(
          (snapshot) {
            debugPrint('[RookWebhookListener] Received ${snapshot.docs.length} webhook events');

            for (final doc in snapshot.docChanges) {
              if (doc.type == DocumentChangeType.added) {
                final event = RookWebhookEvent.fromFirestore(doc.doc);
                debugPrint('[RookWebhookListener] New event: ${event.eventType} at ${event.timestamp}');

                _lastWebhookReceived = event.timestamp;
                _webhookEventController.add(event);

                switch (event.eventType) {
                  case 'data_ready':
                    debugPrint('[RookWebhookListener] ✅ Data ready: ${event.dataType} on ${event.date}');
                    _dataReadyController.add(event);
                    break;

                  case 'device_connected':
                    debugPrint('[RookWebhookListener] ✅ Device connected: ${event.deviceType}');
                    _deviceConnectedController.add(event);
                    break;

                  case 'device_disconnected':
                    debugPrint('[RookWebhookListener] ✅ Device disconnected: ${event.deviceType}');
                    _deviceDisconnectedController.add(event);
                    break;

                  case 'user_registered':
                    debugPrint('[RookWebhookListener] ✅ User registered: ${event.userId}');
                    _userRegisteredController.add(event);
                    break;

                  default:
                    debugPrint('[RookWebhookListener] ⚠️ Unknown event type: ${event.eventType}');
                }
              }
            }
          },
          onError: (error) {
            debugPrint('[RookWebhookListener] Error listening to webhooks: $error');
          },
        );
    
    // Also listen to raw webhooks for debugging and full data access
    _rawWebhookSubscription = _firestore
        .collection('rook_webhooks_raw')
        .orderBy('receivedAt', descending: true)
        .limit(50)
        .snapshots()
        .listen(
          (snapshot) {
            for (final doc in snapshot.docChanges) {
              if (doc.type == DocumentChangeType.added) {
                final data = doc.doc.data() as Map<String, dynamic>;
                final webhookUserId = data['user_id'] as String?;
                
                // Only emit if it's for our user or if we don't have filtering
                if (webhookUserId == null || webhookUserId == userId) {
                  debugPrint('[RookWebhookListener] Raw webhook received: ${data['event_type']}');
                  _rawWebhookController.add(data);
                  _lastWebhookReceived = DateTime.now();
                }
              }
            }
          },
          onError: (error) {
            debugPrint('[RookWebhookListener] Error listening to raw webhooks: $error');
          },
        );

    notifyListeners();
  }

  void stopListening() {
    debugPrint('[RookWebhookListener] Stopping webhook listeners');
    _webhookSubscription?.cancel();
    _webhookSubscription = null;
    _rawWebhookSubscription?.cancel();
    _rawWebhookSubscription = null;
    notifyListeners();
  }
  
  /// Check if data for a specific date and type is ready
  Future<bool> isDataReady({
    required String userId,
    required String dataType,
    required String date,
  }) async {
    try {
      final snapshot = await _firestore
          .collection('rook_webhooks')
          .where('userId', isEqualTo: userId)
          .where('event_type', isEqualTo: 'data_ready')
          .where('dataType', isEqualTo: dataType)
          .where('date', isEqualTo: date)
          .limit(1)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      debugPrint('[RookWebhookListener] Error checking data ready: $e');
      return false;
    }
  }
  
  /// Get time elapsed since last webhook was received
  Duration? getTimeSinceLastWebhook() {
    if (_lastWebhookReceived == null) return null;
    return DateTime.now().difference(_lastWebhookReceived!);
  }
  
  /// Check if webhook was received recently (within timeframe)
  bool isWebhookRecent({Duration threshold = const Duration(minutes: 5)}) {
    if (_lastWebhookReceived == null) return false;
    return DateTime.now().difference(_lastWebhookReceived!) < threshold;
  }

  Future<List<RookWebhookEvent>> getRecentEvents(
    String userId, {
    int limit = 50,
  }) async {
    try {

      final snapshot = await _firestore
          .collection('rook_webhooks')
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .limit(limit)
          .get();

      final events = snapshot.docs
          .map((doc) => RookWebhookEvent.fromFirestore(doc))
          .toList();

      return events;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RookWebhookEvent>> getRecentDataReadyEvents(
    String userId, {
    int limit = 10,
  }) async {
    try {

      final snapshot = await _firestore
          .collection('rook_webhooks')
          .where('userId', isEqualTo: userId)
          .where('event_type', isEqualTo: 'data_ready')
          .orderBy('timestamp', descending: true)
          .limit(limit)
          .get();

      final events = snapshot.docs
          .map((doc) => RookWebhookEvent.fromFirestore(doc))
          .toList();

      debugPrint('[RookWebhookListener] Retrieved ${events.length} data_ready events');
      return events;
    } catch (e) {
      debugPrint('[RookWebhookListener] Error fetching data_ready events: $e');
      rethrow;
    }
  }

  Future<bool> hasRecentDataSync(String userId) async {
    try {
      final oneDayAgo = DateTime.now().subtract(Duration(days: 1));
      final snapshot = await _firestore
          .collection('rook_webhooks')
          .where('userId', isEqualTo: userId)
          .where('event_type', isEqualTo: 'data_ready')
          .where('timestamp', isGreaterThan: Timestamp.fromDate(oneDayAgo))
          .limit(1)
          .get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      debugPrint('[RookWebhookListener] Error checking recent sync: $e');
      return false;
    }
  }

  @override
  void dispose() {
    debugPrint('[RookWebhookListener] Disposing webhook listener');
    _webhookSubscription?.cancel();
    _rawWebhookSubscription?.cancel();
    _webhookEventController.close();
    _dataReadyController.close();
    _deviceConnectedController.close();
    _deviceDisconnectedController.close();
    _userRegisteredController.close();
    _rawWebhookController.close();
    super.dispose();
  }
}
