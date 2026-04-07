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

class SingleMetricChart extends StatelessWidget {
  final String title;
  final Color color;
  final List<HealthRecord> records;
  final Set<String> averagedDates;
  final String selectedPeriod;
  final double Function(HealthRecord) getValue;
  final String unit;
  final String? valueLabel;
  final String chartType;
  final String? emptyMessage;
  final VoidCallback? onFullscreen;
  final Function(String) onCustomDatePicker;

  const SingleMetricChart({
    super.key,
    required this.title,
    required this.color,
    required this.records,
    required this.averagedDates,
    required this.selectedPeriod,
    required this.getValue,
    required this.unit,
    this.valueLabel,
    required this.chartType,
    this.emptyMessage,
    this.onFullscreen,
    required this.onCustomDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    final values = records.map((r) => getValue(r)).toList();
    final interval = ChartUtils.calculateYAxisInterval(values);
    final range = ChartUtils.calculatePaddedRange(values);

    return ChartContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChartHeader(
            title: title,
            color: color,
            onFullscreen: onFullscreen,
          ),
          const SizedBox(height: 16),
          PeriodSelector(
            currentPeriod: selectedPeriod,
            onPeriodSelected: (period) {
              if (period == 'Custom') {
                onCustomDatePicker(chartType);
              } else {
                context.read<InsightsBloc>().add(
                  InsightsEvent.changePeriod(
                    chartType: chartType,
                    period: period,
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              if (records.isEmpty) {
                return SizedBox(
                  height: constraints.maxWidth < 600 ? 180 : 200,
                  child: Center(
                    child: Text(
                      emptyMessage ?? 'No data available',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              }

              return SizedBox(
                height: constraints.maxWidth < 600 ? 180 : 200,
                child: LineChart(
                  LineChartData(
                    minY: range.min,
                    maxY: range.max,
                    gridData: const FlGridData(show: true),
                    titlesData: _buildTitlesData(interval),
                    borderData: FlBorderData(show: false),
                    lineTouchData: _buildTouchData(),
                    lineBarsData: _buildLineBars(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  FlTitlesData _buildTitlesData(double interval) {
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
            if (records.isEmpty) return const Text('');
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

  LineTouchData _buildTouchData() {
    return LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((spot) {
            final index = spot.x.toInt();
            if (index >= 0 && index < records.length) {
              final record = records[records.length - 1 - index];
              final isAveraged = ChartUtils.isAveragedRecord(record, averagedDates);
              final dateFormat = isAveraged
                  ? DateFormat('MMM dd, yyyy')
                  : DateFormat('MMM dd, yyyy HH:mm');
              final label = valueLabel ?? title;
              final formattedValue = unit == '%' 
                  ? spot.y.toStringAsFixed(1) 
                  : spot.y.toStringAsFixed(0);
              return LineTooltipItem(
                '$label: $formattedValue $unit\n${dateFormat.format(record.timestamp)}',
                const TextStyle(color: Colors.white, fontSize: 12),
              );
            }
            return null;
          }).toList();
        },
      ),
    );
  }

  List<LineChartBarData> _buildLineBars() {
    final spots = ChartUtils.createSpots(records, getValue);
    
    return [
      LineChartBarData(
        spots: spots,
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
                radius: records.length == 1 ? 6 : 4,
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
      ),
      if (records.length == 1)
        LineChartBarData(
          spots: spots,
          isCurved: false,
          color: Colors.transparent,
          barWidth: 0,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              final recordIndex = records.length - 1 - index.toInt();
              if (recordIndex >= 0 && recordIndex < records.length) {
                final record = records[recordIndex];
                final isAveraged = ChartUtils.isAveragedRecord(record, averagedDates);
                return FlDotCirclePainter(
                  radius: 6,
                  color: isAveraged ? Colors.black : color,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              }
              return FlDotCirclePainter(
                radius: 6,
                color: color,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
        ),
    ];
  }
}
