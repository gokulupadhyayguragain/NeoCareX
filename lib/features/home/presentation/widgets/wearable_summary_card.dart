import 'package:flutter/material.dart';

class WearableSummaryCard extends StatelessWidget {
  final int? steps;
  final double? heartRate;
  final Duration totalSleep;

  const WearableSummaryCard({
    super.key,
    this.steps,
    this.heartRate,
    required this.totalSleep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal.shade600,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.watch_sharp, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Wearable Summary (24hrs)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: _buildWearableMetric(
                    'Steps',
                    steps?.toString() ?? '--',
                    Icons.directions_walk,
                    Colors.orange,
                  ),
                ),
                Container(width: 1, height: 60, color: Colors.grey.shade300),
                Expanded(
                  child: _buildWearableMetric(
                    'Heart Rate',
                    heartRate != null ? '${heartRate!.round()} BPM' : '-- BPM',
                    Icons.favorite,
                    Colors.red,
                  ),
                ),
                Container(width: 1, height: 60, color: Colors.grey.shade300),
                Expanded(
                  child: _buildWearableMetric(
                    'Sleep',
                    _formatSleepDuration(totalSleep),
                    Icons.bedtime,
                    Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWearableMetric(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatSleepDuration(Duration duration) {
    if (duration == Duration.zero) return '--';
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }
}
