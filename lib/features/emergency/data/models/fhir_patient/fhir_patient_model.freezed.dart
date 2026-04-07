// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_patient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FhirPatientModel {
  String get id => throw _privateConstructorUsedError;
  String get resourceType => throw _privateConstructorUsedError;
  PatientNameModel get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  List<PatientTelecomModel>? get telecom => throw _privateConstructorUsedError;
  List<FhirEmergencyContactModel>? get contact =>
      throw _privateConstructorUsedError;
  String? get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FhirPatientModelCopyWith<FhirPatientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirPatientModelCopyWith<$Res> {
  factory $FhirPatientModelCopyWith(
          FhirPatientModel value, $Res Function(FhirPatientModel) then) =
      _$FhirPatientModelCopyWithImpl<$Res, FhirPatientModel>;
  @useResult
  $Res call(
      {String id,
      String resourceType,
      PatientNameModel name,
      String gender,
      String? birthDate,
      List<PatientTelecomModel>? telecom,
      List<FhirEmergencyContactModel>? contact,
      String? active});

  $PatientNameModelCopyWith<$Res> get name;
}

/// @nodoc
class _$FhirPatientModelCopyWithImpl<$Res, $Val extends FhirPatientModel>
    implements $FhirPatientModelCopyWith<$Res> {
  _$FhirPatientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resourceType = null,
    Object? name = null,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? telecom = freezed,
    Object? contact = freezed,
    Object? active = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PatientNameModel,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      telecom: freezed == telecom
          ? _value.telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<PatientTelecomModel>?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as List<FhirEmergencyContactModel>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PatientNameModelCopyWith<$Res> get name {
    return $PatientNameModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FhirPatientModelImplCopyWith<$Res>
    implements $FhirPatientModelCopyWith<$Res> {
  factory _$$FhirPatientModelImplCopyWith(_$FhirPatientModelImpl value,
          $Res Function(_$FhirPatientModelImpl) then) =
      __$$FhirPatientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String resourceType,
      PatientNameModel name,
      String gender,
      String? birthDate,
      List<PatientTelecomModel>? telecom,
      List<FhirEmergencyContactModel>? contact,
      String? active});

  @override
  $PatientNameModelCopyWith<$Res> get name;
}

/// @nodoc
class __$$FhirPatientModelImplCopyWithImpl<$Res>
    extends _$FhirPatientModelCopyWithImpl<$Res, _$FhirPatientModelImpl>
    implements _$$FhirPatientModelImplCopyWith<$Res> {
  __$$FhirPatientModelImplCopyWithImpl(_$FhirPatientModelImpl _value,
      $Res Function(_$FhirPatientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? resourceType = null,
    Object? name = null,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? telecom = freezed,
    Object? contact = freezed,
    Object? active = freezed,
  }) {
    return _then(_$FhirPatientModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resourceType: null == resourceType
          ? _value.resourceType
          : resourceType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as PatientNameModel,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      telecom: freezed == telecom
          ? _value._telecom
          : telecom // ignore: cast_nullable_to_non_nullable
              as List<PatientTelecomModel>?,
      contact: freezed == contact
          ? _value._contact
          : contact // ignore: cast_nullable_to_non_nullable
              as List<FhirEmergencyContactModel>?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FhirPatientModelImpl implements _FhirPatientModel {
  const _$FhirPatientModelImpl(
      {required this.id,
      required this.resourceType,
      required this.name,
      required this.gender,
      this.birthDate,
      final List<PatientTelecomModel>? telecom,
      final List<FhirEmergencyContactModel>? contact,
      this.active})
      : _telecom = telecom,
        _contact = contact;

  @override
  final String id;
  @override
  final String resourceType;
  @override
  final PatientNameModel name;
  @override
  final String gender;
  @override
  final String? birthDate;
  final List<PatientTelecomModel>? _telecom;
  @override
  List<PatientTelecomModel>? get telecom {
    final value = _telecom;
    if (value == null) return null;
    if (_telecom is EqualUnmodifiableListView) return _telecom;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FhirEmergencyContactModel>? _contact;
  @override
  List<FhirEmergencyContactModel>? get contact {
    final value = _contact;
    if (value == null) return null;
    if (_contact is EqualUnmodifiableListView) return _contact;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? active;

  @override
  String toString() {
    return 'FhirPatientModel(id: $id, resourceType: $resourceType, name: $name, gender: $gender, birthDate: $birthDate, telecom: $telecom, contact: $contact, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirPatientModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resourceType, resourceType) ||
                other.resourceType == resourceType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            const DeepCollectionEquality().equals(other._telecom, _telecom) &&
            const DeepCollectionEquality().equals(other._contact, _contact) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      resourceType,
      name,
      gender,
      birthDate,
      const DeepCollectionEquality().hash(_telecom),
      const DeepCollectionEquality().hash(_contact),
      active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirPatientModelImplCopyWith<_$FhirPatientModelImpl> get copyWith =>
      __$$FhirPatientModelImplCopyWithImpl<_$FhirPatientModelImpl>(
          this, _$identity);
}

abstract class _FhirPatientModel implements FhirPatientModel {
  const factory _FhirPatientModel(
      {required final String id,
      required final String resourceType,
      required final PatientNameModel name,
      required final String gender,
      final String? birthDate,
      final List<PatientTelecomModel>? telecom,
      final List<FhirEmergencyContactModel>? contact,
      final String? active}) = _$FhirPatientModelImpl;

  @override
  String get id;
  @override
  String get resourceType;
  @override
  PatientNameModel get name;
  @override
  String get gender;
  @override
  String? get birthDate;
  @override
  List<PatientTelecomModel>? get telecom;
  @override
  List<FhirEmergencyContactModel>? get contact;
  @override
  String? get active;
  @override
  @JsonKey(ignore: true)
  _$$FhirPatientModelImplCopyWith<_$FhirPatientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientNameModel _$PatientNameModelFromJson(Map<String, dynamic> json) {
  return _PatientNameModel.fromJson(json);
}

/// @nodoc
mixin _$PatientNameModel {
  String get given => throw _privateConstructorUsedError;
  String get family => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientNameModelCopyWith<PatientNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientNameModelCopyWith<$Res> {
  factory $PatientNameModelCopyWith(
          PatientNameModel value, $Res Function(PatientNameModel) then) =
      _$PatientNameModelCopyWithImpl<$Res, PatientNameModel>;
  @useResult
  $Res call({String given, String family, String? prefix});
}

/// @nodoc
class _$PatientNameModelCopyWithImpl<$Res, $Val extends PatientNameModel>
    implements $PatientNameModelCopyWith<$Res> {
  _$PatientNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? given = null,
    Object? family = null,
    Object? prefix = freezed,
  }) {
    return _then(_value.copyWith(
      given: null == given
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as String,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientNameModelImplCopyWith<$Res>
    implements $PatientNameModelCopyWith<$Res> {
  factory _$$PatientNameModelImplCopyWith(_$PatientNameModelImpl value,
          $Res Function(_$PatientNameModelImpl) then) =
      __$$PatientNameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String given, String family, String? prefix});
}

/// @nodoc
class __$$PatientNameModelImplCopyWithImpl<$Res>
    extends _$PatientNameModelCopyWithImpl<$Res, _$PatientNameModelImpl>
    implements _$$PatientNameModelImplCopyWith<$Res> {
  __$$PatientNameModelImplCopyWithImpl(_$PatientNameModelImpl _value,
      $Res Function(_$PatientNameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? given = null,
    Object? family = null,
    Object? prefix = freezed,
  }) {
    return _then(_$PatientNameModelImpl(
      given: null == given
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as String,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientNameModelImpl implements _PatientNameModel {
  const _$PatientNameModelImpl(
      {required this.given, required this.family, this.prefix});

  factory _$PatientNameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientNameModelImplFromJson(json);

  @override
  final String given;
  @override
  final String family;
  @override
  final String? prefix;

  @override
  String toString() {
    return 'PatientNameModel(given: $given, family: $family, prefix: $prefix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientNameModelImpl &&
            (identical(other.given, given) || other.given == given) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.prefix, prefix) || other.prefix == prefix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, given, family, prefix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientNameModelImplCopyWith<_$PatientNameModelImpl> get copyWith =>
      __$$PatientNameModelImplCopyWithImpl<_$PatientNameModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientNameModelImplToJson(
      this,
    );
  }
}

abstract class _PatientNameModel implements PatientNameModel {
  const factory _PatientNameModel(
      {required final String given,
      required final String family,
      final String? prefix}) = _$PatientNameModelImpl;

  factory _PatientNameModel.fromJson(Map<String, dynamic> json) =
      _$PatientNameModelImpl.fromJson;

  @override
  String get given;
  @override
  String get family;
  @override
  String? get prefix;
  @override
  @JsonKey(ignore: true)
  _$$PatientNameModelImplCopyWith<_$PatientNameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientTelecomModel _$PatientTelecomModelFromJson(Map<String, dynamic> json) {
  return _PatientTelecomModel.fromJson(json);
}

/// @nodoc
mixin _$PatientTelecomModel {
  String get system => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String? get use => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientTelecomModelCopyWith<PatientTelecomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientTelecomModelCopyWith<$Res> {
  factory $PatientTelecomModelCopyWith(
          PatientTelecomModel value, $Res Function(PatientTelecomModel) then) =
      _$PatientTelecomModelCopyWithImpl<$Res, PatientTelecomModel>;
  @useResult
  $Res call({String system, String value, String? use});
}

/// @nodoc
class _$PatientTelecomModelCopyWithImpl<$Res, $Val extends PatientTelecomModel>
    implements $PatientTelecomModelCopyWith<$Res> {
  _$PatientTelecomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? system = null,
    Object? value = null,
    Object? use = freezed,
  }) {
    return _then(_value.copyWith(
      system: null == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientTelecomModelImplCopyWith<$Res>
    implements $PatientTelecomModelCopyWith<$Res> {
  factory _$$PatientTelecomModelImplCopyWith(_$PatientTelecomModelImpl value,
          $Res Function(_$PatientTelecomModelImpl) then) =
      __$$PatientTelecomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String system, String value, String? use});
}

/// @nodoc
class __$$PatientTelecomModelImplCopyWithImpl<$Res>
    extends _$PatientTelecomModelCopyWithImpl<$Res, _$PatientTelecomModelImpl>
    implements _$$PatientTelecomModelImplCopyWith<$Res> {
  __$$PatientTelecomModelImplCopyWithImpl(_$PatientTelecomModelImpl _value,
      $Res Function(_$PatientTelecomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? system = null,
    Object? value = null,
    Object? use = freezed,
  }) {
    return _then(_$PatientTelecomModelImpl(
      system: null == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      use: freezed == use
          ? _value.use
          : use // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientTelecomModelImpl implements _PatientTelecomModel {
  const _$PatientTelecomModelImpl(
      {required this.system, required this.value, this.use});

  factory _$PatientTelecomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientTelecomModelImplFromJson(json);

  @override
  final String system;
  @override
  final String value;
  @override
  final String? use;

  @override
  String toString() {
    return 'PatientTelecomModel(system: $system, value: $value, use: $use)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientTelecomModelImpl &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.use, use) || other.use == use));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, system, value, use);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientTelecomModelImplCopyWith<_$PatientTelecomModelImpl> get copyWith =>
      __$$PatientTelecomModelImplCopyWithImpl<_$PatientTelecomModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientTelecomModelImplToJson(
      this,
    );
  }
}

abstract class _PatientTelecomModel implements PatientTelecomModel {
  const factory _PatientTelecomModel(
      {required final String system,
      required final String value,
      final String? use}) = _$PatientTelecomModelImpl;

  factory _PatientTelecomModel.fromJson(Map<String, dynamic> json) =
      _$PatientTelecomModelImpl.fromJson;

  @override
  String get system;
  @override
  String get value;
  @override
  String? get use;
  @override
  @JsonKey(ignore: true)
  _$$PatientTelecomModelImplCopyWith<_$PatientTelecomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FhirEmergencyContactModel _$FhirEmergencyContactModelFromJson(
    Map<String, dynamic> json) {
  return _FhirEmergencyContactModel.fromJson(json);
}

/// @nodoc
mixin _$FhirEmergencyContactModel {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get relationship => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FhirEmergencyContactModelCopyWith<FhirEmergencyContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirEmergencyContactModelCopyWith<$Res> {
  factory $FhirEmergencyContactModelCopyWith(FhirEmergencyContactModel value,
          $Res Function(FhirEmergencyContactModel) then) =
      _$FhirEmergencyContactModelCopyWithImpl<$Res, FhirEmergencyContactModel>;
  @useResult
  $Res call(
      {String name, String phoneNumber, String relationship, String? gender});
}

/// @nodoc
class _$FhirEmergencyContactModelCopyWithImpl<$Res,
        $Val extends FhirEmergencyContactModel>
    implements $FhirEmergencyContactModelCopyWith<$Res> {
  _$FhirEmergencyContactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? relationship = null,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FhirEmergencyContactModelImplCopyWith<$Res>
    implements $FhirEmergencyContactModelCopyWith<$Res> {
  factory _$$FhirEmergencyContactModelImplCopyWith(
          _$FhirEmergencyContactModelImpl value,
          $Res Function(_$FhirEmergencyContactModelImpl) then) =
      __$$FhirEmergencyContactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String phoneNumber, String relationship, String? gender});
}

/// @nodoc
class __$$FhirEmergencyContactModelImplCopyWithImpl<$Res>
    extends _$FhirEmergencyContactModelCopyWithImpl<$Res,
        _$FhirEmergencyContactModelImpl>
    implements _$$FhirEmergencyContactModelImplCopyWith<$Res> {
  __$$FhirEmergencyContactModelImplCopyWithImpl(
      _$FhirEmergencyContactModelImpl _value,
      $Res Function(_$FhirEmergencyContactModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? relationship = null,
    Object? gender = freezed,
  }) {
    return _then(_$FhirEmergencyContactModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: null == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FhirEmergencyContactModelImpl implements _FhirEmergencyContactModel {
  const _$FhirEmergencyContactModelImpl(
      {required this.name,
      required this.phoneNumber,
      required this.relationship,
      this.gender});

  factory _$FhirEmergencyContactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FhirEmergencyContactModelImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String relationship;
  @override
  final String? gender;

  @override
  String toString() {
    return 'FhirEmergencyContactModel(name: $name, phoneNumber: $phoneNumber, relationship: $relationship, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirEmergencyContactModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phoneNumber, relationship, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirEmergencyContactModelImplCopyWith<_$FhirEmergencyContactModelImpl>
      get copyWith => __$$FhirEmergencyContactModelImplCopyWithImpl<
          _$FhirEmergencyContactModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FhirEmergencyContactModelImplToJson(
      this,
    );
  }
}

abstract class _FhirEmergencyContactModel implements FhirEmergencyContactModel {
  const factory _FhirEmergencyContactModel(
      {required final String name,
      required final String phoneNumber,
      required final String relationship,
      final String? gender}) = _$FhirEmergencyContactModelImpl;

  factory _FhirEmergencyContactModel.fromJson(Map<String, dynamic> json) =
      _$FhirEmergencyContactModelImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get relationship;
  @override
  String? get gender;
  @override
  @JsonKey(ignore: true)
  _$$FhirEmergencyContactModelImplCopyWith<_$FhirEmergencyContactModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
