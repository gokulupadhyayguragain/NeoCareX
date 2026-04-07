// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthDataModel _$HealthDataModelFromJson(Map<String, dynamic> json) {
  return _HealthDataModel.fromJson(json);
}

/// @nodoc
mixin _$HealthDataModel {
  String get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get systolic => throw _privateConstructorUsedError;
  String? get diastolic => throw _privateConstructorUsedError;
  Map<String, dynamic> get additionalInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDataModelCopyWith<HealthDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDataModelCopyWith<$Res> {
  factory $HealthDataModelCopyWith(
          HealthDataModel value, $Res Function(HealthDataModel) then) =
      _$HealthDataModelCopyWithImpl<$Res, HealthDataModel>;
  @useResult
  $Res call(
      {String value,
      String unit,
      String date,
      String time,
      DateTime timestamp,
      String? systolic,
      String? diastolic,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class _$HealthDataModelCopyWithImpl<$Res, $Val extends HealthDataModel>
    implements $HealthDataModelCopyWith<$Res> {
  _$HealthDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? unit = null,
    Object? date = null,
    Object? time = null,
    Object? timestamp = null,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthDataModelImplCopyWith<$Res>
    implements $HealthDataModelCopyWith<$Res> {
  factory _$$HealthDataModelImplCopyWith(_$HealthDataModelImpl value,
          $Res Function(_$HealthDataModelImpl) then) =
      __$$HealthDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      String unit,
      String date,
      String time,
      DateTime timestamp,
      String? systolic,
      String? diastolic,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class __$$HealthDataModelImplCopyWithImpl<$Res>
    extends _$HealthDataModelCopyWithImpl<$Res, _$HealthDataModelImpl>
    implements _$$HealthDataModelImplCopyWith<$Res> {
  __$$HealthDataModelImplCopyWithImpl(
      _$HealthDataModelImpl _value, $Res Function(_$HealthDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? unit = null,
    Object? date = null,
    Object? time = null,
    Object? timestamp = null,
    Object? systolic = freezed,
    Object? diastolic = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_$HealthDataModelImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      systolic: freezed == systolic
          ? _value.systolic
          : systolic // ignore: cast_nullable_to_non_nullable
              as String?,
      diastolic: freezed == diastolic
          ? _value.diastolic
          : diastolic // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInfo: null == additionalInfo
          ? _value._additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthDataModelImpl implements _HealthDataModel {
  const _$HealthDataModelImpl(
      {required this.value,
      required this.unit,
      required this.date,
      required this.time,
      required this.timestamp,
      this.systolic,
      this.diastolic,
      final Map<String, dynamic> additionalInfo = const <String, dynamic>{}})
      : _additionalInfo = additionalInfo;

  factory _$HealthDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthDataModelImplFromJson(json);

  @override
  final String value;
  @override
  final String unit;
  @override
  final String date;
  @override
  final String time;
  @override
  final DateTime timestamp;
  @override
  final String? systolic;
  @override
  final String? diastolic;
  final Map<String, dynamic> _additionalInfo;
  @override
  @JsonKey()
  Map<String, dynamic> get additionalInfo {
    if (_additionalInfo is EqualUnmodifiableMapView) return _additionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalInfo);
  }

  @override
  String toString() {
    return 'HealthDataModel(value: $value, unit: $unit, date: $date, time: $time, timestamp: $timestamp, systolic: $systolic, diastolic: $diastolic, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthDataModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.systolic, systolic) ||
                other.systolic == systolic) &&
            (identical(other.diastolic, diastolic) ||
                other.diastolic == diastolic) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfo, _additionalInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      value,
      unit,
      date,
      time,
      timestamp,
      systolic,
      diastolic,
      const DeepCollectionEquality().hash(_additionalInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthDataModelImplCopyWith<_$HealthDataModelImpl> get copyWith =>
      __$$HealthDataModelImplCopyWithImpl<_$HealthDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthDataModelImplToJson(
      this,
    );
  }
}

abstract class _HealthDataModel implements HealthDataModel {
  const factory _HealthDataModel(
      {required final String value,
      required final String unit,
      required final String date,
      required final String time,
      required final DateTime timestamp,
      final String? systolic,
      final String? diastolic,
      final Map<String, dynamic> additionalInfo}) = _$HealthDataModelImpl;

  factory _HealthDataModel.fromJson(Map<String, dynamic> json) =
      _$HealthDataModelImpl.fromJson;

  @override
  String get value;
  @override
  String get unit;
  @override
  String get date;
  @override
  String get time;
  @override
  DateTime get timestamp;
  @override
  String? get systolic;
  @override
  String? get diastolic;
  @override
  Map<String, dynamic> get additionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$HealthDataModelImplCopyWith<_$HealthDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
