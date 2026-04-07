import 'package:flutter/material.dart';
import '../../data/models/observations_model.dart';
import '../../data/services/health_data_processor.dart';

class HealthMetricCard extends StatelessWidget {
  final String type;
  final Observation? observation;

  const HealthMetricCard({super.key, required this.type, this.observation});

  @override
  Widget build(BuildContext context) {
    final title = HealthDataProcessor.getTypeLabel(type);
    final value = observation != null
        ? HealthDataProcessor.formatObservationValue(observation!, type)
        : _getDefaultValue(type);
    final date = HealthDataProcessor.formatDate(
      observation?.effective?.dateTime,
    );
    final time = HealthDataProcessor.formatTime(
      observation?.effective?.dateTime,
    );

    String icon;
    Color color;

    switch (type) {
      case 'blood_sugar':
        icon = 'bloodtype';
        color = Colors.red;
        break;
      case 'blood_pressure':
        icon = 'monitor_heart';
        color = Colors.purple;
        break;
      case 'body_weight':
        icon = 'scale';
        color = Colors.green;
        break;
      case 'pulse':
        icon = 'favorite';
        color = Colors.pink;
        break;
      default:
        icon = 'help';
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_getIconData(icon), color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.date_range, size: 14, color: Colors.grey.shade500),
                  SizedBox(width: 4),

                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: Colors.grey.shade500,
                  ),
                  SizedBox(width: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
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

  String _getDefaultValue(String type) {
    switch (type) {
      case 'blood_sugar':
        return '-- mg/dl';
      case 'blood_pressure':
        return '--/-- mmHg';
      case 'body_weight':
        return '-- lbs';
      case 'pulse':
        return '-- BPM';
      default:
        return '--';
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'bloodtype':
        return Icons.bloodtype;
      case 'monitor_heart':
        return Icons.monitor_heart;
      case 'scale':
        return Icons.scale;
      case 'favorite':
        return Icons.favorite;
      default:
        return Icons.help;
    }
  }
}
