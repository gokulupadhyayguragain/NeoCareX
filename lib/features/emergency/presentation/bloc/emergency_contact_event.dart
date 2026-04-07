part of 'emergency_contact_bloc.dart';

@freezed
class EmergencyContactEvent with _$EmergencyContactEvent {
  const factory EmergencyContactEvent.loadContacts(String patientId) =
      _LoadContacts;

  const factory EmergencyContactEvent.addContact(
    String patientId,
    EmergencyContactModel contact,
  ) = _AddContact;

  const factory EmergencyContactEvent.deleteContact(
    String patientId,
    int contactIndex,
  ) = _DeleteContact;

  const factory EmergencyContactEvent.updateContact(
    String patientId,
    int contactIndex,
    EmergencyContactModel contact,
  ) = _UpdateContact;

  const factory EmergencyContactEvent.refreshContacts(String patientId) =
      _RefreshContacts;
}
