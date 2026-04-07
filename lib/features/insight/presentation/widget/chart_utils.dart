import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartUtils {
  static double calculateYAxisInterval(List<double> values) {
    if (values.isEmpty) return 10;

    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final range = max - min;

    if (range <= 10) return 5;
    if (range <= 20) return 5;
    if (range <= 40) return 10;
    if (range <= 80) return 20;
    if (range <= 120) return 30;
    if (range <= 200) return 50;
    if (range <= 300) return 60;

    return 100;
  }

  static ({double min, double max}) calculatePaddedRange(
    List<double> values, {
    double paddingPercent = 0.22,
  }) {
    if (values.isEmpty) return (min: 0, max: 100);

    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final range = max - min;

    final padding = range * paddingPercent;

    return (min: (min - padding).clamp(0, double.infinity), max: max + padding);
  }

  static bool isAveragedRecord(HealthRecord record, Set<String> averagedDates) {
    final dateKey =
        '${record.timestamp.year}-${record.timestamp.month.toString().padLeft(2, '0')}-${record.timestamp.day.toString().padLeft(2, '0')}';
    return averagedDates.contains(dateKey);
  }

  static String getMonthAbbreviation(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month];
  }

  static List<FlSpot> createSpots(
    List<HealthRecord> records,
    double Function(HealthRecord) getValue,
  ) {
    final spots = <FlSpot>[];
    for (int i = 0; i < records.length && i < 20; i++) {
      final record = records[records.length - 1 - i];
      spots.add(FlSpot(i.toDouble(), getValue(record)));
    }
    return spots;
  }
}
