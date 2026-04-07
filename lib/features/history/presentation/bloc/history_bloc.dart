import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_app/features/history/data/models/health_data_model.dart';
import '../../data/repositories/health_repository_impl.dart';
part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HealthRepository repository;
  Map<HealthDataType, List<HealthDataModel>> _allData = {};

  HistoryBloc({required this.repository})
    : super(const HistoryState.initial()) {
    on<FetchHealthData>(_onFetchHealthData);
    on<RefreshHealthData>(_onRefreshHealthData);
    on<FilterByDateRange>(_onFilterByDateRange);
  }

  Future<void> _onFetchHealthData(
    FetchHealthData event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryState.loading());
    try {
      final healthData = await repository.fetchAllHealthData();
      _allData = healthData;
      emit(HistoryState.loaded(healthData: healthData));
    } catch (e) {
      emit(HistoryState.error(message: 'Failed to fetch health data: $e'));
    }
  }

  Future<void> _onRefreshHealthData(
    RefreshHealthData event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      final healthData = await repository.fetchAllHealthData();
      _allData = healthData;
      emit(HistoryState.loaded(healthData: healthData));
    } catch (e) {
      emit(HistoryState.error(message: 'Failed to refresh health data: $e'));
    }
  }

  void _onFilterByDateRange(
    FilterByDateRange event,
    Emitter<HistoryState> emit,
  ) {
    final start = event.range.start;
    final end = event.range.end;

    final filteredData = _allData.map((type, list) {
      final filteredList = list.where((d) {
        final ts = d.timestamp;
        final tsDate = DateTime(ts.year, ts.month, ts.day);
        final startDate = DateTime(start.year, start.month, start.day);
        final endDate = DateTime(end.year, end.month, end.day);

        return (tsDate.isAtSameMomentAs(startDate) ||
                tsDate.isAfter(startDate)) &&
            (tsDate.isAtSameMomentAs(endDate) || tsDate.isBefore(endDate));
      }).toList();
      return MapEntry(type, filteredList);
    });

    emit(HistoryState.loaded(healthData: filteredData));
  }
}
