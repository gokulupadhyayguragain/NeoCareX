import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_patient_model.freezed.dart';
part 'fhir_patient_model.g.dart';

@freezed
class FhirPatientModel with _$FhirPatientModel {
  const factory FhirPatientModel({
    required String id,
    required String resourceType,
    required PatientNameModel name,
    required String gender,
    String? birthDate,
    List<PatientTelecomModel>? telecom,
    List<FhirEmergencyContactModel>? contact,
    String? active,
  }) = _FhirPatientModel;

  factory FhirPatientModel.fromJson(Map<String, dynamic> json) {
    final nameList = json['name'] as List<dynamic>?;
    final nameJson = (nameList?.isNotEmpty == true)
        ? nameList!.first as Map<String, dynamic>
        : <String, dynamic>{};

    final telecomList = json['telecom'] as List<dynamic>?;

    final contactList = json['contact'] as List<dynamic>?;

    return FhirPatientModel(
      id: json['id'] as String? ?? '',
      resourceType: json['resourceType'] as String? ?? 'Patient',
      gender: json['gender'] as String? ?? '',
      birthDate: json['birthDate'] as String?,
      active: json['active']?.toString(),
      name: PatientNameModel.fromFhirJson(nameJson),
      telecom: telecomList
          ?.map((e) => PatientTelecomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: contactList
          ?.map(
            (e) => FhirEmergencyContactModel.fromFhirJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}

extension FhirPatientModelX on FhirPatientModel {
  Map<String, dynamic> toFhirJson() => {
    'resourceType': 'Patient',
    'id': id,
    'active': true,
    'name': [name.toFhirJson()], 
    'gender': gender,
    if (birthDate != null) 'birthDate': birthDate,
    if (telecom != null && telecom!.isNotEmpty)
      'telecom': telecom!.map((t) => t.toFhirJson()).toList(),
    if (contact != null && contact!.isNotEmpty)
      'contact': contact!.map((c) => c.toFhirJson()).toList(),
  };
}

@freezed
class PatientNameModel with _$PatientNameModel {
  const factory PatientNameModel({
    required String given,
    required String family,
    String? prefix,
  }) = _PatientNameModel;

  factory PatientNameModel.fromJson(Map<String, dynamic> json) =>
      _$PatientNameModelFromJson(json);

  factory PatientNameModel.fromFhirJson(Map<String, dynamic> json) {
    final givenList = json['given'] as List<dynamic>?;
    final prefixList = json['prefix'] as List<dynamic>?;
    return PatientNameModel(
      given: givenList?.isNotEmpty == true ? givenList!.first as String : '',
      family: json['family'] as String? ?? '',
      prefix: prefixList?.isNotEmpty == true
          ? prefixList!.first as String
          : null,
    );
  }
}

extension PatientNameModelX on PatientNameModel {
  Map<String, dynamic> toFhirJson() => {
    'given': [given], 
    'family': family,
    if (prefix != null && prefix!.isNotEmpty)
      'prefix': [prefix!], 
  };
}

@freezed
class PatientTelecomModel with _$PatientTelecomModel {
  const factory PatientTelecomModel({
    required String system,
    required String value,
    String? use,
  }) = _PatientTelecomModel;

  factory PatientTelecomModel.fromJson(Map<String, dynamic> json) =>
      _$PatientTelecomModelFromJson(json);
}

extension PatientTelecomModelX on PatientTelecomModel {
  Map<String, dynamic> toFhirJson() => {
    'system': system,
    'value': value,
    if (use != null && use!.isNotEmpty) 'use': use,
  };
}

@freezed
class FhirEmergencyContactModel with _$FhirEmergencyContactModel {
  const factory FhirEmergencyContactModel({
    required String name,
    required String phoneNumber,
    required String relationship,
    String? gender,
  }) = _FhirEmergencyContactModel;

  factory FhirEmergencyContactModel.fromJson(Map<String, dynamic> json) =>
      _$FhirEmergencyContactModelFromJson(json);

  factory FhirEmergencyContactModel.fromFhirJson(Map<String, dynamic> json) {
    final nameField = json['name'];
    String parsedName = '';
    if (nameField is Map<String, dynamic>) {
      parsedName = nameField['text'] as String? ?? '';
    } else if (nameField is String) {
      parsedName = nameField;
    }

    final telecomList = json['telecom'] as List<dynamic>?;
    final phone = telecomList?.isNotEmpty == true
        ? (telecomList!.first as Map<String, dynamic>)['value'] as String? ?? ''
        : '';

    final relationshipList = json['relationship'] as List<dynamic>?;
    String parsedRelationship = '';
    if (relationshipList?.isNotEmpty == true) {
      final firstRel = relationshipList!.first as Map<String, dynamic>;
      final codingList = firstRel['coding'] as List<dynamic>?;
      if (codingList?.isNotEmpty == true) {
        final firstCoding = codingList!.first as Map<String, dynamic>;
        parsedRelationship = firstCoding['display'] as String? ?? '';
      }
      if (parsedRelationship.isEmpty) {
        parsedRelationship = firstRel['text'] as String? ?? '';
      }
    }

    return FhirEmergencyContactModel(
      name: parsedName,
      phoneNumber: phone,
      relationship: parsedRelationship,
      gender: json['gender'] as String?,
    );
  }
}

extension FhirEmergencyContactModelX on FhirEmergencyContactModel {
  Map<String, dynamic> toFhirJson() => {
    'relationship': [
      {
        'coding': [
          {
            'system': 'http://terminology.hl7.org/CodeSystem/v2-0131',
            'code': _relationshipToCode(relationship),
            'display': relationship,
          },
        ],
      },
    ],
    'name': {'text': name},
    'telecom': [
      {'system': 'phone', 'value': phoneNumber, 'use': 'mobile'},
    ],
    if (gender != null) 'gender': gender,
  };

  static String _relationshipToCode(String relationship) {
    const codeMap = {
      'Family': 'C', 
      'Friend': 'E', 
      'Doctor': 'N', 
      'Hospital': 'N',
      'Emergency': 'C',
      'Police': 'O', 
      'Fire': 'O',
      'Work': 'E',
      'School': 'E',
    };
    return codeMap[relationship] ?? 'C';
  }
}
