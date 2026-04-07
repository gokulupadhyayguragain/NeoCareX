// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openEMR_patient_search_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenEMRPatientSearchImpl _$$OpenEMRPatientSearchImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenEMRPatientSearchImpl(
      given: json['given'] as String,
      family: json['family'] as String,
      birthDate:
          const CustomDateTimeConverter().fromJson(json['birthDate'] as String),
      gender: json['gender'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$OpenEMRPatientSearchImplToJson(
    _$OpenEMRPatientSearchImpl instance) {
  final val = <String, dynamic>{
    'given': instance.given,
    'family': instance.family,
    'birthDate': const CustomDateTimeConverter().toJson(instance.birthDate),
    'gender': instance.gender,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  return val;
}
