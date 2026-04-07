/* import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Service to listen to Rook webhook events from Firebase
/// 
/// The Firebase Cloud Function at exports.rookWebhook handles incoming webhooks
/// and stores them in Firestore. This service monitors those collections and
/// emits events for the RookService to process.
class RookWebhookListenerService {
  static const String _webhooksCollection = 'rook_webhooks';
  static const String _webhooksRawCollection = 'rook_webhooks_raw';

  final FirebaseFirestore _firestore;
  late StreamSubscription _webhookSubscription;
  
  final _webhookEventController =
      StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get onWebhookEvent =>
      _webhookEventController.stream;

  RookWebhookListenerService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Start listening to webhook events from Firestore
  void startListening() {
    debugPrint('[RookWebhookListener] Starting webhook listener');
    
    // Listen to raw webhooks collection for all incoming events
    _webhookSubscription = _firestore
        .collection(_webhooksRawCollection)
        .orderBy('receivedAt', descending: true)
        .limit(10)
        .snapshots()
        .listen(
          (snapshot) => _processWebhookSnapshot(snapshot),
          onError: (error) {
            debugPrint('[RookWebhookListener] Error listening to webhooks: $error');
          },
        );
  }

  /// Process incoming webhook events from Firestore
  void _processWebhookSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    for (var doc in snapshot.docChanges) {
      if (doc.type == DocumentChangeType.added) {
        final data = doc.doc.data();
        if (data != null) {
          final eventType = data['event_type'] as String?;
          final userId = data['user_id'] as String?;
          
          debugPrint('[RookWebhookListener] New webhook event: $eventType for user: $userId');
          
          // Emit the webhook event
          _webhookEventController.add(data);
          
          // Log the event for debugging
          _logWebhookEvent(eventType, userId, data);
        }
      }
    }
  }

  /// Log webhook event details
  void _logWebhookEvent(String? eventType, String? userId, Map<String, dynamic> data) {
    switch (eventType) {
      case 'data_ready':
        final dataType = data['data_type'] as String?;
        final date = data['date'] as String?;
        debugPrint('[RookWebhookListener] ✅ Data ready: $dataType for $date');
        break;
      
      case 'device_connected':
        final deviceType = data['device_type'] as String?;
        debugPrint('[RookWebhookListener] ✅ Device connected: $deviceType');
        break;
      
      case 'device_disconnected':
        final deviceType = data['device_type'] as String?;
        debugPrint('[RookWebhookListener] ✅ Device disconnected: $deviceType');
        break;
      
      case 'user_registered':
        debugPrint('[RookWebhookListener] ✅ User registered: $userId');
        break;
      
      default:
        debugPrint('[RookWebhookListener] ⚠️ Unknown event type: $eventType');
    }
  }

  /// Check if there are pending webhooks for a specific user and data type
  Future<bool> hasPendingWebhook({
    required String userId,
    required String dataType,
  }) async {
    try {
      final query = await _firestore
          .collection(_webhooksCollection)
          .where('userId', isEqualTo: userId)
          .where('dataType', isEqualTo: dataType)
          .where('event_type', isEqualTo: 'data_ready')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();
      
      return query.docs.isNotEmpty;
    } catch (e) {
      debugPrint('[RookWebhookListener] Error checking pending webhooks: $e');
      return false;
    }
  }

  /// Get the latest webhook event for a user
  Future<Map<String, dynamic>?> getLatestWebhookEvent(String userId) async {
    try {
      final query = await _firestore
          .collection(_webhooksRawCollection)
          .where('user_id', isEqualTo: userId)
          .orderBy('receivedAt', descending: true)
          .limit(1)
          .get();
      
      if (query.docs.isNotEmpty) {
        return query.docs.first.data();
      }
      return null;
    } catch (e) {
      debugPrint('[RookWebhookListener] Error getting latest webhook: $e');
      return null;
    }
  }

  /// Get webhook events for a specific date range
  Future<List<Map<String, dynamic>>> getWebhookEventsForDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final query = await _firestore
          .collection(_webhooksRawCollection)
          .where('user_id', isEqualTo: userId)
          .where('receivedAt', isGreaterThanOrEqualTo: startDate)
          .where('receivedAt', isLessThanOrEqualTo: endDate)
          .orderBy('receivedAt', descending: true)
          .get();
      
      return query.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('[RookWebhookListener] Error getting webhook events: $e');
      return [];
    }
  }

  /// Stop listening to webhook events
  void stopListening() {
    debugPrint('[RookWebhookListener] Stopping webhook listener');
    _webhookSubscription.cancel();
  }

  /// Dispose resources
  void dispose() {
    _webhookSubscription.cancel();
    _webhookEventController.close();
  }
}
 */