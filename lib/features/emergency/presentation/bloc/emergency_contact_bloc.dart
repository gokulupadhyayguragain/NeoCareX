import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_app/features/emergency/data/models/emergency_contact/emergency_contact_model.dart';
import '../../data/repositories/emergency_contact_repository.dart';
part 'emergency_contact_event.dart';
part 'emergency_contact_state.dart';
part 'emergency_contact_bloc.freezed.dart';

@injectable

class EmergencyContactBloc
    extends Bloc<EmergencyContactEvent, EmergencyContactState> {
  final EmergencyContactRepository _repository;
  List<EmergencyContactModel> _cachedContacts = [];

  EmergencyContactBloc(this._repository)
      : super(const EmergencyContactState.initial()) {
    on<_LoadContacts>((event, emit) => _onLoadContacts(event, emit));
    on<_AddContact>((event, emit) => _onAddContact(event, emit));
    on<_DeleteContact>((event, emit) => _onDeleteContact(event, emit));
    on<_UpdateContact>((event, emit) => _onUpdateContact(event, emit));
    on<_RefreshContacts>((event, emit) => _onRefreshContacts(event, emit));
  }

  Future<void> _onLoadContacts(
    _LoadContacts event,
    Emitter<EmergencyContactState> emit,
  ) async {
    emit(const EmergencyContactState.loading());

    try {
      final contacts = await _repository.getEmergencyContacts(event.patientId);
      _cachedContacts = contacts;
      emit(EmergencyContactState.loaded(contacts));
    } catch (e) {
      emit(EmergencyContactState.error('Failed to load contacts: $e'));
    }
  }

  Future<void> _onAddContact(
    _AddContact event,
    Emitter<EmergencyContactState> emit,
  ) async {
    emit(const EmergencyContactState.syncing());

    try {
      await _repository.addEmergencyContact(event.patientId, event.contact);

      final contacts = await _repository.getEmergencyContacts(event.patientId);
      _cachedContacts = contacts;

      emit(EmergencyContactState.contactAdded(event.contact));
      emit(EmergencyContactState.loaded(_cachedContacts));
    } catch (e) {
      emit(EmergencyContactState.error('Failed to add contact: $e'));
    }
  }

  Future<void> _onDeleteContact(
    _DeleteContact event,
    Emitter<EmergencyContactState> emit,
  ) async {
    emit(const EmergencyContactState.syncing());

    try {
      await _repository.deleteEmergencyContact(
        event.patientId,
        event.contactIndex,
      );

      final contacts = await _repository.getEmergencyContacts(event.patientId);
      _cachedContacts = contacts;

      emit(const EmergencyContactState.contactDeleted());
      emit(EmergencyContactState.loaded(_cachedContacts));
    } catch (e) {
      emit(EmergencyContactState.error('Failed to delete contact: $e'));
    }
  }

  Future<void> _onUpdateContact(
    _UpdateContact event,
    Emitter<EmergencyContactState> emit,
  ) async {
    emit(const EmergencyContactState.syncing());

    try {
      await _repository.updateEmergencyContact(
        event.patientId,
        event.contactIndex,
        event.contact,
      );

      final contacts = await _repository.getEmergencyContacts(event.patientId);
      _cachedContacts = contacts;

      emit(EmergencyContactState.contactUpdated(event.contact));
      emit(EmergencyContactState.loaded(_cachedContacts));
    } catch (e) {
      emit(EmergencyContactState.error('Failed to update contact: $e'));
    }
  }

  Future<void> _onRefreshContacts(
    _RefreshContacts event,
    Emitter<EmergencyContactState> emit,
  ) async {
    try {
      final contacts = await _repository.getEmergencyContacts(event.patientId);
      _cachedContacts = contacts;
      emit(EmergencyContactState.loaded(contacts));
    } catch (e) {
      emit(EmergencyContactState.error('Failed to refresh contacts: $e'));
    }
  }
}
