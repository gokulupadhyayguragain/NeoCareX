import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/insight/presentation/widget/single_metric_chart.dart';

class OxygenChart extends StatelessWidget {
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const OxygenChart({
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
      title: 'Oxygen Level',
      color: Colors.orange,
      records: records,
      averagedDates: averagedDates,
      selectedPeriod: selectedPeriod,
      getValue: (r) => r.spo2,
      unit: '%',
      valueLabel: 'SpO₂',
      chartType: 'oxygen',
      onFullscreen: onFullscreen,
      onCustomDatePicker: onCustomDatePicker,
    );
  }
}
