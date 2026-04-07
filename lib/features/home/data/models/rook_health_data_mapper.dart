import 'package:flutter/foundation.dart';

class RookHealthDataMapper {
  /// Extract steps from physical health API response
  static int extractSteps(Map<String, dynamic>? data) {
    try {
      final steps = data?['physical_health']?['summary']?['physical_summary']?['distance']?['steps_int'] as int?;
      return steps ?? 0;
    } catch (e) {
      debugPrint('[RookHealthDataMapper] Error extracting steps: $e');
      return 0;
    }
  }

  /// Extract weight from body health API response
  static double extractWeight(Map<String, dynamic>? data) {
    try {
      final weight = data?['body_health']?['summary']?['body_summary']?['body_metrics']?['weight_kg_float'] as num?;
      return weight?.toDouble() ?? 0;
    } catch (e) {
      debugPrint('[RookHealthDataMapper] Error extracting weight: $e');
      return 0;
    }
  }

  /// Extract height from body health API response
  static int extractHeight(Map<String, dynamic>? data) {
    try {
      final height = data?['body_health']?['summary']?['body_summary']?['body_metrics']?['height_cm_int'] as int?;
      return height ?? 0;
    } catch (e) {
      debugPrint('[RookHealthDataMapper] Error extracting height: $e');
      return 0;
    }
  }

  /// Extract BMI from body health API response
  static double extractBMI(Map<String, dynamic>? data) {
    try {
      final bmi = data?['body_health']?['summary']?['body_summary']?['body_metrics']?['bmi_float'] as num?;
      return bmi?.toDouble() ?? 0;
    } catch (e) {
      debugPrint('[RookHealthDataMapper] Error extracting BMI: $e');
      return 0;
    }
  }

  /// Extract average heart rate from body health API response
  static double extractHeartRate(Map<String, dynamic>? data) {
    try {
      final hrAvg = data?['body_health']?['summary']?['body_summary']?['heart_rate']?['hr_avg_bpm_int'] as num?;
      return hrAvg?.toDouble() ?? 0;
    } catch (e) {
      debugPrint('[RookHealthDataMapper] Error extracting heart rate: $e');
      return 0;
    }
  }

  /// Check if API response has valid data
  static bool hasValidData(Map<String, dynamic>? data) {
    if (data == null) return false;
    try {
      return data['success'] == true && data['data'] != null;
    } catch (e) {
      return false;
    }
  }

  /// Get human-readable error message from API response
  static String getErrorMessage(Map<String, dynamic>? data) {
    try {
      return data?['message'] ?? 'Unknown error occurred';
    } catch (e) {
      return 'Failed to parse error message';
    }
  }
}
