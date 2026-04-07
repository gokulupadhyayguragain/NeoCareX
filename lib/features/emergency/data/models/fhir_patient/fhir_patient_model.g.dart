// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fhir_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientNameModelImpl _$$PatientNameModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PatientNameModelImpl(
      given: json['given'] as String,
      family: json['family'] as String,
      prefix: json['prefix'] as String?,
    );

Map<String, dynamic> _$$PatientNameModelImplToJson(
        _$PatientNameModelImpl instance) =>
    <String, dynamic>{
      'given': instance.given,
      'family': instance.family,
      'prefix': instance.prefix,
    };

_$PatientTelecomModelImpl _$$PatientTelecomModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PatientTelecomModelImpl(
      system: json['system'] as String,
      value: json['value'] as String,
      use: json['use'] as String?,
    );

Map<String, dynamic> _$$PatientTelecomModelImplToJson(
        _$PatientTelecomModelImpl instance) =>
    <String, dynamic>{
      'system': instance.system,
      'value': instance.value,
      'use': instance.use,
    };

_$FhirEmergencyContactModelImpl _$$FhirEmergencyContactModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FhirEmergencyContactModelImpl(
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      relationship: json['relationship'] as String,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$FhirEmergencyContactModelImplToJson(
        _$FhirEmergencyContactModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'relationship': instance.relationship,
      'gender': instance.gender,
    };
