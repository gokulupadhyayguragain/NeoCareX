import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/features/emergency/data/models/fhir_patient/fhir_patient_model.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio();
}

abstract class RemoteDataSource {
  Future<FhirPatientModel> getPatient(String patientId);
  Future<void> updatePatient(FhirPatientModel patient);
  Future<void> addEmergencyContact(
    String patientId,
    FhirEmergencyContactModel contact,
  );
  Future<void> deleteEmergencyContact(String patientId, int contactIndex);
  Future<void> deleteAllEmergencyContacts(String patientId);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio;

  static const String _aidboxBaseUrl = 'https://aidboxdev.gheit.co';
  
  static const String _username = 'rpm-demo-client';
  static const String _password = 'MoJpReAK7yvh4';

  RemoteDataSourceImpl(this._dio) {
    _dio.options.baseUrl = _aidboxBaseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/fhir+json',
      'Accept': 'application/fhir+json',
    };
    _addAuthHeader();
  }

  void _addAuthHeader() {
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';
    _dio.options.headers['Authorization'] = basicAuth;
  }

  @override
  Future<FhirPatientModel> getPatient(String patientId) async {
    try {
      final response = await _dio.get(
        '/fhir/Patient/$patientId',
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        return FhirPatientModel.fromJson(response.data);
      }
      throw Exception(
        'Failed to fetch patient: ${response.statusCode} - ${response.data}',
      );
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<void> updatePatient(FhirPatientModel patient) async {
    try {
      final response = await _dio.put(
        '/fhir/Patient/${patient.id}',
        data: patient.toFhirJson(),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
          'Failed to update patient: ${response.statusCode} - ${response.data}',
        );
      }
    } on DioError catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  @override
  Future<void> addEmergencyContact(
    String patientId,
    FhirEmergencyContactModel contact,
  ) async {
    try {
      final patient = await getPatient(patientId);
      final updatedContacts = <FhirEmergencyContactModel>[
        ...(patient.contact ?? []),
        contact,
      ];
      final updatedPatient = patient.copyWith(contact: updatedContacts);
      await updatePatient(updatedPatient);
    } catch (e) {
      throw Exception('Failed to add emergency contact: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteEmergencyContact(
    String patientId,
    int contactIndex,
  ) async {
    try {
      final patient = await getPatient(patientId);
      final currentContacts = patient.contact ?? [];
      
      if (contactIndex < 0 || contactIndex >= currentContacts.length) {
        throw Exception('Invalid contact index: $contactIndex');
      }
      
      final updatedContacts = <FhirEmergencyContactModel>[
        for (int i = 0; i < currentContacts.length; i++)
          if (i != contactIndex) currentContacts[i],
      ];
      
      final updatedPatient = patient.copyWith(contact: updatedContacts);
      await updatePatient(updatedPatient);
    } catch (e) {
      throw Exception('Failed to delete emergency contact: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAllEmergencyContacts(String patientId) async {
    try {
      final patient = await getPatient(patientId);
      final updatedPatient = patient.copyWith(
        contact: <FhirEmergencyContactModel>[],
      );
      await updatePatient(updatedPatient);
    } catch (e) {
      throw Exception('Failed to delete all emergency contacts: ${e.toString()}');
    }
  }
}