part of 'insights_bloc.dart';

@freezed
class InsightsEvent with _$InsightsEvent {
  const factory InsightsEvent.fetchObservations() = FetchObservations;
  
  const factory InsightsEvent.changePeriod({
    required String chartType,
    required String period,
  }) = ChangePeriod;
  
  const factory InsightsEvent.selectCustomDateRange({
    required String chartType,
    required DateTimeRange dateRange,
  }) = SelectCustomDateRange;
  
  const factory InsightsEvent.changeTab(int tabIndex) = ChangeTab;
}