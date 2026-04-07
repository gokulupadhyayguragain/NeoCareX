import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WearableMetric {
  final String type;
  final double value;
  final String unit;
  final int timestamp;
  final String source;

  WearableMetric({
    required this.type,
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.source,
  });

  factory WearableMetric.fromJson(Map<String, dynamic> json) {
    return WearableMetric(
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: json['timestamp'] as int,
      source: json['source'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'unit': unit,
        'timestamp': timestamp,
        'source': source,
      };

  @override
  String toString() =>
      'WearableMetric(type: $type, value: $value$unit, timestamp: $timestamp)';
}

class DailySummary {
  final String date;
  final List<WearableMetric> metrics;
  final int syncTimestamp;

  DailySummary({
    required this.date,
    required this.metrics,
    required this.syncTimestamp,
  });

  factory DailySummary.fromJson(Map<String, dynamic> json) {
    return DailySummary(
      date: json['date'] as String,
      metrics: (json['metrics'] as List<dynamic>)
          .map((m) => WearableMetric.fromJson(m as Map<String, dynamic>))
          .toList(),
      syncTimestamp: json['sync_timestamp'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'metrics': metrics.map((m) => m.toJson()).toList(),
        'sync_timestamp': syncTimestamp,
      };
}

class SyncResponse {
  final bool success;
  final List<DailySummary>? data;
  final String? error;
  final String? message;

  SyncResponse({
    required this.success,
    this.data,
    this.error,
    this.message,
  });

  factory SyncResponse.fromJson(Map<String, dynamic> json) {
    return SyncResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>?)
          ?.map((d) => DailySummary.fromJson(d as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((d) => d.toJson()).toList(),
        'error': error,
        'message': message,
      };
}

class NativeWearablesService {
  static const platform = MethodChannel('com.example.patient_app/wearables');

  static Future<bool> checkHealthConnectPermissions() async {
    try {
      final result = await platform.invokeMethod<bool>(
        'checkHealthConnectPermissions',
      );
      return result ?? false;
    } catch (e) {
      debugPrint('Error checking permissions: $e');
      return false;
    }
  }

  static Future<String> requestHealthConnectPermissions() async {
    try {
      final result = await platform.invokeMethod<String>(
        'requestHealthConnectPermissions',
      );
      return result ?? 'Permission request initiated';
    } catch (e) {
      debugPrint('Error requesting permissions: $e');
      return 'Error: $e';
    }
  }

  static Future<bool> isSamsungHealthAvailable() async {
    try {
      final result = await platform.invokeMethod<bool>(
        'isSamsungHealthAvailable',
      );
      debugPrint('[NativeWearables] Samsung Health available: $result');
      return result ?? false;
    } catch (e) {
      debugPrint(
          '[NativeWearables] Error checking Samsung Health availability: $e');
      return false;
    }
  }

  static Future<bool> requestAppleHealthAccess() async {
    try {
      final result = await platform.invokeMethod<Map>(
        'requestHealthKitAccess',
      );
      final success = (result?['success'] as bool?) ?? false;
      return success;
    } catch (e) {
      return false;
    }
  }

  static Future<SyncResponse> syncWearableData({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final dateFormatter = DateFormat('yyyy-MM-dd');
      final startStr = dateFormatter.format(startDate);
      final endStr = dateFormatter.format(endDate);

      final String result = await platform.invokeMethod(
        'syncWearableData',
        {
          'start_date': startStr,
          'end_date': endStr,
        },
      );

      final Map<String, dynamic> decoded = jsonDecode(result);
      return SyncResponse.fromJson(decoded);
    } on PlatformException catch (e) {
      return SyncResponse(
        success: false,
        error: e.message ?? 'Unknown error',
        message: 'Failed to sync wearable data',
      );
    } catch (e) {
      return SyncResponse(
        success: false,
        error: e.toString(),
        message: 'Failed to sync wearable data',
      );
    }
  }

  static Future<bool> requestHealthKitAccess() async {
    try {
      final Map<dynamic, dynamic> result = await platform.invokeMethod(
        'requestHealthKitAccess',
      );

      return (result['success'] as bool?) ?? false;
    } on PlatformException {
      return false;
    } catch (e) {
      return false;
    }
  }

  static List<WearableMetric> getHeartRateMetrics(
      List<DailySummary> dailySummaries) {
    final metrics = <WearableMetric>[];
    for (final summary in dailySummaries) {
      metrics.addAll(
        summary.metrics.where((m) => m.type == 'heart_rate'),
      );
    }
    return metrics;
  }

  static List<WearableMetric> getStepsMetrics(
      List<DailySummary> dailySummaries) {
    final metrics = <WearableMetric>[];
    for (final summary in dailySummaries) {
      metrics.addAll(
        summary.metrics.where((m) => m.type == 'steps'),
      );
    }
    return metrics;
  }

  static List<WearableMetric> getSleepMetrics(
      List<DailySummary> dailySummaries) {
    final metrics = <WearableMetric>[];
    for (final summary in dailySummaries) {
      metrics.addAll(
        summary.metrics.where((m) => m.type == 'sleep'),
      );
    }
    return metrics;
  }

  static double getAverageHeartRate(List<WearableMetric> heartRateMetrics) {
    if (heartRateMetrics.isEmpty) return 0;
    final total = heartRateMetrics.fold<double>(0, (sum, m) => sum + m.value);
    return total / heartRateMetrics.length;
  }

  static int getTotalSteps(List<WearableMetric> stepsMetrics) {
    return stepsMetrics.fold<int>(0, (sum, m) => sum + m.value.toInt());
  }

  static int getTotalSleep(List<WearableMetric> sleepMetrics) {
    return sleepMetrics.fold<int>(0, (sum, m) => sum + m.value.toInt());
  }

  static List<WearableMetric> getMetricsByType(
    List<DailySummary> dailySummaries,
    String type,
  ) {
    final metrics = <WearableMetric>[];
    for (final summary in dailySummaries) {
      metrics.addAll(
        summary.metrics.where((m) => m.type == type),
      );
    }
    return metrics;
  }

  static Future<SyncResponse> syncLastNDays(int days) async {
    final endDate = DateTime.now();
    final startDate = endDate.subtract(Duration(days: days));
    return syncWearableData(startDate: startDate, endDate: endDate);
  }

  static Future<SyncResponse> syncToday() async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    return syncWearableData(startDate: startDate, endDate: now);
  }

  static Future<SyncResponse> syncThisWeek() async {
    return syncLastNDays(7);
  }

  static Future<SyncResponse> syncThisMonth() async {
    return syncLastNDays(30);
  }
}
