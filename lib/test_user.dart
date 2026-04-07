import 'package:patient_app/core/storage/secure_storage.dart';

class TestUser {
  static Future<String> getUserId() async {
    final storage = SecureStorageService();
    final patientId = await storage.readString("patientId");
    return patientId ?? '';
  }

  static const Map<String, dynamic> userProfile = {
    'date_of_birth': '2001-12-29',
    'height_cm': 170,
    'weight_kg': 70.5,
    'sex': 'male',
  };
}