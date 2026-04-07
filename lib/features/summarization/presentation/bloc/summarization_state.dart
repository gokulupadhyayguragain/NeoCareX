import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/summarization_model.dart';

part 'summarization_state.freezed.dart';

@freezed
class SummarizationState with _$SummarizationState {
  const factory SummarizationState.initial() = _Initial;
  const factory SummarizationState.loading() = _Loading;
  const factory SummarizationState.loaded(PaginatedSummarization data) = _Loaded;
  const factory SummarizationState.error(String message) = _Error;
  const factory SummarizationState.updated(PaginatedSummarization data) = _Updated;
  const factory SummarizationState.loadingMore(PaginatedSummarization data) = _LoadingMore;
}
