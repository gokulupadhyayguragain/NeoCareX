import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../models/summarization_model.dart';

class SummarizationService {
  final String baseUrl;

  SummarizationService({
    this.baseUrl = 'https://dev.vitalcarex.backend.gheit.co',
  });

  /*   Future<String?> _getValidIdToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User not logged in');

      final idToken = await user.getIdToken(true);

      final authBox = Hive.box('authBox');
      await authBox.put('accessToken', idToken);

      return idToken;
    } catch (e) {
      return '';
    }
  } */

  Future<PaginatedSummarization> getSummarization({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final dio = Dio();
      final storage = SecureStorageService();
      final idToken = await storage.readString("access_token");

      if (idToken == null || idToken.isEmpty) {
        throw Exception('No access token available');
      }

      final response = await dio.get(
        '$baseUrl/get_patient_text_summarization_history',
        queryParameters: {'page': page, 'limit': limit},
        options: Options(headers: {'Authorization': 'Bearer $idToken'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data is Map<String, dynamic>
            ? response.data
            : jsonDecode(response.data);
        return _parsePaginatedApiResponse(data, page, limit);
      } else {
        throw Exception('Failed to fetch: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load summaries: $e');
    }
  }

  PaginatedSummarization _parsePaginatedApiResponse(
    Map<String, dynamic> data,
    int page,
    int limit,
  ) {
    List<dynamic> summariesData = [];
    if (data['data'] != null && data['data'] is List) {
      summariesData = data['data'];
    }

    final summaries = summariesData.map((item) {
      final textSummarization = item['text_summarization'] ?? '';

      final assessmentInfo = _parseAssessmentInfo(textSummarization);

      double riskConfidence = _extractRiskConfidence(textSummarization);

      final hasAnomaly =
          textSummarization.toUpperCase().contains('ANOMALY') ||
          textSummarization.toUpperCase().contains('ABNORMAL') ||
          assessmentInfo['riskLevel'] == 'critical';

      final metrics = _extractMetricsFromSummary(textSummarization);

      DateTime createdAt;
      try {
        createdAt = DateTime.parse(
          item['created_at'] ?? DateTime.now().toIso8601String(),
        );
      } catch (e) {
        createdAt = DateTime.now();
      }

      return SummarizationData(
        id: item['id'] ?? 0,
        patientId: item['patient_id'] ?? '',
        textSummarization: textSummarization,
        createdAt: createdAt,
        riskConfidence: riskConfidence,
        metrics: metrics,
        hasAnomaly: hasAnomaly,
        assessmentType: assessmentInfo['assessmentType'] ?? 'Health Assessment',
        riskStatus: assessmentInfo['riskStatus'] ?? 'Under Review',
        riskLevel: assessmentInfo['riskLevel'] ?? 'unknown',
      );
    }).toList();

    final pagination = data['pagination'] ?? {};
    final totalRecords = pagination['total_records'] ?? summaries.length;
    final totalPages = pagination['total_pages'] ?? 1;
    final currentPage = pagination['current_page'] ?? page;
    final hasNext = pagination['has_next'] ?? false;
    final hasPrev = pagination['has_prev'] ?? false;

    final paginationMeta = PaginationMeta(
      currentPage: currentPage,
      totalPages: totalPages,
      totalItems: totalRecords,
      itemsPerPage: limit,
      hasNextPage: hasNext,
      hasPreviousPage: hasPrev,
    );

    return PaginatedSummarization(
      summaries: summaries,
      paginationMeta: paginationMeta,
    );
  }

  Map<String, String> _parseAssessmentInfo(String summary) {
    String assessmentType = 'Health Assessment';
    String riskStatus = 'Under Review';
    String riskLevel = 'unknown';

    final summaryUpper = summary.toUpperCase();

    if (summaryUpper.contains('NORMAL ASSESSMENT')) {
      assessmentType = 'NORMAL ASSESSMENT';
      riskLevel = 'normal';
      riskStatus = 'Low heart disease risk';
    } else if (summaryUpper.contains('ANOMALY')) {
      assessmentType = 'ANOMALY DETECTED';
      riskLevel = 'high';
      riskStatus = 'Abnormal readings detected';
    } else if (summaryUpper.contains('CRITICAL') ||
        summaryUpper.contains('EMERGENCY')) {
      assessmentType = 'CRITICAL CONDITION';
      riskLevel = 'critical';
      riskStatus = 'Requires immediate medical attention';
    } else if (summaryUpper.contains('WARNING') ||
        summaryUpper.contains('CAUTION')) {
      assessmentType = 'WARNING';
      riskLevel = 'elevated';
      riskStatus = 'Elevated risk factors detected';
    }

    if (summaryUpper.contains('LOW RISK')) {
      riskLevel = 'normal';
      riskStatus = 'Low risk';
    } else if (summaryUpper.contains('MODERATE RISK')) {
      riskLevel = 'elevated';
      riskStatus = 'Moderate risk';
    } else if (summaryUpper.contains('HIGH RISK')) {
      riskLevel = 'high';
      riskStatus = 'High risk';
    }

    return {
      'assessmentType': assessmentType,
      'riskStatus': riskStatus,
      'riskLevel': riskLevel,
    };
  }

  double _extractRiskConfidence(String summary) {
    final confidencePattern = RegExp(
      r'(\d+(?:\.\d+)?)%\s*confidence',
      caseSensitive: false,
    );
    final match = confidencePattern.firstMatch(summary);

    if (match != null) {
      return double.tryParse(match.group(1) ?? '0') ?? 0.0;
    }

    final percentagePattern = RegExp(r'(\d+(?:\.\d+)?)%');
    final matches = percentagePattern.allMatches(summary);

    for (final match in matches) {
      final value = double.tryParse(match.group(1) ?? '0');
      if (value != null && value <= 100) {
        return value;
      }
    }

    return 0.0;
  }

  List<HealthMetric> _extractMetricsFromSummary(String summary) {
    final metrics = <HealthMetric>[];

    final sleepMatch = RegExp(
      r'Sleep\s*:?\s*(\d+(?:\.\d+)?)\s*(?:hrs?|hours?)',
      caseSensitive: false,
    ).firstMatch(summary);
    if (sleepMatch != null) {
      final value = sleepMatch.group(1) ?? '--';
      final numValue = double.tryParse(value) ?? 0;
      metrics.add(
        HealthMetric(
          label: 'Sleep Duration',
          value: value,
          status: numValue < 7 ? 'low' : (numValue > 9 ? 'elevated' : 'normal'),
          unit: 'hrs',
          normalRange: '7-9 hrs',
        ),
      );
    }

    final bmiMatch = RegExp(
      r'BMI\s*:?\s*(\w+)',
      caseSensitive: false,
    ).firstMatch(summary);
    if (bmiMatch != null) {
      final value = bmiMatch.group(1) ?? '--';
      String status = 'normal';
      if (value.toUpperCase().contains('OBESE')) {
        status = 'critical';
      } else if (value.toUpperCase().contains('OVERWEIGHT')) {
        status = 'elevated';
      } else if (value.toUpperCase().contains('UNDERWEIGHT')) {
        status = 'low';
      }
      metrics.add(
        HealthMetric(
          label: 'BMI',
          value: value,
          status: status,
          unit: '',
          normalRange: 'Normal weight',
        ),
      );
    }

    final bpDiastolicMatch = RegExp(
      r'BP\s*Diastolic\s*:?\s*(\d+)\s*mmHg',
      caseSensitive: false,
    ).firstMatch(summary);
    if (bpDiastolicMatch != null) {
      final value = bpDiastolicMatch.group(1) ?? '--';
      final numValue = double.tryParse(value) ?? 0;
      metrics.add(
        HealthMetric(
          label: 'Blood Pressure (Diastolic)',
          value: value,
          status: numValue > 90
              ? 'elevated'
              : (numValue < 60 ? 'low' : 'normal'),
          unit: 'mmHg',
          normalRange: '60-80 mmHg',
        ),
      );
    }

    final cholesterolMatch = RegExp(
      r'Cholesterol\s*:?\s*(\d+)\s*mg/dL',
      caseSensitive: false,
    ).firstMatch(summary);
    if (cholesterolMatch != null) {
      final value = cholesterolMatch.group(1) ?? '--';
      final numValue = double.tryParse(value) ?? 0;
      metrics.add(
        HealthMetric(
          label: 'Total Cholesterol',
          value: value,
          status: numValue > 200 ? 'elevated' : 'normal',
          unit: 'mg/dL',
          normalRange: '<200 mg/dL',
        ),
      );
    }

    return metrics;
  }

  void setupSummarizationSocketListener({
    required io.Socket socket,
    required Function(SummarizationData) onSummarizationUpdate,
    required Function(String) onError,
  }) {
    socket.on('health_summary_update', (data) {
      try {
        if (data != null) {
          final summaryData = data is Map ? data : jsonDecode(data.toString());
          final textSummarization = summaryData['text_summarization'] ?? '';

          final assessmentInfo = _parseAssessmentInfo(textSummarization);
          final riskConfidence = _extractRiskConfidence(textSummarization);
          final metrics = _extractMetricsFromSummary(textSummarization);
          final hasAnomaly = textSummarization.toUpperCase().contains(
            'ANOMALY',
          );

          DateTime createdAt;
          try {
            createdAt = DateTime.parse(
              summaryData['created_at'] ?? DateTime.now().toIso8601String(),
            );
          } catch (e) {
            createdAt = DateTime.now();
          }

          final summarizationData = SummarizationData(
            id: summaryData['id'] ?? 0,
            patientId: summaryData['patient_id'] ?? '',
            textSummarization: textSummarization,
            createdAt: createdAt,
            riskConfidence: riskConfidence,
            metrics: metrics,
            hasAnomaly: hasAnomaly,
            assessmentType:
                assessmentInfo['assessmentType'] ?? 'Health Assessment',
            riskStatus: assessmentInfo['riskStatus'] ?? 'Under Review',
            riskLevel: assessmentInfo['riskLevel'] ?? 'unknown',
          );

          onSummarizationUpdate(summarizationData);
        }
      } catch (e) {
        onError('Error processing summarization update: $e');
      }
    });
  }
}
