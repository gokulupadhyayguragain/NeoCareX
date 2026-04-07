// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summarization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthMetricImpl _$$HealthMetricImplFromJson(Map<String, dynamic> json) =>
    _$HealthMetricImpl(
      label: json['label'] as String,
      value: json['value'] as String,
      status: json['status'] as String,
      unit: json['unit'] as String,
      normalRange: json['normalRange'] as String?,
    );

Map<String, dynamic> _$$HealthMetricImplToJson(_$HealthMetricImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'status': instance.status,
      'unit': instance.unit,
      'normalRange': instance.normalRange,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };

_$SummarizationDataImpl _$$SummarizationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SummarizationDataImpl(
      id: (json['id'] as num).toInt(),
      patientId: json['patientId'] as String,
      textSummarization: json['textSummarization'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      riskConfidence: (json['riskConfidence'] as num).toDouble(),
      metrics: (json['metrics'] as List<dynamic>)
          .map((e) => HealthMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasAnomaly: json['hasAnomaly'] as bool,
      assessmentType: json['assessmentType'] as String,
      riskStatus: json['riskStatus'] as String,
      riskLevel: json['riskLevel'] as String,
    );

Map<String, dynamic> _$$SummarizationDataImplToJson(
        _$SummarizationDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'textSummarization': instance.textSummarization,
      'createdAt': instance.createdAt.toIso8601String(),
      'riskConfidence': instance.riskConfidence,
      'metrics': instance.metrics,
      'hasAnomaly': instance.hasAnomaly,
      'assessmentType': instance.assessmentType,
      'riskStatus': instance.riskStatus,
      'riskLevel': instance.riskLevel,
    };

_$PaginatedSummarizationImpl _$$PaginatedSummarizationImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedSummarizationImpl(
      summaries: (json['summaries'] as List<dynamic>)
          .map((e) => SummarizationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      paginationMeta: PaginationMeta.fromJson(
          json['paginationMeta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedSummarizationImplToJson(
        _$PaginatedSummarizationImpl instance) =>
    <String, dynamic>{
      'summaries': instance.summaries,
      'paginationMeta': instance.paginationMeta,
    };
