
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summarization_model.freezed.dart';
part 'summarization_model.g.dart';

@freezed
class HealthMetric with _$HealthMetric {
  const factory HealthMetric({
    required String label,
    required String value,
    required String status,
    required String unit,
    String? normalRange,
  }) = _HealthMetric;

  factory HealthMetric.fromJson(Map<String, dynamic> json) =>
      _$HealthMetricFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int currentPage,
    required int totalPages,
    required int totalItems,
    required int itemsPerPage,
    required bool hasNextPage,
    required bool hasPreviousPage,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
class SummarizationData with _$SummarizationData {
  const factory SummarizationData({
    required int id,
    required String patientId,
    required String textSummarization,
    required DateTime createdAt,
    required double riskConfidence,
    required List<HealthMetric> metrics,
    required bool hasAnomaly,
    required String assessmentType,
    required String riskStatus,
    required String riskLevel,
  }) = _SummarizationData;

  factory SummarizationData.fromJson(Map<String, dynamic> json) =>
      _$SummarizationDataFromJson(json);
}

@freezed
class PaginatedSummarization with _$PaginatedSummarization {
  const factory PaginatedSummarization({
    required List<SummarizationData> summaries,
    required PaginationMeta paginationMeta,
  }) = _PaginatedSummarization;

  factory PaginatedSummarization.fromJson(Map<String, dynamic> json) =>
      _$PaginatedSummarizationFromJson(json);
}