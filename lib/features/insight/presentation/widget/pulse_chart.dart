import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';

import 'package:patient_app/features/insight/presentation/widget/single_metric_chart.dart';

class PulseChart extends StatelessWidget {
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const PulseChart({
    super.key,
    required this.records,
    required this.averagedDates,
    required this.selectedPeriod,
    this.onFullscreen,
    required this.onCustomDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    return SingleMetricChart(
      title: 'Pulse Rate',
      color: Colors.purple,
      records: records,
      averagedDates: averagedDates,
      selectedPeriod: selectedPeriod,
      getValue: (r) => r.pulse.toDouble(),
      unit: 'BPM',
      chartType: 'pulse',
      onFullscreen: onFullscreen,
      onCustomDatePicker: onCustomDatePicker,
    );
  }
}
