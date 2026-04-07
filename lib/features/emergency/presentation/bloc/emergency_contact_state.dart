part of 'emergency_contact_bloc.dart';

@freezed
class EmergencyContactState with _$EmergencyContactState {
  const factory EmergencyContactState.initial() = _Initial;

  const factory EmergencyContactState.loading() = _Loading;

  const factory EmergencyContactState.loaded(
    List<EmergencyContactModel> contacts,
  ) = _Loaded;

  const factory EmergencyContactState.error(String message) = _Error;

  const factory EmergencyContactState.contactAdded(
    EmergencyContactModel contact,
  ) = _ContactAdded;

  const factory EmergencyContactState.contactDeleted() = _ContactDeleted;

  const factory EmergencyContactState.contactUpdated(
    EmergencyContactModel contact,
  ) = _ContactUpdated;

  const factory EmergencyContactState.syncing() = _Syncing;

  const factory EmergencyContactState.syncCompleted() = _SyncCompleted;
}
