import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/insight/presentation/widget/single_metric_chart.dart';

class BodyWeightChart extends StatelessWidget {
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const BodyWeightChart({
    super.key,
    required this.records,
    required this.averagedDates,
    required this.selectedPeriod,
    this.onFullscreen,
    required this.onCustomDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    final weightRecords = records.where((r) => r.weight > 0).toList();

    return SingleMetricChart(
      title: 'Body Weight',
      color: Colors.teal,
      records: weightRecords,
      averagedDates: averagedDates,
      selectedPeriod: selectedPeriod,
      getValue: (r) => r.weight,
      unit: 'lb',
      valueLabel: 'Weight',
      chartType: 'bodyWeight',
      emptyMessage: 'No body weight data available',
      onFullscreen: onFullscreen,
      onCustomDatePicker: onCustomDatePicker,
    );
  }
}
