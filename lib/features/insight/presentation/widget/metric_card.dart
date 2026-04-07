import 'package:flutter/material.dart';
import 'package:patient_app/features/summarization/data/models/summarization_model.dart';

class MetricCard extends StatelessWidget {
  final HealthMetric metric;

  const MetricCard({super.key, required this.metric});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'critical':
        return const Color(0xFFDC2626);
      case 'high':
        return const Color(0xFFF59E0B);
      case 'normal':
        return const Color(0xFF10B981);
      default:
        return const Color(0xFF6B7280);
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'critical':
        return 'CRITICAL';
      case 'high':
        return 'HIGH';
      case 'normal':
        return 'Normal';
      default:
        return 'Unknown';
    }
  }

  IconData _getMetricIcon(String label) {
    switch (label.toLowerCase()) {
      case 'heart rate':
        return Icons.favorite_rounded;
      case 'blood pressure diastolic':
        return Icons.water_drop_rounded;
      case 'cholesterol':
        return Icons.oil_barrel;
      case 'blood glucose(fasting)':
        return Icons.water_drop_outlined;
      case 'sleep duration':
        return Icons.snooze;
      case 'glucose':
        return Icons.bubble_chart_rounded;
      case 'oxygen':
        return Icons.air_rounded;
      case 'temperature':
        return Icons.thermostat_rounded;
      default:
        return Icons.health_and_safety_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(metric.status);
    final statusLabel = _getStatusLabel(metric.status);
    final icon = _getMetricIcon(metric.label);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 6 : 8),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: statusColor, size: isMobile ? 18 : 20),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 6 : 8,
                  vertical: isMobile ? 2 : 3,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    fontSize: isMobile ? 9 : 10,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                metric.label,
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(height: isMobile ? 6 : 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    metric.value,
                    style: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.w800,
                      color: statusColor,
                    ),
                  ),
                  if (metric.unit.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        metric.unit,
                        style: TextStyle(
                          fontSize: isMobile ? 11 : 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
