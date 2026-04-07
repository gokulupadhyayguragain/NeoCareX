import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import '../emergency_contact/emergency_contact_model.dart';
import '../../../presentation/utils/contact_type_utils.dart';

part 'emergency_contact_ui_model.freezed.dart';

@freezed
class EmergencyContactUiModel with _$EmergencyContactUiModel {
  const factory EmergencyContactUiModel({
    required String id,
    required String name,
    required String phone,
    required String type,
    required Color color,
    required bool isSynced,
  }) = _EmergencyContactUiModel;

  factory EmergencyContactUiModel.fromDomainModel(
    EmergencyContactModel model,
  ) =>
      EmergencyContactUiModel(
        id: model.id ?? '',
        name: model.name,
        phone: model.phone,
        type: model.type,
        color: Color(model.colorValue),
        isSynced: model.isSynced,
      );

  factory EmergencyContactUiModel.empty() => const EmergencyContactUiModel(
        id: '',
        name: '',
        phone: '',
        type: 'Family',
        color: Color(0xFFFF9800),
        isSynced: false,
      );
}

extension EmergencyContactUiModelX on EmergencyContactUiModel {
  IconData get icon => ContactTypeUtils.getIcon('contact_emergency');

  EmergencyContactModel toDomainModel() => EmergencyContactModel(
        id: id,
        name: name,
        phone: phone,
        type: type,
        colorValue: color.value,
        isSynced: isSynced,
      );
}
