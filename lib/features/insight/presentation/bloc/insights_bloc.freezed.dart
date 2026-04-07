// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insights_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InsightsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchObservations,
    required TResult Function(String chartType, String period) changePeriod,
    required TResult Function(
            String chartType, DateTimeRange<DateTime> dateRange)
        selectCustomDateRange,
    required TResult Function(int tabIndex) changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchObservations,
    TResult? Function(String chartType, String period)? changePeriod,
    TResult? Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult? Function(int tabIndex)? changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchObservations,
    TResult Function(String chartType, String period)? changePeriod,
    TResult Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult Function(int tabIndex)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchObservations value) fetchObservations,
    required TResult Function(ChangePeriod value) changePeriod,
    required TResult Function(SelectCustomDateRange value)
        selectCustomDateRange,
    required TResult Function(ChangeTab value) changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchObservations value)? fetchObservations,
    TResult? Function(ChangePeriod value)? changePeriod,
    TResult? Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult? Function(ChangeTab value)? changeTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchObservations value)? fetchObservations,
    TResult Function(ChangePeriod value)? changePeriod,
    TResult Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult Function(ChangeTab value)? changeTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightsEventCopyWith<$Res> {
  factory $InsightsEventCopyWith(
          InsightsEvent value, $Res Function(InsightsEvent) then) =
      _$InsightsEventCopyWithImpl<$Res, InsightsEvent>;
}

/// @nodoc
class _$InsightsEventCopyWithImpl<$Res, $Val extends InsightsEvent>
    implements $InsightsEventCopyWith<$Res> {
  _$InsightsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchObservationsImplCopyWith<$Res> {
  factory _$$FetchObservationsImplCopyWith(_$FetchObservationsImpl value,
          $Res Function(_$FetchObservationsImpl) then) =
      __$$FetchObservationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchObservationsImplCopyWithImpl<$Res>
    extends _$InsightsEventCopyWithImpl<$Res, _$FetchObservationsImpl>
    implements _$$FetchObservationsImplCopyWith<$Res> {
  __$$FetchObservationsImplCopyWithImpl(_$FetchObservationsImpl _value,
      $Res Function(_$FetchObservationsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchObservationsImpl implements FetchObservations {
  const _$FetchObservationsImpl();

  @override
  String toString() {
    return 'InsightsEvent.fetchObservations()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchObservationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchObservations,
    required TResult Function(String chartType, String period) changePeriod,
    required TResult Function(
            String chartType, DateTimeRange<DateTime> dateRange)
        selectCustomDateRange,
    required TResult Function(int tabIndex) changeTab,
  }) {
    return fetchObservations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchObservations,
    TResult? Function(String chartType, String period)? changePeriod,
    TResult? Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult? Function(int tabIndex)? changeTab,
  }) {
    return fetchObservations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchObservations,
    TResult Function(String chartType, String period)? changePeriod,
    TResult Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult Function(int tabIndex)? changeTab,
    required TResult orElse(),
  }) {
    if (fetchObservations != null) {
      return fetchObservations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchObservations value) fetchObservations,
    required TResult Function(ChangePeriod value) changePeriod,
    required TResult Function(SelectCustomDateRange value)
        selectCustomDateRange,
    required TResult Function(ChangeTab value) changeTab,
  }) {
    return fetchObservations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchObservations value)? fetchObservations,
    TResult? Function(ChangePeriod value)? changePeriod,
    TResult? Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult? Function(ChangeTab value)? changeTab,
  }) {
    return fetchObservations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchObservations value)? fetchObservations,
    TResult Function(ChangePeriod value)? changePeriod,
    TResult Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult Function(ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (fetchObservations != null) {
      return fetchObservations(this);
    }
    return orElse();
  }
}

abstract class FetchObservations implements InsightsEvent {
  const factory FetchObservations() = _$FetchObservationsImpl;
}

/// @nodoc
abstract class _$$ChangePeriodImplCopyWith<$Res> {
  factory _$$ChangePeriodImplCopyWith(
          _$ChangePeriodImpl value, $Res Function(_$ChangePeriodImpl) then) =
      __$$ChangePeriodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String chartType, String period});
}

/// @nodoc
class __$$ChangePeriodImplCopyWithImpl<$Res>
    extends _$InsightsEventCopyWithImpl<$Res, _$ChangePeriodImpl>
    implements _$$ChangePeriodImplCopyWith<$Res> {
  __$$ChangePeriodImplCopyWithImpl(
      _$ChangePeriodImpl _value, $Res Function(_$ChangePeriodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartType = null,
    Object? period = null,
  }) {
    return _then(_$ChangePeriodImpl(
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePeriodImpl implements ChangePeriod {
  const _$ChangePeriodImpl({required this.chartType, required this.period});

  @override
  final String chartType;
  @override
  final String period;

  @override
  String toString() {
    return 'InsightsEvent.changePeriod(chartType: $chartType, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePeriodImpl &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chartType, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePeriodImplCopyWith<_$ChangePeriodImpl> get copyWith =>
      __$$ChangePeriodImplCopyWithImpl<_$ChangePeriodImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchObservations,
    required TResult Function(String chartType, String period) changePeriod,
    required TResult Function(
            String chartType, DateTimeRange<DateTime> dateRange)
        selectCustomDateRange,
    required TResult Function(int tabIndex) changeTab,
  }) {
    return changePeriod(chartType, period);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchObservations,
    TResult? Function(String chartType, String period)? changePeriod,
    TResult? Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult? Function(int tabIndex)? changeTab,
  }) {
    return changePeriod?.call(chartType, period);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchObservations,
    TResult Function(String chartType, String period)? changePeriod,
    TResult Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult Function(int tabIndex)? changeTab,
    required TResult orElse(),
  }) {
    if (changePeriod != null) {
      return changePeriod(chartType, period);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchObservations value) fetchObservations,
    required TResult Function(ChangePeriod value) changePeriod,
    required TResult Function(SelectCustomDateRange value)
        selectCustomDateRange,
    required TResult Function(ChangeTab value) changeTab,
  }) {
    return changePeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchObservations value)? fetchObservations,
    TResult? Function(ChangePeriod value)? changePeriod,
    TResult? Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult? Function(ChangeTab value)? changeTab,
  }) {
    return changePeriod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchObservations value)? fetchObservations,
    TResult Function(ChangePeriod value)? changePeriod,
    TResult Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult Function(ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (changePeriod != null) {
      return changePeriod(this);
    }
    return orElse();
  }
}

abstract class ChangePeriod implements InsightsEvent {
  const factory ChangePeriod(
      {required final String chartType,
      required final String period}) = _$ChangePeriodImpl;

  String get chartType;
  String get period;
  @JsonKey(ignore: true)
  _$$ChangePeriodImplCopyWith<_$ChangePeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCustomDateRangeImplCopyWith<$Res> {
  factory _$$SelectCustomDateRangeImplCopyWith(
          _$SelectCustomDateRangeImpl value,
          $Res Function(_$SelectCustomDateRangeImpl) then) =
      __$$SelectCustomDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String chartType, DateTimeRange<DateTime> dateRange});
}

/// @nodoc
class __$$SelectCustomDateRangeImplCopyWithImpl<$Res>
    extends _$InsightsEventCopyWithImpl<$Res, _$SelectCustomDateRangeImpl>
    implements _$$SelectCustomDateRangeImplCopyWith<$Res> {
  __$$SelectCustomDateRangeImplCopyWithImpl(_$SelectCustomDateRangeImpl _value,
      $Res Function(_$SelectCustomDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartType = null,
    Object? dateRange = null,
  }) {
    return _then(_$SelectCustomDateRangeImpl(
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as String,
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>,
    ));
  }
}

/// @nodoc

class _$SelectCustomDateRangeImpl implements SelectCustomDateRange {
  const _$SelectCustomDateRangeImpl(
      {required this.chartType, required this.dateRange});

  @override
  final String chartType;
  @override
  final DateTimeRange<DateTime> dateRange;

  @override
  String toString() {
    return 'InsightsEvent.selectCustomDateRange(chartType: $chartType, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCustomDateRangeImpl &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chartType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCustomDateRangeImplCopyWith<_$SelectCustomDateRangeImpl>
      get copyWith => __$$SelectCustomDateRangeImplCopyWithImpl<
          _$SelectCustomDateRangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchObservations,
    required TResult Function(String chartType, String period) changePeriod,
    required TResult Function(
            String chartType, DateTimeRange<DateTime> dateRange)
        selectCustomDateRange,
    required TResult Function(int tabIndex) changeTab,
  }) {
    return selectCustomDateRange(chartType, dateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchObservations,
    TResult? Function(String chartType, String period)? changePeriod,
    TResult? Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult? Function(int tabIndex)? changeTab,
  }) {
    return selectCustomDateRange?.call(chartType, dateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchObservations,
    TResult Function(String chartType, String period)? changePeriod,
    TResult Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult Function(int tabIndex)? changeTab,
    required TResult orElse(),
  }) {
    if (selectCustomDateRange != null) {
      return selectCustomDateRange(chartType, dateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchObservations value) fetchObservations,
    required TResult Function(ChangePeriod value) changePeriod,
    required TResult Function(SelectCustomDateRange value)
        selectCustomDateRange,
    required TResult Function(ChangeTab value) changeTab,
  }) {
    return selectCustomDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchObservations value)? fetchObservations,
    TResult? Function(ChangePeriod value)? changePeriod,
    TResult? Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult? Function(ChangeTab value)? changeTab,
  }) {
    return selectCustomDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchObservations value)? fetchObservations,
    TResult Function(ChangePeriod value)? changePeriod,
    TResult Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult Function(ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (selectCustomDateRange != null) {
      return selectCustomDateRange(this);
    }
    return orElse();
  }
}

abstract class SelectCustomDateRange implements InsightsEvent {
  const factory SelectCustomDateRange(
          {required final String chartType,
          required final DateTimeRange<DateTime> dateRange}) =
      _$SelectCustomDateRangeImpl;

  String get chartType;
  DateTimeRange<DateTime> get dateRange;
  @JsonKey(ignore: true)
  _$$SelectCustomDateRangeImplCopyWith<_$SelectCustomDateRangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeTabImplCopyWith<$Res> {
  factory _$$ChangeTabImplCopyWith(
          _$ChangeTabImpl value, $Res Function(_$ChangeTabImpl) then) =
      __$$ChangeTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$$ChangeTabImplCopyWithImpl<$Res>
    extends _$InsightsEventCopyWithImpl<$Res, _$ChangeTabImpl>
    implements _$$ChangeTabImplCopyWith<$Res> {
  __$$ChangeTabImplCopyWithImpl(
      _$ChangeTabImpl _value, $Res Function(_$ChangeTabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_$ChangeTabImpl(
      null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeTabImpl implements ChangeTab {
  const _$ChangeTabImpl(this.tabIndex);

  @override
  final int tabIndex;

  @override
  String toString() {
    return 'InsightsEvent.changeTab(tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeTabImpl &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeTabImplCopyWith<_$ChangeTabImpl> get copyWith =>
      __$$ChangeTabImplCopyWithImpl<_$ChangeTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchObservations,
    required TResult Function(String chartType, String period) changePeriod,
    required TResult Function(
            String chartType, DateTimeRange<DateTime> dateRange)
        selectCustomDateRange,
    required TResult Function(int tabIndex) changeTab,
  }) {
    return changeTab(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchObservations,
    TResult? Function(String chartType, String period)? changePeriod,
    TResult? Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult? Function(int tabIndex)? changeTab,
  }) {
    return changeTab?.call(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchObservations,
    TResult Function(String chartType, String period)? changePeriod,
    TResult Function(String chartType, DateTimeRange<DateTime> dateRange)?
        selectCustomDateRange,
    TResult Function(int tabIndex)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(tabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchObservations value) fetchObservations,
    required TResult Function(ChangePeriod value) changePeriod,
    required TResult Function(SelectCustomDateRange value)
        selectCustomDateRange,
    required TResult Function(ChangeTab value) changeTab,
  }) {
    return changeTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchObservations value)? fetchObservations,
    TResult? Function(ChangePeriod value)? changePeriod,
    TResult? Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult? Function(ChangeTab value)? changeTab,
  }) {
    return changeTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchObservations value)? fetchObservations,
    TResult Function(ChangePeriod value)? changePeriod,
    TResult Function(SelectCustomDateRange value)? selectCustomDateRange,
    TResult Function(ChangeTab value)? changeTab,
    required TResult orElse(),
  }) {
    if (changeTab != null) {
      return changeTab(this);
    }
    return orElse();
  }
}

abstract class ChangeTab implements InsightsEvent {
  const factory ChangeTab(final int tabIndex) = _$ChangeTabImpl;

  int get tabIndex;
  @JsonKey(ignore: true)
  _$$ChangeTabImplCopyWith<_$ChangeTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InsightsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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
abstract class $InsightsStateCopyWith<$Res> {
  factory $InsightsStateCopyWith(
          InsightsState value, $Res Function(InsightsState) then) =
      _$InsightsStateCopyWithImpl<$Res, InsightsState>;
}

/// @nodoc
class _$InsightsStateCopyWithImpl<$Res, $Val extends InsightsState>
    implements $InsightsStateCopyWith<$Res> {
  _$InsightsStateCopyWithImpl(this._value, this._then);

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
    extends _$InsightsStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'InsightsState.initial()';
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
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)
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
    TResult? Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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
    TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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

abstract class _Initial implements InsightsState {
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
    extends _$InsightsStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'InsightsState.loading()';
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
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)
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
    TResult? Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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
    TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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

abstract class _Loading implements InsightsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Observation> observations,
      List<HealthRecord> healthRecords,
      Set<String> averagedDates,
      int selectedTab,
      String selectedPeriodBloodPressure,
      String selectedPeriodPulse,
      String selectedPeriodOxygen,
      String selectedPeriodBloodSugar,
      String selectedPeriodBodyWeight,
      DateTimeRange<DateTime>? customDateRangeBloodPressure,
      DateTimeRange<DateTime>? customDateRangePulse,
      DateTimeRange<DateTime>? customDateRangeOxygen,
      DateTimeRange<DateTime>? customDateRangeBloodSugar,
      DateTimeRange<DateTime>? customDateRangeBodyWeight});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$InsightsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? observations = null,
    Object? healthRecords = null,
    Object? averagedDates = null,
    Object? selectedTab = null,
    Object? selectedPeriodBloodPressure = null,
    Object? selectedPeriodPulse = null,
    Object? selectedPeriodOxygen = null,
    Object? selectedPeriodBloodSugar = null,
    Object? selectedPeriodBodyWeight = null,
    Object? customDateRangeBloodPressure = freezed,
    Object? customDateRangePulse = freezed,
    Object? customDateRangeOxygen = freezed,
    Object? customDateRangeBloodSugar = freezed,
    Object? customDateRangeBodyWeight = freezed,
  }) {
    return _then(_$LoadedImpl(
      observations: null == observations
          ? _value._observations
          : observations // ignore: cast_nullable_to_non_nullable
              as List<Observation>,
      healthRecords: null == healthRecords
          ? _value._healthRecords
          : healthRecords // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
      averagedDates: null == averagedDates
          ? _value._averagedDates
          : averagedDates // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedTab: null == selectedTab
          ? _value.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPeriodBloodPressure: null == selectedPeriodBloodPressure
          ? _value.selectedPeriodBloodPressure
          : selectedPeriodBloodPressure // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriodPulse: null == selectedPeriodPulse
          ? _value.selectedPeriodPulse
          : selectedPeriodPulse // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriodOxygen: null == selectedPeriodOxygen
          ? _value.selectedPeriodOxygen
          : selectedPeriodOxygen // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriodBloodSugar: null == selectedPeriodBloodSugar
          ? _value.selectedPeriodBloodSugar
          : selectedPeriodBloodSugar // ignore: cast_nullable_to_non_nullable
              as String,
      selectedPeriodBodyWeight: null == selectedPeriodBodyWeight
          ? _value.selectedPeriodBodyWeight
          : selectedPeriodBodyWeight // ignore: cast_nullable_to_non_nullable
              as String,
      customDateRangeBloodPressure: freezed == customDateRangeBloodPressure
          ? _value.customDateRangeBloodPressure
          : customDateRangeBloodPressure // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>?,
      customDateRangePulse: freezed == customDateRangePulse
          ? _value.customDateRangePulse
          : customDateRangePulse // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>?,
      customDateRangeOxygen: freezed == customDateRangeOxygen
          ? _value.customDateRangeOxygen
          : customDateRangeOxygen // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>?,
      customDateRangeBloodSugar: freezed == customDateRangeBloodSugar
          ? _value.customDateRangeBloodSugar
          : customDateRangeBloodSugar // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>?,
      customDateRangeBodyWeight: freezed == customDateRangeBodyWeight
          ? _value.customDateRangeBodyWeight
          : customDateRangeBodyWeight // ignore: cast_nullable_to_non_nullable
              as DateTimeRange<DateTime>?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<Observation> observations,
      required final List<HealthRecord> healthRecords,
      final Set<String> averagedDates = const {},
      this.selectedTab = 0,
      this.selectedPeriodBloodPressure = 'All',
      this.selectedPeriodPulse = 'All',
      this.selectedPeriodOxygen = 'All',
      this.selectedPeriodBloodSugar = 'All',
      this.selectedPeriodBodyWeight = 'All',
      this.customDateRangeBloodPressure,
      this.customDateRangePulse,
      this.customDateRangeOxygen,
      this.customDateRangeBloodSugar,
      this.customDateRangeBodyWeight})
      : _observations = observations,
        _healthRecords = healthRecords,
        _averagedDates = averagedDates;

  final List<Observation> _observations;
  @override
  List<Observation> get observations {
    if (_observations is EqualUnmodifiableListView) return _observations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_observations);
  }

  final List<HealthRecord> _healthRecords;
  @override
  List<HealthRecord> get healthRecords {
    if (_healthRecords is EqualUnmodifiableListView) return _healthRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_healthRecords);
  }

  final Set<String> _averagedDates;
  @override
  @JsonKey()
  Set<String> get averagedDates {
    if (_averagedDates is EqualUnmodifiableSetView) return _averagedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_averagedDates);
  }

  @override
  @JsonKey()
  final int selectedTab;
  @override
  @JsonKey()
  final String selectedPeriodBloodPressure;
  @override
  @JsonKey()
  final String selectedPeriodPulse;
  @override
  @JsonKey()
  final String selectedPeriodOxygen;
  @override
  @JsonKey()
  final String selectedPeriodBloodSugar;
  @override
  @JsonKey()
  final String selectedPeriodBodyWeight;
  @override
  final DateTimeRange<DateTime>? customDateRangeBloodPressure;
  @override
  final DateTimeRange<DateTime>? customDateRangePulse;
  @override
  final DateTimeRange<DateTime>? customDateRangeOxygen;
  @override
  final DateTimeRange<DateTime>? customDateRangeBloodSugar;
  @override
  final DateTimeRange<DateTime>? customDateRangeBodyWeight;

  @override
  String toString() {
    return 'InsightsState.loaded(observations: $observations, healthRecords: $healthRecords, averagedDates: $averagedDates, selectedTab: $selectedTab, selectedPeriodBloodPressure: $selectedPeriodBloodPressure, selectedPeriodPulse: $selectedPeriodPulse, selectedPeriodOxygen: $selectedPeriodOxygen, selectedPeriodBloodSugar: $selectedPeriodBloodSugar, selectedPeriodBodyWeight: $selectedPeriodBodyWeight, customDateRangeBloodPressure: $customDateRangeBloodPressure, customDateRangePulse: $customDateRangePulse, customDateRangeOxygen: $customDateRangeOxygen, customDateRangeBloodSugar: $customDateRangeBloodSugar, customDateRangeBodyWeight: $customDateRangeBodyWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._observations, _observations) &&
            const DeepCollectionEquality()
                .equals(other._healthRecords, _healthRecords) &&
            const DeepCollectionEquality()
                .equals(other._averagedDates, _averagedDates) &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.selectedPeriodBloodPressure,
                    selectedPeriodBloodPressure) ||
                other.selectedPeriodBloodPressure ==
                    selectedPeriodBloodPressure) &&
            (identical(other.selectedPeriodPulse, selectedPeriodPulse) ||
                other.selectedPeriodPulse == selectedPeriodPulse) &&
            (identical(other.selectedPeriodOxygen, selectedPeriodOxygen) ||
                other.selectedPeriodOxygen == selectedPeriodOxygen) &&
            (identical(other.selectedPeriodBloodSugar, selectedPeriodBloodSugar) ||
                other.selectedPeriodBloodSugar == selectedPeriodBloodSugar) &&
            (identical(
                    other.selectedPeriodBodyWeight, selectedPeriodBodyWeight) ||
                other.selectedPeriodBodyWeight == selectedPeriodBodyWeight) &&
            (identical(other.customDateRangeBloodPressure,
                    customDateRangeBloodPressure) ||
                other.customDateRangeBloodPressure ==
                    customDateRangeBloodPressure) &&
            (identical(other.customDateRangePulse, customDateRangePulse) ||
                other.customDateRangePulse == customDateRangePulse) &&
            (identical(other.customDateRangeOxygen, customDateRangeOxygen) ||
                other.customDateRangeOxygen == customDateRangeOxygen) &&
            (identical(other.customDateRangeBloodSugar,
                    customDateRangeBloodSugar) ||
                other.customDateRangeBloodSugar == customDateRangeBloodSugar) &&
            (identical(
                    other.customDateRangeBodyWeight, customDateRangeBodyWeight) ||
                other.customDateRangeBodyWeight == customDateRangeBodyWeight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_observations),
      const DeepCollectionEquality().hash(_healthRecords),
      const DeepCollectionEquality().hash(_averagedDates),
      selectedTab,
      selectedPeriodBloodPressure,
      selectedPeriodPulse,
      selectedPeriodOxygen,
      selectedPeriodBloodSugar,
      selectedPeriodBodyWeight,
      customDateRangeBloodPressure,
      customDateRangePulse,
      customDateRangeOxygen,
      customDateRangeBloodSugar,
      customDateRangeBodyWeight);

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
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        observations,
        healthRecords,
        averagedDates,
        selectedTab,
        selectedPeriodBloodPressure,
        selectedPeriodPulse,
        selectedPeriodOxygen,
        selectedPeriodBloodSugar,
        selectedPeriodBodyWeight,
        customDateRangeBloodPressure,
        customDateRangePulse,
        customDateRangeOxygen,
        customDateRangeBloodSugar,
        customDateRangeBodyWeight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        observations,
        healthRecords,
        averagedDates,
        selectedTab,
        selectedPeriodBloodPressure,
        selectedPeriodPulse,
        selectedPeriodOxygen,
        selectedPeriodBloodSugar,
        selectedPeriodBodyWeight,
        customDateRangeBloodPressure,
        customDateRangePulse,
        customDateRangeOxygen,
        customDateRangeBloodSugar,
        customDateRangeBodyWeight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          observations,
          healthRecords,
          averagedDates,
          selectedTab,
          selectedPeriodBloodPressure,
          selectedPeriodPulse,
          selectedPeriodOxygen,
          selectedPeriodBloodSugar,
          selectedPeriodBodyWeight,
          customDateRangeBloodPressure,
          customDateRangePulse,
          customDateRangeOxygen,
          customDateRangeBloodSugar,
          customDateRangeBodyWeight);
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

abstract class _Loaded implements InsightsState {
  const factory _Loaded(
      {required final List<Observation> observations,
      required final List<HealthRecord> healthRecords,
      final Set<String> averagedDates,
      final int selectedTab,
      final String selectedPeriodBloodPressure,
      final String selectedPeriodPulse,
      final String selectedPeriodOxygen,
      final String selectedPeriodBloodSugar,
      final String selectedPeriodBodyWeight,
      final DateTimeRange<DateTime>? customDateRangeBloodPressure,
      final DateTimeRange<DateTime>? customDateRangePulse,
      final DateTimeRange<DateTime>? customDateRangeOxygen,
      final DateTimeRange<DateTime>? customDateRangeBloodSugar,
      final DateTimeRange<DateTime>? customDateRangeBodyWeight}) = _$LoadedImpl;

  List<Observation> get observations;
  List<HealthRecord> get healthRecords;
  Set<String> get averagedDates;
  int get selectedTab;
  String get selectedPeriodBloodPressure;
  String get selectedPeriodPulse;
  String get selectedPeriodOxygen;
  String get selectedPeriodBloodSugar;
  String get selectedPeriodBodyWeight;
  DateTimeRange<DateTime>? get customDateRangeBloodPressure;
  DateTimeRange<DateTime>? get customDateRangePulse;
  DateTimeRange<DateTime>? get customDateRangeOxygen;
  DateTimeRange<DateTime>? get customDateRangeBloodSugar;
  DateTimeRange<DateTime>? get customDateRangeBodyWeight;
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
    extends _$InsightsStateCopyWithImpl<$Res, _$ErrorImpl>
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
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'InsightsState.error(message: $message)';
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
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)
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
    TResult? Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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
    TResult Function(
            List<Observation> observations,
            List<HealthRecord> healthRecords,
            Set<String> averagedDates,
            int selectedTab,
            String selectedPeriodBloodPressure,
            String selectedPeriodPulse,
            String selectedPeriodOxygen,
            String selectedPeriodBloodSugar,
            String selectedPeriodBodyWeight,
            DateTimeRange<DateTime>? customDateRangeBloodPressure,
            DateTimeRange<DateTime>? customDateRangePulse,
            DateTimeRange<DateTime>? customDateRangeOxygen,
            DateTimeRange<DateTime>? customDateRangeBloodSugar,
            DateTimeRange<DateTime>? customDateRangeBodyWeight)?
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

abstract class _Error implements InsightsState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
