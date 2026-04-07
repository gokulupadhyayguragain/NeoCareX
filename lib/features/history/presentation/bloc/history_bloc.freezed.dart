// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHealthData,
    required TResult Function() refreshHealthData,
    required TResult Function(DateTimeRange<DateTime> range) filterByDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHealthData,
    TResult? Function()? refreshHealthData,
    TResult? Function(DateTimeRange<DateTime> range)? filterByDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHealthData,
    TResult Function()? refreshHealthData,
    TResult Function(DateTimeRange<DateTime> range)? filterByDateRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchHealthData value) fetchHealthData,
    required TResult Function(RefreshHealthData value) refreshHealthData,
    required TResult Function(FilterByDateRange value) filterByDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchHealthData value)? fetchHealthData,
    TResult? Function(RefreshHealthData value)? refreshHealthData,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchHealthData value)? fetchHealthData,
    TResult Function(RefreshHealthData value)? refreshHealthData,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res, HistoryEvent>;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res, $Val extends HistoryEvent>
    implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchHealthDataImplCopyWith<$Res> {
  factory _$$FetchHealthDataImplCopyWith(_$FetchHealthDataImpl value,
          $Res Function(_$FetchHealthDataImpl) then) =
      __$$FetchHealthDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchHealthDataImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$FetchHealthDataImpl>
    implements _$$FetchHealthDataImplCopyWith<$Res> {
  __$$FetchHealthDataImplCopyWithImpl(
      _$FetchHealthDataImpl _value, $Res Function(_$FetchHealthDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchHealthDataImpl implements FetchHealthData {
  const _$FetchHealthDataImpl();

  @override
  String toString() {
    return 'HistoryEvent.fetchHealthData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchHealthDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHealthData,
    required TResult Function() refreshHealthData,
    required TResult Function(DateTimeRange<DateTime> range) filterByDateRange,
  }) {
    return fetchHealthData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHealthData,
    TResult? Function()? refreshHealthData,
    TResult? Function(DateTimeRange<DateTime> range)? filterByDateRange,
  }) {
    return fetchHealthData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHealthData,
    TResult Function()? refreshHealthData,
    TResult Function(DateTimeRange<DateTime> range)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (fetchHealthData != null) {
      return fetchHealthData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchHealthData value) fetchHealthData,
    required TResult Function(RefreshHealthData value) refreshHealthData,
    required TResult Function(FilterByDateRange value) filterByDateRange,
  }) {
    return fetchHealthData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchHealthData value)? fetchHealthData,
    TResult? Function(RefreshHealthData value)? refreshHealthData,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
  }) {
    return fetchHealthData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchHealthData value)? fetchHealthData,
    TResult Function(RefreshHealthData value)? refreshHealthData,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (fetchHealthData != null) {
      return fetchHealthData(this);
    }
    return orElse();
  }
}

abstract class FetchHealthData implements HistoryEvent {
  const factory FetchHealthData() = _$FetchHealthDataImpl;
}

/// @nodoc
abstract class _$$RefreshHealthDataImplCopyWith<$Res> {
  factory _$$RefreshHealthDataImplCopyWith(_$RefreshHealthDataImpl value,
          $Res Function(_$RefreshHealthDataImpl) then) =
      __$$RefreshHealthDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshHealthDataImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$RefreshHealthDataImpl>
    implements _$$RefreshHealthDataImplCopyWith<$Res> {
  __$$RefreshHealthDataImplCopyWithImpl(_$RefreshHealthDataImpl _value,
      $Res Function(_$RefreshHealthDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshHealthDataImpl implements RefreshHealthData {
  const _$RefreshHealthDataImpl();

  @override
  String toString() {
    return 'HistoryEvent.refreshHealthData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshHealthDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHealthData,
    required TResult Function() refreshHealthData,
    required TResult Function(DateTimeRange<DateTime> range) filterByDateRange,
  }) {
    return refreshHealthData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHealthData,
    TResult? Function()? refreshHealthData,
    TResult? Function(DateTimeRange<DateTime> range)? filterByDateRange,
  }) {
    return refreshHealthData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHealthData,
    TResult Function()? refreshHealthData,
    TResult Function(DateTimeRange<DateTime> range)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (refreshHealthData != null) {
      return refreshHealthData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchHealthData value) fetchHealthData,
    required TResult Function(RefreshHealthData value) refreshHealthData,
    required TResult Function(FilterByDateRange value) filterByDateRange,
  }) {
    return refreshHealthData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchHealthData value)? fetchHealthData,
    TResult? Function(RefreshHealthData value)? refreshHealthData,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
  }) {
    return refreshHealthData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchHealthData value)? fetchHealthData,
    TResult Function(RefreshHealthData value)? refreshHealthData,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (refreshHealthData != null) {
      return refreshHealthData(this);
    }
    return orElse();
  }
}

abstract class RefreshHealthData implements HistoryEvent {
  const factory RefreshHealthData() = _$RefreshHealthDataImpl;
}

/// @nodoc
abstract class _$$FilterByDateRangeImplCopyWith<$Res> {
  factory _$$FilterByDateRangeImplCopyWith(_$FilterByDateRangeImpl value,
          $Res Function(_$FilterByDateRangeImpl) then) =
      __$$FilterByDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange<DateTime> range});
}

/// @nodoc
class __$$FilterByDateRangeImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$FilterByDateRangeImpl>
    implements _$$FilterByDateRangeImplCopyWith<$Res> {
  __$$FilterByDateRangeImplCopyWithImpl(_$FilterByDateRangeImpl _value,
      $Res Function(_$FilterByDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$FilterByDateRangeImpl(
      null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>,
    ));
  }
}

/// @nodoc

class _$FilterByDateRangeImpl implements FilterByDateRange {
  const _$FilterByDateRangeImpl(this.range);

  @override
  final DateTimeRange<DateTime> range;

  @override
  String toString() {
    return 'HistoryEvent.filterByDateRange(range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByDateRangeImpl &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByDateRangeImplCopyWith<_$FilterByDateRangeImpl> get copyWith =>
      __$$FilterByDateRangeImplCopyWithImpl<_$FilterByDateRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchHealthData,
    required TResult Function() refreshHealthData,
    required TResult Function(DateTimeRange<DateTime> range) filterByDateRange,
  }) {
    return filterByDateRange(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchHealthData,
    TResult? Function()? refreshHealthData,
    TResult? Function(DateTimeRange<DateTime> range)? filterByDateRange,
  }) {
    return filterByDateRange?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchHealthData,
    TResult Function()? refreshHealthData,
    TResult Function(DateTimeRange<DateTime> range)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (filterByDateRange != null) {
      return filterByDateRange(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchHealthData value) fetchHealthData,
    required TResult Function(RefreshHealthData value) refreshHealthData,
    required TResult Function(FilterByDateRange value) filterByDateRange,
  }) {
    return filterByDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchHealthData value)? fetchHealthData,
    TResult? Function(RefreshHealthData value)? refreshHealthData,
    TResult? Function(FilterByDateRange value)? filterByDateRange,
  }) {
    return filterByDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchHealthData value)? fetchHealthData,
    TResult Function(RefreshHealthData value)? refreshHealthData,
    TResult Function(FilterByDateRange value)? filterByDateRange,
    required TResult orElse(),
  }) {
    if (filterByDateRange != null) {
      return filterByDateRange(this);
    }
    return orElse();
  }
}

abstract class FilterByDateRange implements HistoryEvent {
  const factory FilterByDateRange(final DateTimeRange<DateTime> range) =
      _$FilterByDateRangeImpl;

  DateTimeRange<DateTime> get range;
  @JsonKey(ignore: true)
  _$$FilterByDateRangeImplCopyWith<_$FilterByDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<HealthDataType, List<HealthDataModel>> healthData)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HistoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<HealthDataType, List<HealthDataModel>> healthData)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HistoryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<HealthDataType, List<HealthDataModel>> healthData)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HistoryState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<HealthDataType, List<HealthDataModel>> healthData});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healthData = null,
  }) {
    return _then(_$LoadedImpl(
      healthData: null == healthData
          ? _value._healthData
          : healthData // ignore: cast_nullable_to_non_nullable
              as Map<HealthDataType, List<HealthDataModel>>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final Map<HealthDataType, List<HealthDataModel>> healthData})
      : _healthData = healthData;

  final Map<HealthDataType, List<HealthDataModel>> _healthData;
  @override
  Map<HealthDataType, List<HealthDataModel>> get healthData {
    if (_healthData is EqualUnmodifiableMapView) return _healthData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_healthData);
  }

  @override
  String toString() {
    return 'HistoryState.loaded(healthData: $healthData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._healthData, _healthData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_healthData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<HealthDataType, List<HealthDataModel>> healthData)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(healthData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(healthData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(healthData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HistoryState {
  const factory _Loaded(
      {required final Map<HealthDataType, List<HealthDataModel>>
          healthData}) = _$LoadedImpl;

  Map<HealthDataType, List<HealthDataModel>> get healthData;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'HistoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Map<HealthDataType, List<HealthDataModel>> healthData)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<HealthDataType, List<HealthDataModel>> healthData)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HistoryState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
