import 'package:flutter/material.dart';

class ContactTypeUtils {
  static const List<ContactTypeData> contactTypes = [
    ContactTypeData(
      name: 'Family',
      iconName: 'family_restroom',
      color: Color(0xFFFF9800),
    ),
    ContactTypeData(
      name: 'Friend',
      iconName: 'person',
      color: Color(0xFF2196F3),
    ),
    ContactTypeData(
      name: 'Doctor',
      iconName: 'medical_services',
      color: Color(0xFFF44336),
    ),
    ContactTypeData(
      name: 'Hospital',
      iconName: 'local_hospital',
      color: Color(0xFF4CAF50),
    ),
    ContactTypeData(
      name: 'Emergency',
      iconName: 'emergency',
      color: Color(0xFFF44336),
    ),
    ContactTypeData(
      name: 'Police',
      iconName: 'local_police',
      color: Color(0xFF2196F3),
    ),
    ContactTypeData(
      name: 'Fire',
      iconName: 'fire_truck',
      color: Color(0xFFF44336),
    ),
    ContactTypeData(
      name: 'Work',
      iconName: 'work',
      color: Color(0xFF9C27B0),
    ),
    ContactTypeData(
      name: 'School',
      iconName: 'school',
      color: Color(0xFF009688),
    ),
  ];

  static const Map<String, IconData> materialIcons = {
    'family_restroom': Icons.family_restroom,
    'person': Icons.person,
    'medical_services': Icons.medical_services,
    'local_hospital': Icons.local_hospital,
    'emergency': Icons.emergency,
    'local_police': Icons.local_police,
    'fire_truck': Icons.fire_truck,
    'work': Icons.work,
    'school': Icons.school,
    'contact_emergency': Icons.contact_emergency,
  };

  static IconData getIcon(String iconName) =>
      materialIcons[iconName] ?? Icons.contact_emergency;

  static Color getColorByType(String type) {
    try {
      return contactTypes
          .firstWhere((ct) => ct.name == type)
          .color;
    } catch (e) {
      return const Color(0xFF757575);
    }
  }

  static ContactTypeData? getContactTypeByName(String name) {
    try {
      return contactTypes.firstWhere((ct) => ct.name == name);
    } catch (e) {
      return null;
    }
  }
}

class ContactTypeData {
  final String name;
  final String iconName;
  final Color color;

  const ContactTypeData({
    required this.name,
    required this.iconName,
    required this.color,
  });

  IconData get icon => ContactTypeUtils.materialIcons[iconName] ?? Icons.help;
}
