import 'package:flutter/material.dart';
import '../../data/models/health_data_model.dart';

class HealthDataCard extends StatelessWidget {
  final HealthDataModel data;
  final HealthDataType type;
  final Color color;
  final bool isDesktop;

  const HealthDataCard({
    super.key,
    required this.data,
    required this.type,
    required this.color,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isDesktop ? 12 : 16),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20 : 16,
        vertical: isDesktop ? 16 : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: isDesktop ? 20 : 0),
          Container(
            width: isDesktop ? 44 : 40,
            height: isDesktop ? 44 : 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getIconForType(type),
              color: color,
              size: isDesktop ? 24 : 20,
            ),
          ),
          SizedBox(width: isDesktop ? 20 : 16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (type == HealthDataType.bloodPressure)
                  Text(
                    '${data.systolic}/${data.diastolic} ${data.unit}',
                    style: TextStyle(
                      fontSize: isDesktop ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                else
                  Text(
                    '${data.value} ${data.unit}',
                    style: TextStyle(
                      fontSize: isDesktop ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: isDesktop ? 2 : 1,
            child: Text(
              data.date,
              style: TextStyle(
                fontSize: isDesktop ? 13 : 12,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: isDesktop ? 2 : 1,
            child: Text(
              data.time,
              style: TextStyle(
                fontSize: isDesktop ? 13 : 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: isDesktop ? 40 : 0),
        ],
      ),
    );
  }

  IconData _getIconForType(HealthDataType type) {
    switch (type) {
      case HealthDataType.bloodSugar:
        return Icons.water_drop_outlined;
      case HealthDataType.bloodPressure:
        return Icons.monitor_heart_outlined;
      case HealthDataType.bodyWeight:
        return Icons.monitor_weight_outlined;
      case HealthDataType.pulse:
        return Icons.favorite_outline;
      case HealthDataType.oxygenLevel:
        return Icons.air_outlined;
        case HealthDataType.nutrition:
        return Icons.restaurant_outlined;
    }
  }
}
