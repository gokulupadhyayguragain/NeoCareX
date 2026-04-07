// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObservationResponseImpl _$$ObservationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationResponseImpl(
      entry: (json['entry'] as List<dynamic>)
          .map((e) => ObservationEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ObservationResponseImplToJson(
        _$ObservationResponseImpl instance) =>
    <String, dynamic>{
      'entry': instance.entry,
    };

_$ObservationEntryImpl _$$ObservationEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationEntryImpl(
      resource: Observation.fromJson(json['resource'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ObservationEntryImplToJson(
        _$ObservationEntryImpl instance) =>
    <String, dynamic>{
      'resource': instance.resource,
    };

_$ObservationImpl _$$ObservationImplFromJson(Map<String, dynamic> json) =>
    _$ObservationImpl(
      meta: json['meta'] == null
          ? null
          : ObservationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      value: json['value'] == null
          ? null
          : ObservationValue.fromJson(json['value'] as Map<String, dynamic>),
      component: (json['component'] as List<dynamic>?)
          ?.map((e) => ObservationComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ObservationImplToJson(_$ObservationImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'value': instance.value,
      'component': instance.component,
    };

_$ObservationMetaImpl _$$ObservationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationMetaImpl(
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$$ObservationMetaImplToJson(
        _$ObservationMetaImpl instance) =>
    <String, dynamic>{
      'lastUpdated': instance.lastUpdated,
    };

_$ObservationValueImpl _$$ObservationValueImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationValueImpl(
      quantity: json['Quantity'] == null
          ? null
          : ObservationQuantity.fromJson(
              json['Quantity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ObservationValueImplToJson(
        _$ObservationValueImpl instance) =>
    <String, dynamic>{
      'Quantity': instance.quantity,
    };

_$ObservationQuantityImpl _$$ObservationQuantityImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationQuantityImpl(
      value: json['value'] as num?,
    );

Map<String, dynamic> _$$ObservationQuantityImplToJson(
        _$ObservationQuantityImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$ObservationComponentImpl _$$ObservationComponentImplFromJson(
        Map<String, dynamic> json) =>
    _$ObservationComponentImpl(
      value: json['value'] == null
          ? null
          : ObservationValue.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ObservationComponentImplToJson(
        _$ObservationComponentImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };
