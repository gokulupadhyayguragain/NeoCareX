// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summarization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthMetric _$HealthMetricFromJson(Map<String, dynamic> json) {
  return _HealthMetric.fromJson(json);
}

/// @nodoc
mixin _$HealthMetric {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get normalRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthMetricCopyWith<HealthMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthMetricCopyWith<$Res> {
  factory $HealthMetricCopyWith(
          HealthMetric value, $Res Function(HealthMetric) then) =
      _$HealthMetricCopyWithImpl<$Res, HealthMetric>;
  @useResult
  $Res call(
      {String label,
      String value,
      String status,
      String unit,
      String? normalRange});
}

/// @nodoc
class _$HealthMetricCopyWithImpl<$Res, $Val extends HealthMetric>
    implements $HealthMetricCopyWith<$Res> {
  _$HealthMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? status = null,
    Object? unit = null,
    Object? normalRange = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      normalRange: freezed == normalRange
          ? _value.normalRange
          : normalRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthMetricImplCopyWith<$Res>
    implements $HealthMetricCopyWith<$Res> {
  factory _$$HealthMetricImplCopyWith(
          _$HealthMetricImpl value, $Res Function(_$HealthMetricImpl) then) =
      __$$HealthMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String value,
      String status,
      String unit,
      String? normalRange});
}

/// @nodoc
class __$$HealthMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricCopyWithImpl<$Res, _$HealthMetricImpl>
    implements _$$HealthMetricImplCopyWith<$Res> {
  __$$HealthMetricImplCopyWithImpl(
      _$HealthMetricImpl _value, $Res Function(_$HealthMetricImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? status = null,
    Object? unit = null,
    Object? normalRange = freezed,
  }) {
    return _then(_$HealthMetricImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      normalRange: freezed == normalRange
          ? _value.normalRange
          : normalRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthMetricImpl implements _HealthMetric {
  const _$HealthMetricImpl(
      {required this.label,
      required this.value,
      required this.status,
      required this.unit,
      this.normalRange});

  factory _$HealthMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthMetricImplFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  final String status;
  @override
  final String unit;
  @override
  final String? normalRange;

  @override
  String toString() {
    return 'HealthMetric(label: $label, value: $value, status: $status, unit: $unit, normalRange: $normalRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthMetricImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.normalRange, normalRange) ||
                other.normalRange == normalRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, value, status, unit, normalRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      __$$HealthMetricImplCopyWithImpl<_$HealthMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthMetricImplToJson(
      this,
    );
  }
}

abstract class _HealthMetric implements HealthMetric {
  const factory _HealthMetric(
      {required final String label,
      required final String value,
      required final String status,
      required final String unit,
      final String? normalRange}) = _$HealthMetricImpl;

  factory _HealthMetric.fromJson(Map<String, dynamic> json) =
      _$HealthMetricImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  String get status;
  @override
  String get unit;
  @override
  String? get normalRange;
  @override
  @JsonKey(ignore: true)
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  bool get hasPreviousPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(_$PaginationMetaImpl value,
          $Res Function(_$PaginationMetaImpl) then) =
      __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int totalItems,
      int itemsPerPage,
      bool hasNextPage,
      bool hasPreviousPage});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
      _$PaginationMetaImpl _value, $Res Function(_$PaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalItems = null,
    Object? itemsPerPage = null,
    Object? hasNextPage = null,
    Object? hasPreviousPage = null,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPreviousPage: null == hasPreviousPage
          ? _value.hasPreviousPage
          : hasPreviousPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems,
      required this.itemsPerPage,
      required this.hasNextPage,
      required this.hasPreviousPage});

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPages;
  @override
  final int totalItems;
  @override
  final int itemsPerPage;
  @override
  final bool hasNextPage;
  @override
  final bool hasPreviousPage;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, itemsPerPage: $itemsPerPage, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.hasPreviousPage, hasPreviousPage) ||
                other.hasPreviousPage == hasPreviousPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPages,
      totalItems, itemsPerPage, hasNextPage, hasPreviousPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {required final int currentPage,
      required final int totalPages,
      required final int totalItems,
      required final int itemsPerPage,
      required final bool hasNextPage,
      required final bool hasPreviousPage}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get totalItems;
  @override
  int get itemsPerPage;
  @override
  bool get hasNextPage;
  @override
  bool get hasPreviousPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SummarizationData _$SummarizationDataFromJson(Map<String, dynamic> json) {
  return _SummarizationData.fromJson(json);
}

/// @nodoc
mixin _$SummarizationData {
  int get id => throw _privateConstructorUsedError;
  String get patientId => throw _privateConstructorUsedError;
  String get textSummarization => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  double get riskConfidence => throw _privateConstructorUsedError;
  List<HealthMetric> get metrics => throw _privateConstructorUsedError;
  bool get hasAnomaly => throw _privateConstructorUsedError;
  String get assessmentType => throw _privateConstructorUsedError;
  String get riskStatus => throw _privateConstructorUsedError;
  String get riskLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummarizationDataCopyWith<SummarizationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummarizationDataCopyWith<$Res> {
  factory $SummarizationDataCopyWith(
          SummarizationData value, $Res Function(SummarizationData) then) =
      _$SummarizationDataCopyWithImpl<$Res, SummarizationData>;
  @useResult
  $Res call(
      {int id,
      String patientId,
      String textSummarization,
      DateTime createdAt,
      double riskConfidence,
      List<HealthMetric> metrics,
      bool hasAnomaly,
      String assessmentType,
      String riskStatus,
      String riskLevel});
}

/// @nodoc
class _$SummarizationDataCopyWithImpl<$Res, $Val extends SummarizationData>
    implements $SummarizationDataCopyWith<$Res> {
  _$SummarizationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? textSummarization = null,
    Object? createdAt = null,
    Object? riskConfidence = null,
    Object? metrics = null,
    Object? hasAnomaly = null,
    Object? assessmentType = null,
    Object? riskStatus = null,
    Object? riskLevel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      textSummarization: null == textSummarization
          ? _value.textSummarization
          : textSummarization // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      riskConfidence: null == riskConfidence
          ? _value.riskConfidence
          : riskConfidence // ignore: cast_nullable_to_non_nullable
              as double,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<HealthMetric>,
      hasAnomaly: null == hasAnomaly
          ? _value.hasAnomaly
          : hasAnomaly // ignore: cast_nullable_to_non_nullable
              as bool,
      assessmentType: null == assessmentType
          ? _value.assessmentType
          : assessmentType // ignore: cast_nullable_to_non_nullable
              as String,
      riskStatus: null == riskStatus
          ? _value.riskStatus
          : riskStatus // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummarizationDataImplCopyWith<$Res>
    implements $SummarizationDataCopyWith<$Res> {
  factory _$$SummarizationDataImplCopyWith(_$SummarizationDataImpl value,
          $Res Function(_$SummarizationDataImpl) then) =
      __$$SummarizationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String patientId,
      String textSummarization,
      DateTime createdAt,
      double riskConfidence,
      List<HealthMetric> metrics,
      bool hasAnomaly,
      String assessmentType,
      String riskStatus,
      String riskLevel});
}

/// @nodoc
class __$$SummarizationDataImplCopyWithImpl<$Res>
    extends _$SummarizationDataCopyWithImpl<$Res, _$SummarizationDataImpl>
    implements _$$SummarizationDataImplCopyWith<$Res> {
  __$$SummarizationDataImplCopyWithImpl(_$SummarizationDataImpl _value,
      $Res Function(_$SummarizationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? patientId = null,
    Object? textSummarization = null,
    Object? createdAt = null,
    Object? riskConfidence = null,
    Object? metrics = null,
    Object? hasAnomaly = null,
    Object? assessmentType = null,
    Object? riskStatus = null,
    Object? riskLevel = null,
  }) {
    return _then(_$SummarizationDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      textSummarization: null == textSummarization
          ? _value.textSummarization
          : textSummarization // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      riskConfidence: null == riskConfidence
          ? _value.riskConfidence
          : riskConfidence // ignore: cast_nullable_to_non_nullable
              as double,
      metrics: null == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<HealthMetric>,
      hasAnomaly: null == hasAnomaly
          ? _value.hasAnomaly
          : hasAnomaly // ignore: cast_nullable_to_non_nullable
              as bool,
      assessmentType: null == assessmentType
          ? _value.assessmentType
          : assessmentType // ignore: cast_nullable_to_non_nullable
              as String,
      riskStatus: null == riskStatus
          ? _value.riskStatus
          : riskStatus // ignore: cast_nullable_to_non_nullable
              as String,
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummarizationDataImpl implements _SummarizationData {
  const _$SummarizationDataImpl(
      {required this.id,
      required this.patientId,
      required this.textSummarization,
      required this.createdAt,
      required this.riskConfidence,
      required final List<HealthMetric> metrics,
      required this.hasAnomaly,
      required this.assessmentType,
      required this.riskStatus,
      required this.riskLevel})
      : _metrics = metrics;

  factory _$SummarizationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummarizationDataImplFromJson(json);

  @override
  final int id;
  @override
  final String patientId;
  @override
  final String textSummarization;
  @override
  final DateTime createdAt;
  @override
  final double riskConfidence;
  final List<HealthMetric> _metrics;
  @override
  List<HealthMetric> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  @override
  final bool hasAnomaly;
  @override
  final String assessmentType;
  @override
  final String riskStatus;
  @override
  final String riskLevel;

  @override
  String toString() {
    return 'SummarizationData(id: $id, patientId: $patientId, textSummarization: $textSummarization, createdAt: $createdAt, riskConfidence: $riskConfidence, metrics: $metrics, hasAnomaly: $hasAnomaly, assessmentType: $assessmentType, riskStatus: $riskStatus, riskLevel: $riskLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummarizationDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.textSummarization, textSummarization) ||
                other.textSummarization == textSummarization) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.riskConfidence, riskConfidence) ||
                other.riskConfidence == riskConfidence) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            (identical(other.hasAnomaly, hasAnomaly) ||
                other.hasAnomaly == hasAnomaly) &&
            (identical(other.assessmentType, assessmentType) ||
                other.assessmentType == assessmentType) &&
            (identical(other.riskStatus, riskStatus) ||
                other.riskStatus == riskStatus) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      patientId,
      textSummarization,
      createdAt,
      riskConfidence,
      const DeepCollectionEquality().hash(_metrics),
      hasAnomaly,
      assessmentType,
      riskStatus,
      riskLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SummarizationDataImplCopyWith<_$SummarizationDataImpl> get copyWith =>
      __$$SummarizationDataImplCopyWithImpl<_$SummarizationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummarizationDataImplToJson(
      this,
    );
  }
}

abstract class _SummarizationData implements SummarizationData {
  const factory _SummarizationData(
      {required final int id,
      required final String patientId,
      required final String textSummarization,
      required final DateTime createdAt,
      required final double riskConfidence,
      required final List<HealthMetric> metrics,
      required final bool hasAnomaly,
      required final String assessmentType,
      required final String riskStatus,
      required final String riskLevel}) = _$SummarizationDataImpl;

  factory _SummarizationData.fromJson(Map<String, dynamic> json) =
      _$SummarizationDataImpl.fromJson;

  @override
  int get id;
  @override
  String get patientId;
  @override
  String get textSummarization;
  @override
  DateTime get createdAt;
  @override
  double get riskConfidence;
  @override
  List<HealthMetric> get metrics;
  @override
  bool get hasAnomaly;
  @override
  String get assessmentType;
  @override
  String get riskStatus;
  @override
  String get riskLevel;
  @override
  @JsonKey(ignore: true)
  _$$SummarizationDataImplCopyWith<_$SummarizationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedSummarization _$PaginatedSummarizationFromJson(
    Map<String, dynamic> json) {
  return _PaginatedSummarization.fromJson(json);
}

/// @nodoc
mixin _$PaginatedSummarization {
  List<SummarizationData> get summaries => throw _privateConstructorUsedError;
  PaginationMeta get paginationMeta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedSummarizationCopyWith<PaginatedSummarization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedSummarizationCopyWith<$Res> {
  factory $PaginatedSummarizationCopyWith(PaginatedSummarization value,
          $Res Function(PaginatedSummarization) then) =
      _$PaginatedSummarizationCopyWithImpl<$Res, PaginatedSummarization>;
  @useResult
  $Res call({List<SummarizationData> summaries, PaginationMeta paginationMeta});

  $PaginationMetaCopyWith<$Res> get paginationMeta;
}

/// @nodoc
class _$PaginatedSummarizationCopyWithImpl<$Res,
        $Val extends PaginatedSummarization>
    implements $PaginatedSummarizationCopyWith<$Res> {
  _$PaginatedSummarizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaries = null,
    Object? paginationMeta = null,
  }) {
    return _then(_value.copyWith(
      summaries: null == summaries
          ? _value.summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummarizationData>,
      paginationMeta: null == paginationMeta
          ? _value.paginationMeta
          : paginationMeta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get paginationMeta {
    return $PaginationMetaCopyWith<$Res>(_value.paginationMeta, (value) {
      return _then(_value.copyWith(paginationMeta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedSummarizationImplCopyWith<$Res>
    implements $PaginatedSummarizationCopyWith<$Res> {
  factory _$$PaginatedSummarizationImplCopyWith(
          _$PaginatedSummarizationImpl value,
          $Res Function(_$PaginatedSummarizationImpl) then) =
      __$$PaginatedSummarizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SummarizationData> summaries, PaginationMeta paginationMeta});

  @override
  $PaginationMetaCopyWith<$Res> get paginationMeta;
}

/// @nodoc
class __$$PaginatedSummarizationImplCopyWithImpl<$Res>
    extends _$PaginatedSummarizationCopyWithImpl<$Res,
        _$PaginatedSummarizationImpl>
    implements _$$PaginatedSummarizationImplCopyWith<$Res> {
  __$$PaginatedSummarizationImplCopyWithImpl(
      _$PaginatedSummarizationImpl _value,
      $Res Function(_$PaginatedSummarizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summaries = null,
    Object? paginationMeta = null,
  }) {
    return _then(_$PaginatedSummarizationImpl(
      summaries: null == summaries
          ? _value._summaries
          : summaries // ignore: cast_nullable_to_non_nullable
              as List<SummarizationData>,
      paginationMeta: null == paginationMeta
          ? _value.paginationMeta
          : paginationMeta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedSummarizationImpl implements _PaginatedSummarization {
  const _$PaginatedSummarizationImpl(
      {required final List<SummarizationData> summaries,
      required this.paginationMeta})
      : _summaries = summaries;

  factory _$PaginatedSummarizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedSummarizationImplFromJson(json);

  final List<SummarizationData> _summaries;
  @override
  List<SummarizationData> get summaries {
    if (_summaries is EqualUnmodifiableListView) return _summaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_summaries);
  }

  @override
  final PaginationMeta paginationMeta;

  @override
  String toString() {
    return 'PaginatedSummarization(summaries: $summaries, paginationMeta: $paginationMeta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedSummarizationImpl &&
            const DeepCollectionEquality()
                .equals(other._summaries, _summaries) &&
            (identical(other.paginationMeta, paginationMeta) ||
                other.paginationMeta == paginationMeta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_summaries), paginationMeta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedSummarizationImplCopyWith<_$PaginatedSummarizationImpl>
      get copyWith => __$$PaginatedSummarizationImplCopyWithImpl<
          _$PaginatedSummarizationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedSummarizationImplToJson(
      this,
    );
  }
}

abstract class _PaginatedSummarization implements PaginatedSummarization {
  const factory _PaginatedSummarization(
          {required final List<SummarizationData> summaries,
          required final PaginationMeta paginationMeta}) =
      _$PaginatedSummarizationImpl;

  factory _PaginatedSummarization.fromJson(Map<String, dynamic> json) =
      _$PaginatedSummarizationImpl.fromJson;

  @override
  List<SummarizationData> get summaries;
  @override
  PaginationMeta get paginationMeta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedSummarizationImplCopyWith<_$PaginatedSummarizationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
