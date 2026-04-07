// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'observation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ObservationResponse _$ObservationResponseFromJson(Map<String, dynamic> json) {
  return _ObservationResponse.fromJson(json);
}

/// @nodoc
mixin _$ObservationResponse {
  List<ObservationEntry> get entry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationResponseCopyWith<ObservationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationResponseCopyWith<$Res> {
  factory $ObservationResponseCopyWith(
          ObservationResponse value, $Res Function(ObservationResponse) then) =
      _$ObservationResponseCopyWithImpl<$Res, ObservationResponse>;
  @useResult
  $Res call({List<ObservationEntry> entry});
}

/// @nodoc
class _$ObservationResponseCopyWithImpl<$Res, $Val extends ObservationResponse>
    implements $ObservationResponseCopyWith<$Res> {
  _$ObservationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_value.copyWith(
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<ObservationEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationResponseImplCopyWith<$Res>
    implements $ObservationResponseCopyWith<$Res> {
  factory _$$ObservationResponseImplCopyWith(_$ObservationResponseImpl value,
          $Res Function(_$ObservationResponseImpl) then) =
      __$$ObservationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ObservationEntry> entry});
}

/// @nodoc
class __$$ObservationResponseImplCopyWithImpl<$Res>
    extends _$ObservationResponseCopyWithImpl<$Res, _$ObservationResponseImpl>
    implements _$$ObservationResponseImplCopyWith<$Res> {
  __$$ObservationResponseImplCopyWithImpl(_$ObservationResponseImpl _value,
      $Res Function(_$ObservationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$ObservationResponseImpl(
      entry: null == entry
          ? _value._entry
          : entry // ignore: cast_nullable_to_non_nullable
              as List<ObservationEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationResponseImpl implements _ObservationResponse {
  const _$ObservationResponseImpl({required final List<ObservationEntry> entry})
      : _entry = entry;

  factory _$ObservationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationResponseImplFromJson(json);

  final List<ObservationEntry> _entry;
  @override
  List<ObservationEntry> get entry {
    if (_entry is EqualUnmodifiableListView) return _entry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entry);
  }

  @override
  String toString() {
    return 'ObservationResponse(entry: $entry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationResponseImpl &&
            const DeepCollectionEquality().equals(other._entry, _entry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entry));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationResponseImplCopyWith<_$ObservationResponseImpl> get copyWith =>
      __$$ObservationResponseImplCopyWithImpl<_$ObservationResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationResponseImplToJson(
      this,
    );
  }
}

abstract class _ObservationResponse implements ObservationResponse {
  const factory _ObservationResponse(
          {required final List<ObservationEntry> entry}) =
      _$ObservationResponseImpl;

  factory _ObservationResponse.fromJson(Map<String, dynamic> json) =
      _$ObservationResponseImpl.fromJson;

  @override
  List<ObservationEntry> get entry;
  @override
  @JsonKey(ignore: true)
  _$$ObservationResponseImplCopyWith<_$ObservationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObservationEntry _$ObservationEntryFromJson(Map<String, dynamic> json) {
  return _ObservationEntry.fromJson(json);
}

/// @nodoc
mixin _$ObservationEntry {
  Observation get resource => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationEntryCopyWith<ObservationEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationEntryCopyWith<$Res> {
  factory $ObservationEntryCopyWith(
          ObservationEntry value, $Res Function(ObservationEntry) then) =
      _$ObservationEntryCopyWithImpl<$Res, ObservationEntry>;
  @useResult
  $Res call({Observation resource});

  $ObservationCopyWith<$Res> get resource;
}

/// @nodoc
class _$ObservationEntryCopyWithImpl<$Res, $Val extends ObservationEntry>
    implements $ObservationEntryCopyWith<$Res> {
  _$ObservationEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = null,
  }) {
    return _then(_value.copyWith(
      resource: null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Observation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationCopyWith<$Res> get resource {
    return $ObservationCopyWith<$Res>(_value.resource, (value) {
      return _then(_value.copyWith(resource: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ObservationEntryImplCopyWith<$Res>
    implements $ObservationEntryCopyWith<$Res> {
  factory _$$ObservationEntryImplCopyWith(_$ObservationEntryImpl value,
          $Res Function(_$ObservationEntryImpl) then) =
      __$$ObservationEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Observation resource});

  @override
  $ObservationCopyWith<$Res> get resource;
}

/// @nodoc
class __$$ObservationEntryImplCopyWithImpl<$Res>
    extends _$ObservationEntryCopyWithImpl<$Res, _$ObservationEntryImpl>
    implements _$$ObservationEntryImplCopyWith<$Res> {
  __$$ObservationEntryImplCopyWithImpl(_$ObservationEntryImpl _value,
      $Res Function(_$ObservationEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = null,
  }) {
    return _then(_$ObservationEntryImpl(
      resource: null == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as Observation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationEntryImpl implements _ObservationEntry {
  const _$ObservationEntryImpl({required this.resource});

  factory _$ObservationEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationEntryImplFromJson(json);

  @override
  final Observation resource;

  @override
  String toString() {
    return 'ObservationEntry(resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationEntryImpl &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resource);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationEntryImplCopyWith<_$ObservationEntryImpl> get copyWith =>
      __$$ObservationEntryImplCopyWithImpl<_$ObservationEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationEntryImplToJson(
      this,
    );
  }
}

abstract class _ObservationEntry implements ObservationEntry {
  const factory _ObservationEntry({required final Observation resource}) =
      _$ObservationEntryImpl;

  factory _ObservationEntry.fromJson(Map<String, dynamic> json) =
      _$ObservationEntryImpl.fromJson;

  @override
  Observation get resource;
  @override
  @JsonKey(ignore: true)
  _$$ObservationEntryImplCopyWith<_$ObservationEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Observation _$ObservationFromJson(Map<String, dynamic> json) {
  return _Observation.fromJson(json);
}

/// @nodoc
mixin _$Observation {
  ObservationMeta? get meta => throw _privateConstructorUsedError;
  ObservationValue? get value => throw _privateConstructorUsedError;
  List<ObservationComponent>? get component =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationCopyWith<Observation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationCopyWith<$Res> {
  factory $ObservationCopyWith(
          Observation value, $Res Function(Observation) then) =
      _$ObservationCopyWithImpl<$Res, Observation>;
  @useResult
  $Res call(
      {ObservationMeta? meta,
      ObservationValue? value,
      List<ObservationComponent>? component});

  $ObservationMetaCopyWith<$Res>? get meta;
  $ObservationValueCopyWith<$Res>? get value;
}

/// @nodoc
class _$ObservationCopyWithImpl<$Res, $Val extends Observation>
    implements $ObservationCopyWith<$Res> {
  _$ObservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? value = freezed,
    Object? component = freezed,
  }) {
    return _then(_value.copyWith(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ObservationMeta?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ObservationValue?,
      component: freezed == component
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as List<ObservationComponent>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ObservationMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationValueCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $ObservationValueCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ObservationImplCopyWith<$Res>
    implements $ObservationCopyWith<$Res> {
  factory _$$ObservationImplCopyWith(
          _$ObservationImpl value, $Res Function(_$ObservationImpl) then) =
      __$$ObservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ObservationMeta? meta,
      ObservationValue? value,
      List<ObservationComponent>? component});

  @override
  $ObservationMetaCopyWith<$Res>? get meta;
  @override
  $ObservationValueCopyWith<$Res>? get value;
}

/// @nodoc
class __$$ObservationImplCopyWithImpl<$Res>
    extends _$ObservationCopyWithImpl<$Res, _$ObservationImpl>
    implements _$$ObservationImplCopyWith<$Res> {
  __$$ObservationImplCopyWithImpl(
      _$ObservationImpl _value, $Res Function(_$ObservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? value = freezed,
    Object? component = freezed,
  }) {
    return _then(_$ObservationImpl(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ObservationMeta?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ObservationValue?,
      component: freezed == component
          ? _value._component
          : component // ignore: cast_nullable_to_non_nullable
              as List<ObservationComponent>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationImpl implements _Observation {
  const _$ObservationImpl(
      {this.meta, this.value, final List<ObservationComponent>? component})
      : _component = component;

  factory _$ObservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationImplFromJson(json);

  @override
  final ObservationMeta? meta;
  @override
  final ObservationValue? value;
  final List<ObservationComponent>? _component;
  @override
  List<ObservationComponent>? get component {
    final value = _component;
    if (value == null) return null;
    if (_component is EqualUnmodifiableListView) return _component;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Observation(meta: $meta, value: $value, component: $component)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality()
                .equals(other._component, _component));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, value,
      const DeepCollectionEquality().hash(_component));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      __$$ObservationImplCopyWithImpl<_$ObservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationImplToJson(
      this,
    );
  }
}

abstract class _Observation implements Observation {
  const factory _Observation(
      {final ObservationMeta? meta,
      final ObservationValue? value,
      final List<ObservationComponent>? component}) = _$ObservationImpl;

  factory _Observation.fromJson(Map<String, dynamic> json) =
      _$ObservationImpl.fromJson;

  @override
  ObservationMeta? get meta;
  @override
  ObservationValue? get value;
  @override
  List<ObservationComponent>? get component;
  @override
  @JsonKey(ignore: true)
  _$$ObservationImplCopyWith<_$ObservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObservationMeta _$ObservationMetaFromJson(Map<String, dynamic> json) {
  return _ObservationMeta.fromJson(json);
}

/// @nodoc
mixin _$ObservationMeta {
  String? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationMetaCopyWith<ObservationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationMetaCopyWith<$Res> {
  factory $ObservationMetaCopyWith(
          ObservationMeta value, $Res Function(ObservationMeta) then) =
      _$ObservationMetaCopyWithImpl<$Res, ObservationMeta>;
  @useResult
  $Res call({String? lastUpdated});
}

/// @nodoc
class _$ObservationMetaCopyWithImpl<$Res, $Val extends ObservationMeta>
    implements $ObservationMetaCopyWith<$Res> {
  _$ObservationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationMetaImplCopyWith<$Res>
    implements $ObservationMetaCopyWith<$Res> {
  factory _$$ObservationMetaImplCopyWith(_$ObservationMetaImpl value,
          $Res Function(_$ObservationMetaImpl) then) =
      __$$ObservationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? lastUpdated});
}

/// @nodoc
class __$$ObservationMetaImplCopyWithImpl<$Res>
    extends _$ObservationMetaCopyWithImpl<$Res, _$ObservationMetaImpl>
    implements _$$ObservationMetaImplCopyWith<$Res> {
  __$$ObservationMetaImplCopyWithImpl(
      _$ObservationMetaImpl _value, $Res Function(_$ObservationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdated = freezed,
  }) {
    return _then(_$ObservationMetaImpl(
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationMetaImpl implements _ObservationMeta {
  const _$ObservationMetaImpl({this.lastUpdated});

  factory _$ObservationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationMetaImplFromJson(json);

  @override
  final String? lastUpdated;

  @override
  String toString() {
    return 'ObservationMeta(lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationMetaImpl &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationMetaImplCopyWith<_$ObservationMetaImpl> get copyWith =>
      __$$ObservationMetaImplCopyWithImpl<_$ObservationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationMetaImplToJson(
      this,
    );
  }
}

abstract class _ObservationMeta implements ObservationMeta {
  const factory _ObservationMeta({final String? lastUpdated}) =
      _$ObservationMetaImpl;

  factory _ObservationMeta.fromJson(Map<String, dynamic> json) =
      _$ObservationMetaImpl.fromJson;

  @override
  String? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ObservationMetaImplCopyWith<_$ObservationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObservationValue _$ObservationValueFromJson(Map<String, dynamic> json) {
  return _ObservationValue.fromJson(json);
}

/// @nodoc
mixin _$ObservationValue {
  @JsonKey(name: 'Quantity')
  ObservationQuantity? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationValueCopyWith<ObservationValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationValueCopyWith<$Res> {
  factory $ObservationValueCopyWith(
          ObservationValue value, $Res Function(ObservationValue) then) =
      _$ObservationValueCopyWithImpl<$Res, ObservationValue>;
  @useResult
  $Res call({@JsonKey(name: 'Quantity') ObservationQuantity? quantity});

  $ObservationQuantityCopyWith<$Res>? get quantity;
}

/// @nodoc
class _$ObservationValueCopyWithImpl<$Res, $Val extends ObservationValue>
    implements $ObservationValueCopyWith<$Res> {
  _$ObservationValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as ObservationQuantity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationQuantityCopyWith<$Res>? get quantity {
    if (_value.quantity == null) {
      return null;
    }

    return $ObservationQuantityCopyWith<$Res>(_value.quantity!, (value) {
      return _then(_value.copyWith(quantity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ObservationValueImplCopyWith<$Res>
    implements $ObservationValueCopyWith<$Res> {
  factory _$$ObservationValueImplCopyWith(_$ObservationValueImpl value,
          $Res Function(_$ObservationValueImpl) then) =
      __$$ObservationValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Quantity') ObservationQuantity? quantity});

  @override
  $ObservationQuantityCopyWith<$Res>? get quantity;
}

/// @nodoc
class __$$ObservationValueImplCopyWithImpl<$Res>
    extends _$ObservationValueCopyWithImpl<$Res, _$ObservationValueImpl>
    implements _$$ObservationValueImplCopyWith<$Res> {
  __$$ObservationValueImplCopyWithImpl(_$ObservationValueImpl _value,
      $Res Function(_$ObservationValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
  }) {
    return _then(_$ObservationValueImpl(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as ObservationQuantity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationValueImpl implements _ObservationValue {
  const _$ObservationValueImpl({@JsonKey(name: 'Quantity') this.quantity});

  factory _$ObservationValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationValueImplFromJson(json);

  @override
  @JsonKey(name: 'Quantity')
  final ObservationQuantity? quantity;

  @override
  String toString() {
    return 'ObservationValue(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationValueImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationValueImplCopyWith<_$ObservationValueImpl> get copyWith =>
      __$$ObservationValueImplCopyWithImpl<_$ObservationValueImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationValueImplToJson(
      this,
    );
  }
}

abstract class _ObservationValue implements ObservationValue {
  const factory _ObservationValue(
          {@JsonKey(name: 'Quantity') final ObservationQuantity? quantity}) =
      _$ObservationValueImpl;

  factory _ObservationValue.fromJson(Map<String, dynamic> json) =
      _$ObservationValueImpl.fromJson;

  @override
  @JsonKey(name: 'Quantity')
  ObservationQuantity? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ObservationValueImplCopyWith<_$ObservationValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObservationQuantity _$ObservationQuantityFromJson(Map<String, dynamic> json) {
  return _ObservationQuantity.fromJson(json);
}

/// @nodoc
mixin _$ObservationQuantity {
  num? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationQuantityCopyWith<ObservationQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationQuantityCopyWith<$Res> {
  factory $ObservationQuantityCopyWith(
          ObservationQuantity value, $Res Function(ObservationQuantity) then) =
      _$ObservationQuantityCopyWithImpl<$Res, ObservationQuantity>;
  @useResult
  $Res call({num? value});
}

/// @nodoc
class _$ObservationQuantityCopyWithImpl<$Res, $Val extends ObservationQuantity>
    implements $ObservationQuantityCopyWith<$Res> {
  _$ObservationQuantityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObservationQuantityImplCopyWith<$Res>
    implements $ObservationQuantityCopyWith<$Res> {
  factory _$$ObservationQuantityImplCopyWith(_$ObservationQuantityImpl value,
          $Res Function(_$ObservationQuantityImpl) then) =
      __$$ObservationQuantityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? value});
}

/// @nodoc
class __$$ObservationQuantityImplCopyWithImpl<$Res>
    extends _$ObservationQuantityCopyWithImpl<$Res, _$ObservationQuantityImpl>
    implements _$$ObservationQuantityImplCopyWith<$Res> {
  __$$ObservationQuantityImplCopyWithImpl(_$ObservationQuantityImpl _value,
      $Res Function(_$ObservationQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$ObservationQuantityImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationQuantityImpl implements _ObservationQuantity {
  const _$ObservationQuantityImpl({this.value});

  factory _$ObservationQuantityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationQuantityImplFromJson(json);

  @override
  final num? value;

  @override
  String toString() {
    return 'ObservationQuantity(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationQuantityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationQuantityImplCopyWith<_$ObservationQuantityImpl> get copyWith =>
      __$$ObservationQuantityImplCopyWithImpl<_$ObservationQuantityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationQuantityImplToJson(
      this,
    );
  }
}

abstract class _ObservationQuantity implements ObservationQuantity {
  const factory _ObservationQuantity({final num? value}) =
      _$ObservationQuantityImpl;

  factory _ObservationQuantity.fromJson(Map<String, dynamic> json) =
      _$ObservationQuantityImpl.fromJson;

  @override
  num? get value;
  @override
  @JsonKey(ignore: true)
  _$$ObservationQuantityImplCopyWith<_$ObservationQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ObservationComponent _$ObservationComponentFromJson(Map<String, dynamic> json) {
  return _ObservationComponent.fromJson(json);
}

/// @nodoc
mixin _$ObservationComponent {
  ObservationValue? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObservationComponentCopyWith<ObservationComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObservationComponentCopyWith<$Res> {
  factory $ObservationComponentCopyWith(ObservationComponent value,
          $Res Function(ObservationComponent) then) =
      _$ObservationComponentCopyWithImpl<$Res, ObservationComponent>;
  @useResult
  $Res call({ObservationValue? value});

  $ObservationValueCopyWith<$Res>? get value;
}

/// @nodoc
class _$ObservationComponentCopyWithImpl<$Res,
        $Val extends ObservationComponent>
    implements $ObservationComponentCopyWith<$Res> {
  _$ObservationComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ObservationValue?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ObservationValueCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $ObservationValueCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ObservationComponentImplCopyWith<$Res>
    implements $ObservationComponentCopyWith<$Res> {
  factory _$$ObservationComponentImplCopyWith(_$ObservationComponentImpl value,
          $Res Function(_$ObservationComponentImpl) then) =
      __$$ObservationComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ObservationValue? value});

  @override
  $ObservationValueCopyWith<$Res>? get value;
}

/// @nodoc
class __$$ObservationComponentImplCopyWithImpl<$Res>
    extends _$ObservationComponentCopyWithImpl<$Res, _$ObservationComponentImpl>
    implements _$$ObservationComponentImplCopyWith<$Res> {
  __$$ObservationComponentImplCopyWithImpl(_$ObservationComponentImpl _value,
      $Res Function(_$ObservationComponentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$ObservationComponentImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ObservationValue?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObservationComponentImpl implements _ObservationComponent {
  const _$ObservationComponentImpl({this.value});

  factory _$ObservationComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObservationComponentImplFromJson(json);

  @override
  final ObservationValue? value;

  @override
  String toString() {
    return 'ObservationComponent(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObservationComponentImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObservationComponentImplCopyWith<_$ObservationComponentImpl>
      get copyWith =>
          __$$ObservationComponentImplCopyWithImpl<_$ObservationComponentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObservationComponentImplToJson(
      this,
    );
  }
}

abstract class _ObservationComponent implements ObservationComponent {
  const factory _ObservationComponent({final ObservationValue? value}) =
      _$ObservationComponentImpl;

  factory _ObservationComponent.fromJson(Map<String, dynamic> json) =
      _$ObservationComponentImpl.fromJson;

  @override
  ObservationValue? get value;
  @override
  @JsonKey(ignore: true)
  _$$ObservationComponentImplCopyWith<_$ObservationComponentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
