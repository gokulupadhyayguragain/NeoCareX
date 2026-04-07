// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openEMR_patient_search_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenEMRPatientSearch _$OpenEMRPatientSearchFromJson(Map<String, dynamic> json) {
  return _OpenEMRPatientSearch.fromJson(json);
}

/// @nodoc
mixin _$OpenEMRPatientSearch {
  String get given => throw _privateConstructorUsedError;
  String get family => throw _privateConstructorUsedError;
  @CustomDateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this OpenEMRPatientSearch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenEMRPatientSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenEMRPatientSearchCopyWith<OpenEMRPatientSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenEMRPatientSearchCopyWith<$Res> {
  factory $OpenEMRPatientSearchCopyWith(OpenEMRPatientSearch value,
          $Res Function(OpenEMRPatientSearch) then) =
      _$OpenEMRPatientSearchCopyWithImpl<$Res, OpenEMRPatientSearch>;
  @useResult
  $Res call(
      {String given,
      String family,
      @CustomDateTimeConverter() DateTime birthDate,
      String gender,
      String? phone});
}

/// @nodoc
class _$OpenEMRPatientSearchCopyWithImpl<$Res,
        $Val extends OpenEMRPatientSearch>
    implements $OpenEMRPatientSearchCopyWith<$Res> {
  _$OpenEMRPatientSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenEMRPatientSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? given = null,
    Object? family = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? phone = freezed,
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
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenEMRPatientSearchImplCopyWith<$Res>
    implements $OpenEMRPatientSearchCopyWith<$Res> {
  factory _$$OpenEMRPatientSearchImplCopyWith(_$OpenEMRPatientSearchImpl value,
          $Res Function(_$OpenEMRPatientSearchImpl) then) =
      __$$OpenEMRPatientSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String given,
      String family,
      @CustomDateTimeConverter() DateTime birthDate,
      String gender,
      String? phone});
}

/// @nodoc
class __$$OpenEMRPatientSearchImplCopyWithImpl<$Res>
    extends _$OpenEMRPatientSearchCopyWithImpl<$Res, _$OpenEMRPatientSearchImpl>
    implements _$$OpenEMRPatientSearchImplCopyWith<$Res> {
  __$$OpenEMRPatientSearchImplCopyWithImpl(_$OpenEMRPatientSearchImpl _value,
      $Res Function(_$OpenEMRPatientSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenEMRPatientSearch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? given = null,
    Object? family = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? phone = freezed,
  }) {
    return _then(_$OpenEMRPatientSearchImpl(
      given: null == given
          ? _value.given
          : given // ignore: cast_nullable_to_non_nullable
              as String,
      family: null == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenEMRPatientSearchImpl implements _OpenEMRPatientSearch {
  const _$OpenEMRPatientSearchImpl(
      {required this.given,
      required this.family,
      @CustomDateTimeConverter() required this.birthDate,
      required this.gender,
      this.phone});

  factory _$OpenEMRPatientSearchImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenEMRPatientSearchImplFromJson(json);

  @override
  final String given;
  @override
  final String family;
  @override
  @CustomDateTimeConverter()
  final DateTime birthDate;
  @override
  final String gender;
  @override
  final String? phone;

  @override
  String toString() {
    return 'OpenEMRPatientSearch(given: $given, family: $family, birthDate: $birthDate, gender: $gender, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenEMRPatientSearchImpl &&
            (identical(other.given, given) || other.given == given) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, given, family, birthDate, gender, phone);

  /// Create a copy of OpenEMRPatientSearch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenEMRPatientSearchImplCopyWith<_$OpenEMRPatientSearchImpl>
      get copyWith =>
          __$$OpenEMRPatientSearchImplCopyWithImpl<_$OpenEMRPatientSearchImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenEMRPatientSearchImplToJson(
      this,
    );
  }
}

abstract class _OpenEMRPatientSearch implements OpenEMRPatientSearch {
  const factory _OpenEMRPatientSearch(
      {required final String given,
      required final String family,
      @CustomDateTimeConverter() required final DateTime birthDate,
      required final String gender,
      final String? phone}) = _$OpenEMRPatientSearchImpl;

  factory _OpenEMRPatientSearch.fromJson(Map<String, dynamic> json) =
      _$OpenEMRPatientSearchImpl.fromJson;

  @override
  String get given;
  @override
  String get family;
  @override
  @CustomDateTimeConverter()
  DateTime get birthDate;
  @override
  String get gender;
  @override
  String? get phone;

  /// Create a copy of OpenEMRPatientSearch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenEMRPatientSearchImplCopyWith<_$OpenEMRPatientSearchImpl>
      get copyWith => throw _privateConstructorUsedError;
}
