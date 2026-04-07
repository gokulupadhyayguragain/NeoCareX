// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contact_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmergencyContactUiModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmergencyContactUiModelCopyWith<EmergencyContactUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyContactUiModelCopyWith<$Res> {
  factory $EmergencyContactUiModelCopyWith(EmergencyContactUiModel value,
          $Res Function(EmergencyContactUiModel) then) =
      _$EmergencyContactUiModelCopyWithImpl<$Res, EmergencyContactUiModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String type,
      Color color,
      bool isSynced});
}

/// @nodoc
class _$EmergencyContactUiModelCopyWithImpl<$Res,
        $Val extends EmergencyContactUiModel>
    implements $EmergencyContactUiModelCopyWith<$Res> {
  _$EmergencyContactUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? color = null,
    Object? isSynced = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyContactUiModelImplCopyWith<$Res>
    implements $EmergencyContactUiModelCopyWith<$Res> {
  factory _$$EmergencyContactUiModelImplCopyWith(
          _$EmergencyContactUiModelImpl value,
          $Res Function(_$EmergencyContactUiModelImpl) then) =
      __$$EmergencyContactUiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String type,
      Color color,
      bool isSynced});
}

/// @nodoc
class __$$EmergencyContactUiModelImplCopyWithImpl<$Res>
    extends _$EmergencyContactUiModelCopyWithImpl<$Res,
        _$EmergencyContactUiModelImpl>
    implements _$$EmergencyContactUiModelImplCopyWith<$Res> {
  __$$EmergencyContactUiModelImplCopyWithImpl(
      _$EmergencyContactUiModelImpl _value,
      $Res Function(_$EmergencyContactUiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? color = null,
    Object? isSynced = null,
  }) {
    return _then(_$EmergencyContactUiModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EmergencyContactUiModelImpl implements _EmergencyContactUiModel {
  const _$EmergencyContactUiModelImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.type,
      required this.color,
      required this.isSynced});

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String type;
  @override
  final Color color;
  @override
  final bool isSynced;

  @override
  String toString() {
    return 'EmergencyContactUiModel(id: $id, name: $name, phone: $phone, type: $type, color: $color, isSynced: $isSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyContactUiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, type, color, isSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyContactUiModelImplCopyWith<_$EmergencyContactUiModelImpl>
      get copyWith => __$$EmergencyContactUiModelImplCopyWithImpl<
          _$EmergencyContactUiModelImpl>(this, _$identity);
}

abstract class _EmergencyContactUiModel implements EmergencyContactUiModel {
  const factory _EmergencyContactUiModel(
      {required final String id,
      required final String name,
      required final String phone,
      required final String type,
      required final Color color,
      required final bool isSynced}) = _$EmergencyContactUiModelImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get type;
  @override
  Color get color;
  @override
  bool get isSynced;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyContactUiModelImplCopyWith<_$EmergencyContactUiModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
