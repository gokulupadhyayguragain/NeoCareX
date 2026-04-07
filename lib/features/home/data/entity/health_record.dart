import 'package:equatable/equatable.dart';

class HealthRecord extends Equatable {
  final String id;
  final DateTime timestamp;
  final int systolic;
  final int diastolic;
  final int pulse;
  final double weight;
  final String hypertensionStage;
  final double bloodSugar;
  final double spo2;

  const HealthRecord({
    required this.id,
    required this.timestamp,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.weight,
    required this.hypertensionStage,
    required this.bloodSugar,
    required this.spo2,
  });

  int get pulsePresure => systolic - diastolic;
  int get meanArterialPressure => ((2 * diastolic) + systolic) ~/ 3;

  @override
  List<Object?> get props => [
        id,
        timestamp,
        systolic,
        diastolic,
        pulse,
        weight,
        hypertensionStage,
        bloodSugar,
        spo2,
      ];
}