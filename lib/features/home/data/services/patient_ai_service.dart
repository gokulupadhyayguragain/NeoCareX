import 'package:flutter/foundation.dart';
import 'package:patient_app/features/home/data/services/n8n_service.dart';

class PatientAiService {
  final N8nService n8nService;

  PatientAiService({
    required this.n8nService,
  });

  Future<String> getPatientAiResponse(
    String patientId,
    String userMessage,
  ) async {
    try {
      final response = await n8nService.sendMessage(
        userId: patientId,
        message: userMessage,
      );

      return response;
    } catch (e, stackTrace) {
      debugPrint('[PatientAiService] StackTrace: $stackTrace');
      rethrow;
    }
  }
}
