// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmergencyContactModel _$EmergencyContactModelFromJson(
    Map<String, dynamic> json) {
  return _EmergencyContactModel.fromJson(json);
}

/// @nodoc
mixin _$EmergencyContactModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyContactModelCopyWith<EmergencyContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactModelCopyWith<$Res> {
  factory $EmergencyContactModelCopyWith(EmergencyContactModel value,
          $Res Function(EmergencyContactModel) then) =
      _$EmergencyContactModelCopyWithImpl<$Res, EmergencyContactModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String phone,
      String type,
      int colorValue,
      bool isSynced});
}

/// @nodoc
class _$EmergencyContactModelCopyWithImpl<$Res,
        $Val extends EmergencyContactModel>
    implements $EmergencyContactModelCopyWith<$Res> {
  _$EmergencyContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? colorValue = null,
    Object? isSynced = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyContactModelImplCopyWith<$Res>
    implements $EmergencyContactModelCopyWith<$Res> {
  factory _$$EmergencyContactModelImplCopyWith(
          _$EmergencyContactModelImpl value,
          $Res Function(_$EmergencyContactModelImpl) then) =
      __$$EmergencyContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String phone,
      String type,
      int colorValue,
      bool isSynced});
}

/// @nodoc
class __$$EmergencyContactModelImplCopyWithImpl<$Res>
    extends _$EmergencyContactModelCopyWithImpl<$Res,
        _$EmergencyContactModelImpl>
    implements _$$EmergencyContactModelImplCopyWith<$Res> {
  __$$EmergencyContactModelImplCopyWithImpl(_$EmergencyContactModelImpl _value,
      $Res Function(_$EmergencyContactModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? colorValue = null,
    Object? isSynced = null,
  }) {
    return _then(_$EmergencyContactModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyContactModelImpl implements _EmergencyContactModel {
  const _$EmergencyContactModelImpl(
      {this.id,
      required this.name,
      required this.phone,
      required this.type,
      required this.colorValue,
      this.isSynced = false});

  factory _$EmergencyContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyContactModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String type;
  @override
  final int colorValue;
  @override
  @JsonKey()
  final bool isSynced;

  @override
  String toString() {
    return 'EmergencyContactModel(id: $id, name: $name, phone: $phone, type: $type, colorValue: $colorValue, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyContactModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, type, colorValue, isSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyContactModelImplCopyWith<_$EmergencyContactModelImpl>
      get copyWith => __$$EmergencyContactModelImplCopyWithImpl<
          _$EmergencyContactModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyContactModelImplToJson(
      this,
    );
  }
}

abstract class _EmergencyContactModel implements EmergencyContactModel {
  const factory _EmergencyContactModel(
      {final String? id,
      required final String name,
      required final String phone,
      required final String type,
      required final int colorValue,
      final bool isSynced}) = _$EmergencyContactModelImpl;

  factory _EmergencyContactModel.fromJson(Map<String, dynamic> json) =
      _$EmergencyContactModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get type;
  @override
  int get colorValue;
  @override
  bool get isSynced;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyContactModelImplCopyWith<_$EmergencyContactModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
