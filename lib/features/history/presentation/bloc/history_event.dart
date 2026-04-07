part of 'history_bloc.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.fetchHealthData() = FetchHealthData;
  const factory HistoryEvent.refreshHealthData() = RefreshHealthData;
   const factory HistoryEvent.filterByDateRange(DateTimeRange range) = FilterByDateRange;
}
