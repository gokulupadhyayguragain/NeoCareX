import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart'
    as local;

part 'health_data_model.freezed.dart';
part 'health_data_model.g.dart';

@freezed
class HealthDataModel with _$HealthDataModel {
  const factory HealthDataModel({
    required String value,
    required String unit,
    required String date,
    required String time,
    required DateTime timestamp,
    String? systolic,
    String? diastolic,
    @Default(<String, dynamic>{}) Map<String, dynamic> additionalInfo,
  }) = _HealthDataModel;

  factory HealthDataModel.fromJson(Map<String, dynamic> json) =>
      _$HealthDataModelFromJson(json);

  factory HealthDataModel.fromNutritionObservation(local.Observation obs) {
    DateTime timestamp = _extractTimestamp(obs);

    double calories = obs.value?.quantity?.value?.toDouble() ?? 0;

    Map<String, dynamic> additionalInfo = _extractAdditionalInfo(obs);

    final date = DateFormat('MMM dd, yyyy').format(timestamp);
    final time = DateFormat('h:mm a').format(timestamp);

    return HealthDataModel(
      value: calories.toStringAsFixed(1),
      unit: 'kcal',
      date: date,
      time: time,
      timestamp: timestamp,
      additionalInfo: additionalInfo,
    );
  }

  static DateTime _extractTimestamp(local.Observation obs) {
    if (obs.effective?.dateTime != null) {
      try {
        return DateTime.parse(obs.effective!.dateTime!);
      } catch (e) {
        debugPrint('Could not parse effective date: $e');
      }
    }

    if (obs.meta?.lastUpdated != null) {
      try {
        return DateTime.parse(obs.meta!.lastUpdated!);
      } catch (e) {
        debugPrint('Could not parse lastUpdated: $e');
      }
    }

    return DateTime.now();
  }

  static Map<String, dynamic> _extractAdditionalInfo(local.Observation obs) {
    final additionalInfo = <String, dynamic>{
      'protein': '0 g',
      'carbs': '0 g',
      'fat': '0 g',
      'note': '',
    };

    if (obs.component != null) {
      for (var component in obs.component!) {
        final display = component.code?.coding?.firstOrNull?.display
            ?.toLowerCase();

        double value = component.value?.quantity?.value?.toDouble() ?? 0;
        String unit = component.value?.quantity?.unit ?? 'g';

        if (display?.contains('protein') == true) {
          additionalInfo['protein'] = '${value.toStringAsFixed(1)} $unit';
        } else if (display?.contains('carbohydrate') == true) {
          additionalInfo['carbs'] = '${value.toStringAsFixed(1)} $unit';
        } else if (display?.contains('fat') == true) {
          additionalInfo['fat'] = '${value.toStringAsFixed(1)} $unit';
        }
      }
    }

    final obsJson = obs.toJson();
    if (obsJson['note'] != null && obsJson['note'] is List) {
      final notes = obsJson['note'] as List;
      if (notes.isNotEmpty) {
        final firstNote = notes[0];
        if (firstNote is Map && firstNote['text'] != null) {
          additionalInfo['note'] = firstNote['text'] as String;
        }
      }
    }

    return additionalInfo;
  }
}

enum HealthDataType {
  bloodSugar,
  bloodPressure,
  bodyWeight,
  pulse,
  oxygenLevel,
  nutrition,
}
