import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patient_app/features/emergency/data/models/fhir_patient/fhir_patient_model.dart';

part 'emergency_contact_model.freezed.dart';
part 'emergency_contact_model.g.dart';

@freezed
class EmergencyContactModel with _$EmergencyContactModel {
  const factory EmergencyContactModel({
    String? id,
    required String name,
    required String phone,
    required String type,
    required int colorValue,
    @Default(false) bool isSynced,
  }) = _EmergencyContactModel;

  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactModelFromJson(json);
}

extension EmergencyContactModelX on EmergencyContactModel {
  FhirEmergencyContactModel toFhirEmergencyContact() =>
      FhirEmergencyContactModel(
        name: name,
        phoneNumber: phone,
        relationship: type,
      );
}
