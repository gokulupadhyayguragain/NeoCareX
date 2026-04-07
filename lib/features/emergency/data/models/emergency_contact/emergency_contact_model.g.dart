// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyContactModelImpl _$$EmergencyContactModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyContactModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      colorValue: (json['colorValue'] as num).toInt(),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$EmergencyContactModelImplToJson(
        _$EmergencyContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'type': instance.type,
      'colorValue': instance.colorValue,
      'isSynced': instance.isSynced,
    };
