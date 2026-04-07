import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/insight/presentation/bloc/insights_bloc.dart';
import 'package:patient_app/features/insight/presentation/widget/period_selector.dart';
import 'package:patient_app/features/insight/presentation/widget/chart_container.dart';
import 'package:patient_app/features/insight/presentation/widget/chart_header.dart';
import 'package:patient_app/features/insight/presentation/widget/chart_utils.dart';
import 'package:intl/intl.dart';

class BloodPressureChart extends StatelessWidget {
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const BloodPressureChart({
    super.key,
    required this.records,
    required this.averagedDates,
    required this.selectedPeriod,
    this.onFullscreen,
    required this.onCustomDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    final bpRecords = records
        .where((r) => r.systolic > 0 && r.diastolic > 0)
        .toList();

    final allBpValues = [
      ...bpRecords.map((r) => r.systolic.toDouble()),
      ...bpRecords.map((r) => r.diastolic.toDouble()),
    ];
    final bpInterval = ChartUtils.calculateYAxisInterval(allBpValues);
    final bpRange = ChartUtils.calculatePaddedRange(allBpValues);

    return ChartContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartHeader(
            title: 'Blood Pressure',
            color: Colors.blue,
            legendItems: const [
              LegendItem(label: 'SYS', color: Colors.blue),
              LegendItem(label: 'DIA', color: Colors.green),
            ],
            onFullscreen: onFullscreen,
          ),
          const SizedBox(height: 16),
          PeriodSelector(
            currentPeriod: selectedPeriod,
            onPeriodSelected: (period) {
              if (period == 'Custom') {
                onCustomDatePicker('bloodPressure');
              } else {
                context.read<InsightsBloc>().add(
                  InsightsEvent.changePeriod(
                    chartType: 'bloodPressure',
                    period: period,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              if (bpRecords.isEmpty) {
                return SizedBox(
                  height: constraints.maxWidth < 600 ? 180 : 200,
                  child: const Center(
                    child: Text(
                      'No blood pressure data available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }

              return SizedBox(
                height: constraints.maxWidth < 600 ? 180 : 200,
                child: LineChart(
                  LineChartData(
                    minY: bpRange.min,
                    maxY: bpRange.max,
                    gridData: const FlGridData(show: true),
                    titlesData: _buildTitlesData(bpRecords, bpInterval),
                    borderData: FlBorderData(show: false),
                    lineTouchData: _buildTouchData(bpRecords),
                    lineBarsData: _buildLineBars(bpRecords),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  FlTitlesData _buildTitlesData(List<HealthRecord> records, double interval) {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 50,
          interval: interval,
          getTitlesWidget: (value, meta) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              value.toInt().toString(),
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: records.length > 10 ? 2 : 1,
          getTitlesWidget: (value, meta) {
            final index = value.toInt();
            if (index >= 0 && index < records.length) {
              final record = records[records.length - 1 - index];
              final month = ChartUtils.getMonthAbbreviation(record.timestamp.month);
              return Transform.rotate(
                angle: -0.785398,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$month ${record.timestamp.day}',
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              );
            }
            return const Text('');
          },
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  LineTouchData _buildTouchData(List<HealthRecord> records) {
    return LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((spot) {
            final index = spot.x.toInt();
            if (index >= 0 && index < records.length) {
              final record = records[records.length - 1 - index];
              final isSystolic = spot.barIndex == 0;
              final isAveraged = ChartUtils.isAveragedRecord(record, averagedDates);
              final dateFormat = isAveraged
                  ? DateFormat('MMM dd, yyyy')
                  : DateFormat('MMM dd, yyyy HH:mm');
              return LineTooltipItem(
                '${isSystolic ? 'SYS' : 'DIA'}: ${spot.y.toStringAsFixed(0)}\n${dateFormat.format(record.timestamp)}',
                const TextStyle(color: Colors.white, fontSize: 12),
              );
            }
            return null;
          }).toList();
        },
      ),
    );
  }

  List<LineChartBarData> _buildLineBars(List<HealthRecord> records) {
    return [
      _createLineBar(records, true, Colors.blue),
      _createLineBar(records, false, Colors.green),
    ];
  }

  LineChartBarData _createLineBar(
    List<HealthRecord> records,
    bool isSystolic,
    Color color,
  ) {
    return LineChartBarData(
      spots: ChartUtils.createSpots(
        records,
        (r) => isSystolic ? r.systolic.toDouble() : r.diastolic.toDouble(),
      ),
      isCurved: records.length > 1,
      color: color,
      barWidth: 3,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          final recordIndex = records.length - 1 - index.toInt();
          if (recordIndex >= 0 && recordIndex < records.length) {
            final record = records[recordIndex];
            final isAveraged = ChartUtils.isAveragedRecord(record, averagedDates);
            return FlDotCirclePainter(
              radius: 4,
              color: isAveraged ? Colors.black : color,
              strokeWidth: 2,
              strokeColor: Colors.white,
            );
          }
          return FlDotCirclePainter(
            radius: 4,
            color: color,
            strokeWidth: 2,
            strokeColor: Colors.white,
          );
        },
      ),
      show: records.length > 1,
    );
  }
}
