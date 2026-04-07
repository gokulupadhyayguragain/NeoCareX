import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class N8nService {
  final String n8nWebhookUrl;

  N8nService({
    required this.n8nWebhookUrl,
  });

  Future<String> sendMessage({
    required String userId,
    required String message,
  }) async {
    try {
      final response = await http
          .post(
        Uri.parse(n8nWebhookUrl),
        headers: const {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userId': userId,
          'message': message,
        }),
      )
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw Exception('n8n request timed out after 60 seconds');
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = jsonDecode(response.body);

        if (decoded is Map) {
          if (decoded.containsKey('answer')) {
            final answer = decoded['answer'];
            return answer.toString();
          }

          return 'Error: Unexpected response format. Available fields: ${decoded.keys.toList()}';
        }

        if (decoded is List && decoded.isNotEmpty) {
          final firstItem = decoded[0];
          if (firstItem is Map && firstItem.containsKey('answer')) {
            return firstItem['answer'].toString();
          }
        }

        return 'Error: Unexpected response format from n8n';
      } else {
        throw Exception(
          'n8n error ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e, stackTrace) {
      debugPrint('[N8nService] StackTrace: $stackTrace');
      rethrow;
    }
  }
}
