// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthDataModelImpl _$$HealthDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthDataModelImpl(
      value: json['value'] as String,
      unit: json['unit'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      systolic: json['systolic'] as String?,
      diastolic: json['diastolic'] as String?,
      additionalInfo: json['additionalInfo'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$HealthDataModelImplToJson(
        _$HealthDataModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
      'date': instance.date,
      'time': instance.time,
      'timestamp': instance.timestamp.toIso8601String(),
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'additionalInfo': instance.additionalInfo,
    };
