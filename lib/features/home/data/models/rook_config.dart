import 'package:patient_app/constants/environment.dart';

class RookConfig {
  final String clientUUID;
  final String secretKey;
  final String environment;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RookConfig({
    required this.clientUUID,
    required this.secretKey,
    required this.environment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RookConfig.initial({
    String clientUUID = Environment.rookClientUuid,
    String secretKey = Environment.rookSecretKey,
    String environment = Environment.rookEnvironment,
  }) {
    final now = DateTime.now();
    return RookConfig(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: environment,
      createdAt: now,
      updatedAt: now,
    );
  }

  RookConfig copyWith({
    String? clientUUID,
    String? secretKey,
    String? environment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RookConfig(
      clientUUID: clientUUID ?? this.clientUUID,
      secretKey: secretKey ?? this.secretKey,
      environment: environment ?? this.environment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'clientUUID': clientUUID,
    'secretKey': secretKey,
    'environment': environment,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  static RookConfig fromJson(Map<String, dynamic> json) {
    DateTime parse(String? value) {
      if (value == null) return DateTime.fromMillisecondsSinceEpoch(0);
      return DateTime.tryParse(value) ?? DateTime.fromMillisecondsSinceEpoch(0);
    }

    return RookConfig(
      clientUUID: (json['clientUUID'] as String?) ?? '',
      secretKey: (json['secretKey'] as String?) ?? '',
      environment: (json['environment'] as String?) ?? 'production',
      createdAt: parse(json['createdAt'] as String?),
      updatedAt: parse(json['updatedAt'] as String?),
    );
  }

  bool get isReady =>
      clientUUID.trim().isNotEmpty && secretKey.trim().isNotEmpty;
}
