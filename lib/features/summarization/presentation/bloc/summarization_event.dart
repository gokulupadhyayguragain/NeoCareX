// summarization_event.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/summarization_model.dart';

part 'summarization_event.freezed.dart';

@freezed
class SummarizationEvent with _$SummarizationEvent {
  const factory SummarizationEvent.fetchSummarization({
    @Default(1) int page,
    @Default(10) int limit,
  }) = FetchSummarization;

  const factory SummarizationEvent.onSummarizationUpdate({
    required SummarizationData summarizationData,
  }) = OnSummarizationUpdate;

  const factory SummarizationEvent.retryFetch() = RetryFetch;

  const factory SummarizationEvent.loadNextPage() = LoadNextPage;
  const factory SummarizationEvent.loadPreviousPage() = LoadPreviousPage;
  const factory SummarizationEvent.goToPage(int page) = GoToPage;
}