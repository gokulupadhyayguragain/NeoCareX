import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/summarization/data/models/summarization_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../data/services/summarization_service.dart';
import 'summarization_event.dart';
import 'summarization_state.dart';

class SummarizationBloc extends Bloc<SummarizationEvent, SummarizationState> {
  final SummarizationService _service;
  io.Socket? _socket;

  SummarizationBloc({required SummarizationService service, io.Socket? socket})
    : _service = service,
      _socket = socket,
      super(const SummarizationState.initial()) {
    on<FetchSummarization>(_onFetchSummarization);
    on<OnSummarizationUpdate>(_onSummarizationUpdate);
    on<RetryFetch>(_onRetryFetch);
    on<LoadNextPage>(_onLoadNextPage);
    on<LoadPreviousPage>(_onLoadPreviousPage);
    on<GoToPage>(_onGoToPage);

    if (_socket != null) {
      _setupSocketListener();
    }
  }

  Future<void> _onFetchSummarization(
    FetchSummarization event,
    Emitter<SummarizationState> emit,
  ) async {
    emit(const SummarizationState.loading());
    try {
      print(" fetching summarization");
      final data = await _service.getSummarization(
        page: event.page,
        limit: event.limit,
      );
      emit(SummarizationState.loaded(data));
    } catch (e) {
      print("error fetching summarization");
      emit(SummarizationState.error('Failed to fetch summarization: $e'));
    }
  }

  Future<void> _onSummarizationUpdate(
    OnSummarizationUpdate event,
    Emitter<SummarizationState> emit,
  ) async {
    state.when(
      initial: () {},
      loading: () {},
      loaded: (data) {
        final updatedSummaries = List<SummarizationData>.from(data.summaries);
        final existingIndex = updatedSummaries.indexWhere(
          (s) => s.id == event.summarizationData.id,
        );

        if (existingIndex >= 0) {
          updatedSummaries[existingIndex] = event.summarizationData;
        } else {
          updatedSummaries.insert(0, event.summarizationData);
        }

        final updatedData = data.copyWith(summaries: updatedSummaries);
        emit(SummarizationState.updated(updatedData));
        emit(SummarizationState.loaded(updatedData));
      },
      error: (message) {
        final newData = PaginatedSummarization(
          summaries: [event.summarizationData],
          paginationMeta: PaginationMeta(
            currentPage: 1,
            totalPages: 1,
            totalItems: 1,
            itemsPerPage: 10,
            hasNextPage: false,
            hasPreviousPage: false,
          ),
        );
        emit(SummarizationState.updated(newData));
        emit(SummarizationState.loaded(newData));
      },
      updated: (data) {
        final updatedSummaries = List<SummarizationData>.from(data.summaries);
        final existingIndex = updatedSummaries.indexWhere(
          (s) => s.id == event.summarizationData.id,
        );

        if (existingIndex >= 0) {
          updatedSummaries[existingIndex] = event.summarizationData;
        } else {
          updatedSummaries.insert(0, event.summarizationData);
        }

        final updatedData = data.copyWith(summaries: updatedSummaries);
        emit(SummarizationState.updated(updatedData));
        emit(SummarizationState.loaded(updatedData));
      },
      loadingMore: (data) {
        final updatedSummaries = List<SummarizationData>.from(data.summaries);
        final existingIndex = updatedSummaries.indexWhere(
          (s) => s.id == event.summarizationData.id,
        );

        if (existingIndex >= 0) {
          updatedSummaries[existingIndex] = event.summarizationData;
        } else {
          updatedSummaries.insert(0, event.summarizationData);
        }

        final updatedData = data.copyWith(summaries: updatedSummaries);
        emit(SummarizationState.updated(updatedData));
        emit(SummarizationState.loaded(updatedData));
      },
    );
  }

  Future<void> _onRetryFetch(
    RetryFetch event,
    Emitter<SummarizationState> emit,
  ) async {
    add(const FetchSummarization());
  }

  Future<void> _onLoadNextPage(
    LoadNextPage event,
    Emitter<SummarizationState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (data) async {
        if (data.paginationMeta.hasNextPage) {
          emit(SummarizationState.loadingMore(data));
          try {
            final nextPage = data.paginationMeta.currentPage + 1;
            final newData = await _service.getSummarization(
              page: nextPage,
              limit: data.paginationMeta.itemsPerPage,
            );
            emit(SummarizationState.loaded(newData));
          } catch (e) {
            emit(SummarizationState.loaded(data));
          }
        }
      },
      orElse: () async {},
    );
  }

  Future<void> _onLoadPreviousPage(
    LoadPreviousPage event,
    Emitter<SummarizationState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (data) async {
        if (data.paginationMeta.hasPreviousPage) {
          emit(SummarizationState.loadingMore(data));
          try {
            final previousPage = data.paginationMeta.currentPage - 1;
            final newData = await _service.getSummarization(
              page: previousPage,
              limit: data.paginationMeta.itemsPerPage,
            );
            emit(SummarizationState.loaded(newData));
          } catch (e) {
            emit(SummarizationState.loaded(data));
          }
        }
      },
      orElse: () async {},
    );
  }

  Future<void> _onGoToPage(
    GoToPage event,
    Emitter<SummarizationState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (data) async {
        if (event.page >= 1 && event.page <= data.paginationMeta.totalPages) {
          emit(SummarizationState.loadingMore(data));
          try {
            final newData = await _service.getSummarization(
              page: event.page,
              limit: data.paginationMeta.itemsPerPage,
            );
            emit(SummarizationState.loaded(newData));
          } catch (e) {
            emit(SummarizationState.loaded(data));
          }
        }
      },
      orElse: () async {},
    );
  }

  void _setupSocketListener() {
    if (_socket == null) return;

    _service.setupSummarizationSocketListener(
      socket: _socket!,
      onSummarizationUpdate: (data) {
        add(OnSummarizationUpdate(summarizationData: data));
      },
      onError: (error) {
        add(const RetryFetch());
      },
    );
  }

  void updateSocket(io.Socket socket) {
    _socket = socket;
    _setupSocketListener();
  }
}
