import 'package:intl/intl.dart';
import '../models/observations_model.dart';

class HealthDataProcessor {
  static const Map<String, String> deviceTypeMapping = {
    "381A100610E": 'blood_sugar',
    "100251303404": 'blood_pressure',
    "200242101321": 'body_weight',
    "pulse_device_id": 'pulse',
  };

  static String? getObservationType(String deviceId) {
    return deviceTypeMapping[deviceId];
  }

  static bool isValidObservation(Observation observation, String type) {
    switch (type) {
      case 'blood_sugar':
        final value = observation.value?.quantity?.value;
        return value != null && value >= 50 && value <= 500;
      
      case 'blood_pressure':
        if (observation.component != null && observation.component!.length >= 2) {
          final systolic = observation.component![0].value?.quantity?.value;
          final diastolic = observation.component![1].value?.quantity?.value;
          return systolic != null &&
              diastolic != null &&
              systolic >= 70 &&
              systolic <= 250 &&
              diastolic >= 40 &&
              diastolic <= 150 &&
              systolic > diastolic;
        }
        return false;
      
      case 'body_weight':
        final value = observation.value?.quantity?.value;
        return value != null && value >= 1 && value <= 1000;
      
      case 'pulse':
        final value = observation.value?.quantity?.value;
        return value != null && value >= 40 && value <= 200;
      
      default:
        return true;
    }
  }

  static Observation? getLatestValidObservation(
    List<Observation> observations,
    String type,
  ) {
    if (observations.isEmpty) return null;

    final sortedObservations = List<Observation>.from(observations);
    sortedObservations.sort((a, b) {
      final aEffective = a.effective?.dateTime;
      final bEffective = b.effective?.dateTime;
      
      if (aEffective == null && bEffective == null) return 0;
      if (aEffective == null) return 1;
      if (bEffective == null) return -1;
      
      try {
        final aDate = DateTime.parse(aEffective);
        final bDate = DateTime.parse(bEffective);
        return bDate.compareTo(aDate); 
      } catch (e) {
        return 0;
      }
    });

    for (var observation in sortedObservations) {
      if (isValidObservation(observation, type)) {
        return observation;
      }
    }

    return null;
  }

  static Map<String, Observation?> processObservations(
    Map<String, List<Observation>> deviceObservations,
  ) {
    final Map<String, Observation?> latestObservations = {
      'blood_sugar': null,
      'blood_pressure': null,
      'body_weight': null,
      'pulse': null,
    };

    for (String type in latestObservations.keys) {
      if (deviceObservations.containsKey(type)) {
        latestObservations[type] = getLatestValidObservation(
          deviceObservations[type]!,
          type,
        );
      }
    }

    return latestObservations;
  }

  static String getTypeLabel(String type) {
    switch (type) {
      case 'blood_sugar':
        return 'Blood Sugar';
      case 'blood_pressure':
        return 'Blood Pressure';
      case 'body_weight':
        return 'Body Weight';
      case 'pulse':
        return 'Pulse';
      default:
        return 'Health Data';
    }
  }

  static String formatDateTime(String? dateTimeStr) {
    if (dateTimeStr == null) return 'No date';

    try {
      final dateTime = DateTime.parse(dateTimeStr);
      final date = DateFormat('MMM dd, yyyy').format(dateTime);
      final time = DateFormat('h:mm a').format(dateTime);
      return '$date at $time';
    } catch (e) {
      return 'Invalid date';
    }
  }

  static String formatDate(String? dateTimeStr) {
    if (dateTimeStr == null) return 'No date';

    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  static String formatTime(String? dateTimeStr) {
    if (dateTimeStr == null) return 'No time';

    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('h:mm a').format(dateTime);
    } catch (e) {
      return 'Invalid time';
    }
  }

  static String formatObservationValue(Observation observation, String type) {
    switch (type) {
      case 'blood_sugar':
        final value = observation.value?.quantity?.value;
        return value != null ? '${value.round()} mg/dl' : '-- mg/dl';
      
      case 'blood_pressure':
        if (observation.component != null && observation.component!.length >= 2) {
          final systolic = observation.component![0].value?.quantity?.value?.round() ?? 0;
          final diastolic = observation.component![1].value?.quantity?.value?.round() ?? 0;
          return '$systolic/$diastolic mmHg';
        }
        return '--/-- mmHg';
      
      case 'body_weight':
        final value = observation.value?.quantity?.value;
        return value != null ? '${value.toStringAsFixed(1)} lbs' : '-- lbs';
      
      case 'pulse':
        final value = observation.value?.quantity?.value;
        return value != null ? '${value.round()} BPM' : '-- BPM';
      
      default:
        return '--';
    }
  }
}
