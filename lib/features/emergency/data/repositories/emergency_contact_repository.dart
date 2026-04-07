import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_app/features/emergency/data/models/emergency_contact/emergency_contact_model.dart';
import 'package:patient_app/features/emergency/data/models/fhir_patient/fhir_patient_model.dart';
import '../datasources/remote_datasource.dart';

abstract class EmergencyContactRepository {
  Future<List<EmergencyContactModel>> getEmergencyContacts(String patientId);
  Future<void> addEmergencyContact(
    String patientId,
    EmergencyContactModel contact,
  );
  Future<void> deleteEmergencyContact(String patientId, int contactIndex);
  Future<void> updateEmergencyContact(
    String patientId,
    int contactIndex,
    EmergencyContactModel contact,
  );
  Future<void> deleteAllEmergencyContacts(String patientId);
}

@LazySingleton(as: EmergencyContactRepository)
class EmergencyContactRepositoryImpl implements EmergencyContactRepository {
  final RemoteDataSource _remoteDataSource;

  EmergencyContactRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<EmergencyContactModel>> getEmergencyContacts(
    String patientId,
  ) async {
    try {
      final patient = await _remoteDataSource.getPatient(patientId);

      if (patient.contact == null || patient.contact!.isEmpty) {
        return [];
      }

      return patient.contact!.asMap().entries.map((e) {
        final contact = e.value;
        final index = e.key;
        return EmergencyContactModel(
          id: 'contact_$index',
          name: contact.name,
          phone: contact.phoneNumber,
          type: contact.relationship,
          colorValue: _getColorForType(contact.relationship).value,
          isSynced: true,
        );
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addEmergencyContact(
    String patientId,
    EmergencyContactModel contact,
  ) async {
    try {
      final fhirContact = contact.toFhirEmergencyContact();
      await _remoteDataSource.addEmergencyContact(patientId, fhirContact);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEmergencyContact(
    String patientId,
    int contactIndex,
  ) async {
    try {
      await _remoteDataSource.deleteEmergencyContact(patientId, contactIndex);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateEmergencyContact(
    String patientId,
    int contactIndex,
    EmergencyContactModel contact,
  ) async {
    try {
      final patient = await _remoteDataSource.getPatient(patientId);

      if (patient.contact == null || contactIndex >= patient.contact!.length) {
        throw Exception('Contact not found');
      }

      final updatedContacts = <FhirEmergencyContactModel>[...patient.contact!];
      updatedContacts[contactIndex] = contact.toFhirEmergencyContact();

      final updatedPatient = patient.copyWith(contact: updatedContacts);
      await _remoteDataSource.updatePatient(updatedPatient);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllEmergencyContacts(String patientId) async {
    try {
      await _remoteDataSource.deleteAllEmergencyContacts(patientId);
    } catch (e) {
      rethrow;
    }
  }

  static Color _getColorForType(String type) {
    const typeColorMap = {
      'Family': Color(0xFFFF9800),
      'Friend': Color(0xFF2196F3),
      'Doctor': Color(0xFFF44336),
      'Hospital': Color(0xFF4CAF50),
      'Emergency': Color(0xFFF44336),
      'Police': Color(0xFF2196F3),
      'Fire': Color(0xFFF44336),
      'Work': Color(0xFF9C27B0),
      'School': Color(0xFF009688),
    };
    return typeColorMap[type] ?? const Color(0xFF757575);
  }
}
