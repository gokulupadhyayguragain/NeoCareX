import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/insight/presentation/widget/single_metric_chart.dart';

class BloodSugarChart extends StatelessWidget {
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const BloodSugarChart({
    super.key,
    required this.records,
    required this.averagedDates,
    required this.selectedPeriod,
    this.onFullscreen,
    required this.onCustomDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    final sugarRecords = records.where((r) => r.bloodSugar > 0).toList();

    return SingleMetricChart(
      title: 'Blood Sugar',
      color: Colors.red,
      records: sugarRecords,
      averagedDates: averagedDates,
      selectedPeriod: selectedPeriod,
      getValue: (r) => r.bloodSugar.toDouble(),
      unit: 'mg/dL',
      chartType: 'bloodSugar',
      emptyMessage: 'No blood sugar data available',
      onFullscreen: onFullscreen,
      onCustomDatePicker: onCustomDatePicker,
    );
  }
}
