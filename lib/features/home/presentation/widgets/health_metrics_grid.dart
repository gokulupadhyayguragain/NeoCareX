import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart';
import 'health_metric_card.dart';

class HealthMetricsGrid extends StatelessWidget {
  final Map<String, Observation?> latestObservations;
  final bool isDesktop;

  const HealthMetricsGrid({
    super.key,
    required this.latestObservations,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: HealthMetricCard(
                    type: 'blood_sugar',
                    observation: latestObservations['blood_sugar'],
                  )),
                  const SizedBox(width: 16),
                  Expanded(child: HealthMetricCard(
                    type: 'blood_pressure',
                    observation: latestObservations['blood_pressure'],
                  )),
                  const SizedBox(width: 16),
                  Expanded(child: HealthMetricCard(
                    type: 'body_weight',
                    observation: latestObservations['body_weight'],
                  )),
                  const SizedBox(width: 16),
                  Expanded(child: HealthMetricCard(
                    type: 'pulse',
                    observation: latestObservations['pulse'],
                  )),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: HealthMetricCard(
                        type: 'blood_sugar',
                        observation: latestObservations['blood_sugar'],
                      )),
                      const SizedBox(width: 16),
                      Expanded(child: HealthMetricCard(
                        type: 'blood_pressure',
                        observation: latestObservations['blood_pressure'],
                      )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: HealthMetricCard(
                        type: 'body_weight',
                        observation: latestObservations['body_weight'],
                      )),
                      const SizedBox(width: 16),
                      Expanded(child: HealthMetricCard(
                        type: 'pulse',
                        observation: latestObservations['pulse'],
                      )),
                    ],
                  ),
                ],
              ),
      ],
    );
  }
}
