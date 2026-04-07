part of 'insights_bloc.dart';

@freezed
class InsightsState with _$InsightsState {
  const factory InsightsState.initial() = _Initial;
  
  const factory InsightsState.loading() = _Loading;
  
  const factory InsightsState.loaded({
    required List<Observation> observations,
    required List<HealthRecord> healthRecords,
    @Default({}) Set<String> averagedDates,
    @Default(0) int selectedTab,
    @Default('All') String selectedPeriodBloodPressure,
    @Default('All') String selectedPeriodPulse,
    @Default('All') String selectedPeriodOxygen,
    @Default('All') String selectedPeriodBloodSugar,
    @Default('All') String selectedPeriodBodyWeight,
    DateTimeRange? customDateRangeBloodPressure,
    DateTimeRange? customDateRangePulse,
    DateTimeRange? customDateRangeOxygen,
    DateTimeRange? customDateRangeBloodSugar,
    DateTimeRange? customDateRangeBodyWeight, 
  }) = _Loaded;
  
  const factory InsightsState.error(String message) = _Error;
}
