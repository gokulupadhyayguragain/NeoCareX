import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/features/home/data/entity/health_record.dart';
import 'package:patient_app/features/insight/presentation/widget/metric_card.dart';
import 'package:patient_app/features/insight/presentation/widget/stats_table.dart';
import 'package:patient_app/features/insight/presentation/bloc/insights_bloc.dart';
import 'package:patient_app/features/insight/presentation/widget/chart_shimmer.dart';
import 'package:patient_app/features/insight/presentation/widget/blood_pressure_chart.dart';
import 'package:patient_app/features/insight/presentation/widget/pulse_chart.dart';
import 'package:patient_app/features/insight/presentation/widget/blood_sugar_chart.dart';
import 'package:patient_app/features/insight/presentation/widget/oxygen_chart.dart';
import 'package:patient_app/features/insight/presentation/widget/body_weight_chart.dart';
import 'package:patient_app/features/summarization/data/models/summarization_model.dart';
import 'package:patient_app/features/summarization/data/services/summarization_service.dart';

enum ChartType { bloodPressure, bloodSugar, oxygen, pulse, bodyWeight }

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InsightsBloc()..add(const InsightsEvent.fetchObservations()),
      child: const _InsightsPageContent(),
    );
  }
}

class _InsightsPageContent extends StatefulWidget {
  const _InsightsPageContent();

  @override
  State<_InsightsPageContent> createState() => _InsightsPageContentState();
}

class _InsightsPageContentState extends State<_InsightsPageContent> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  DateTimeRange? _selectedRange;
  final SummarizationService _summarizationService = SummarizationService();
  List<HealthMetric> _metrics = [];

  @override
  void initState() {
    super.initState();
    _fetchMetrics();
  }

  Future<void> _fetchMetrics() async {
    try {
      final data = await _summarizationService.getSummarization();
      if (data.summaries.isNotEmpty) {
        setState(() {
          _metrics = data.summaries.first.metrics;
        });
      }
    } catch (e) {
      debugPrint('Error fetching metrics: $e');
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _showDatePickerDialog(
    BuildContext context,
    bool isStartDate,
  ) async {
    final now = DateTime.now();
    final initialDate = isStartDate
        ? (_selectedRange?.start ?? now.subtract(const Duration(days: 30)))
        : (_selectedRange?.end ?? now);

    final pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 360),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CalendarDatePicker(
                    initialDate: initialDate,
                    firstDate: DateTime(now.year - 5),
                    lastDate: now,
                    onDateChanged: (DateTime date) {
                      Navigator.of(context).pop(date);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (pickedDate != null) {
      final formattedDate = _formatDate(pickedDate);
      if (isStartDate) {
        _startDateController.text = formattedDate;
      } else {
        _endDateController.text = formattedDate;
      }
      _handleDateRangeSelection();
    }
  }

  void _handleDateRangeSelection() {
    if (_startDateController.text.isNotEmpty &&
        _endDateController.text.isNotEmpty) {
      try {
        final startParts = _startDateController.text.split('-');
        final endParts = _endDateController.text.split('-');

        if (startParts.length == 3 && endParts.length == 3) {
          final startDate = DateTime(
            int.parse(startParts[0]),
            int.parse(startParts[1]),
            int.parse(startParts[2]),
          );
          final endDate = DateTime(
            int.parse(endParts[0]),
            int.parse(endParts[1]),
            int.parse(endParts[2]),
          );

          if (startDate.isBefore(endDate) ||
              startDate.isAtSameMomentAs(endDate)) {
            setState(() {
              _selectedRange = DateTimeRange(start: startDate, end: endDate);
            });

            context.read<InsightsBloc>().add(
              InsightsEvent.selectCustomDateRange(
                chartType: 'all',
                dateRange: _selectedRange!,
              ),
            );
          }
        }
      } catch (e) {
        debugPrint('Date parsing error: $e');
      }
    }
  }

  void _clearDateRange() {
    setState(() {
      _selectedRange = null;
      _startDateController.clear();
      _endDateController.clear();
    });
    context.read<InsightsBloc>().add(const InsightsEvent.fetchObservations());
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 800;
            return Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    _buildTabBar(context, isWide),
                    Expanded(child: _buildContent(context, isWide)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, bool isWide) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (context, state) {
        final selectedTab = state.maybeWhen(
          loaded: (_, _, _, selectedTab, _, _, _, _, _, _, _, _, _, _) =>
              selectedTab,
          orElse: () => 0,
        );

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (isWide) const Spacer(),
              _buildTab(context, 'Graph', 0, selectedTab),
              _buildTab(context, 'Stats', 1, selectedTab),
              if (isWide) const Spacer(),
              IconButton(
                onPressed: () => context.read<InsightsBloc>().add(
                  const InsightsEvent.fetchObservations(),
                ),
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh data',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(
    BuildContext context,
    String title,
    int index,
    int selectedTab,
  ) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () =>
              context.read<InsightsBloc>().add(InsightsEvent.changeTab(index)),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isWide) {
    return BlocBuilder<InsightsBloc, InsightsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Initializing...')),
          loading: () => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: List.generate(
                5,
                (index) => SizedBox(
                  width: isWide ? 560 : double.infinity,
                  child: const ChartShimmer(),
                ),
              ),
            ),
          ),
          loaded:
              (
                observations,
                healthRecords,
                averagedDates,
                selectedTab,
                selectedPeriodBloodPressure,
                selectedPeriodPulse,
                selectedPeriodOxygen,
                selectedPeriodBloodSugar,
                selectedPeriodBodyWeight,
                customDateRangeBloodPressure,
                customDateRangePulse,
                customDateRangeOxygen,
                customDateRangeBloodSugar,
                customDateRangeBodyWeight,
              ) {
                if (healthRecords.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.data_usage_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text('No health data available'),
                      ],
                    ),
                  );
                }

                return _buildChartsContent(
                  context,
                  healthRecords,
                  averagedDates,
                  selectedTab,
                  selectedPeriodBloodPressure,
                  selectedPeriodPulse,
                  selectedPeriodOxygen,
                  selectedPeriodBloodSugar,
                  selectedPeriodBodyWeight,
                  _selectedRange,
                  _selectedRange,
                  _selectedRange,
                  _selectedRange,
                  _selectedRange,
                  isWide,
                );
              },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: $message'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<InsightsBloc>().add(
                    const InsightsEvent.fetchObservations(),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChartsContent(
    BuildContext context,
    List<HealthRecord> records,
    Set<String> averagedDates,
    int selectedTab,
    String selectedPeriodBloodPressure,
    String selectedPeriodPulse,
    String selectedPeriodOxygen,
    String selectedPeriodBloodSugar,
    String selectedPeriodBodyWeight,
    DateTimeRange? customDateRangeBloodPressure,
    DateTimeRange? customDateRangePulse,
    DateTimeRange? customDateRangeOxygen,
    DateTimeRange? customDateRangeBloodSugar,
    DateTimeRange? customDateRangeBodyWeight,
    bool isWide,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (selectedTab == 0) _buildDateRangeSelector(context),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              if (selectedTab == 0) ...[
                _chartWrapper(
                  BloodPressureChart(
                    records: _filterRecordsByPeriod(
                      records,
                      _selectedRange != null
                          ? 'Custom'
                          : selectedPeriodBloodPressure,
                      customDateRangeBloodPressure,
                    ),
                    averagedDates: averagedDates,
                    selectedPeriod: _selectedRange != null
                        ? 'Custom'
                        : selectedPeriodBloodPressure,
                    onFullscreen: () => _showFullscreenChart(
                      context: context,
                      chartType: ChartType.bloodPressure,
                      records: records,
                      averagedDates: averagedDates,
                    ),
                    onCustomDatePicker: (type) => {},
                  ),
                  isWide,
                ),
                _chartWrapper(
                  PulseChart(
                    records: _filterRecordsByPeriod(
                      records,
                      _selectedRange != null ? 'Custom' : selectedPeriodPulse,
                      customDateRangePulse,
                    ),
                    averagedDates: averagedDates,
                    selectedPeriod: _selectedRange != null
                        ? 'Custom'
                        : selectedPeriodPulse,
                    onFullscreen: () => _showFullscreenChart(
                      context: context,
                      chartType: ChartType.pulse,
                      records: records,
                      averagedDates: averagedDates,
                    ),
                    onCustomDatePicker: (type) => {},
                  ),
                  isWide,
                ),
                _chartWrapper(
                  BloodSugarChart(
                    records: _filterRecordsByPeriod(
                      records,
                      _selectedRange != null
                          ? 'Custom'
                          : selectedPeriodBloodSugar,
                      customDateRangeBloodSugar,
                    ),
                    averagedDates: averagedDates,
                    selectedPeriod: _selectedRange != null
                        ? 'Custom'
                        : selectedPeriodBloodSugar,
                    onFullscreen: () => _showFullscreenChart(
                      context: context,
                      chartType: ChartType.bloodSugar,
                      records: records,
                      averagedDates: averagedDates,
                    ),
                    onCustomDatePicker: (type) => {},
                  ),
                  isWide,
                ),
                _chartWrapper(
                  OxygenChart(
                    records: _filterRecordsByPeriod(
                      records,
                      _selectedRange != null ? 'Custom' : selectedPeriodOxygen,
                      customDateRangeOxygen,
                    ),
                    averagedDates: averagedDates,
                    selectedPeriod: _selectedRange != null
                        ? 'Custom'
                        : selectedPeriodOxygen,
                    onFullscreen: () => _showFullscreenChart(
                      context: context,
                      chartType: ChartType.oxygen,
                      records: records,
                      averagedDates: averagedDates,
                    ),
                    onCustomDatePicker: (type) => {},
                  ),
                  isWide,
                ),
                _chartWrapper(
                  BodyWeightChart(
                    records: _filterRecordsByPeriod(
                      records,
                      _selectedRange != null
                          ? 'Custom'
                          : selectedPeriodBodyWeight,
                      customDateRangeBodyWeight,
                    ),
                    averagedDates: averagedDates,
                    selectedPeriod: _selectedRange != null
                        ? 'Custom'
                        : selectedPeriodBodyWeight,
                    onFullscreen: () => _showFullscreenChart(
                      context: context,
                      chartType: ChartType.bodyWeight,
                      records: records,
                      averagedDates: averagedDates,
                    ),
                    onCustomDatePicker: (type) => {},
                  ),
                  isWide,
                ),
              ] else if (selectedTab == 1) ...[
                _buildStats(records),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateRangeSelector(BuildContext context) {
    return Container(
      width: _selectedRange != null ? 400 : 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            child: _DateRangeTextFieldWithCalendar(
              controller: _startDateController,
              hintText: 'YYYY-MM-DD',
              onChanged: (value) => _handleDateRangeSelection(),
              headerColor: Theme.of(context).primaryColor,
              onCalendarTap: () => _showDatePickerDialog(context, true),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'to',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 140,
            child: _DateRangeTextFieldWithCalendar(
              controller: _endDateController,
              hintText: 'YYYY-MM-DD',
              onChanged: (value) => _handleDateRangeSelection(),
              headerColor: Theme.of(context).primaryColor,
              onCalendarTap: () => _showDatePickerDialog(context, false),
            ),
          ),
          if (_selectedRange != null) ...[
            const SizedBox(width: 12),
            Tooltip(
              message: 'Clear date range',
              child: IconButton(
                onPressed: _clearDateRange,
                icon: Icon(Icons.clear, color: Colors.grey.shade600),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _chartWrapper(Widget chart, bool isWide) {
    return SizedBox(width: isWide ? 560 : double.infinity, child: chart);
  }

  List<HealthRecord> _filterRecordsByPeriod(
    List<HealthRecord> records,
    String period,
    DateTimeRange? customRange,
  ) {
    if (period == 'All') return records;

    final now = DateTime.now();
    DateTime startDate;

    if (period == 'Custom' && customRange != null) {
      return records.where((record) {
        return record.timestamp.isAfter(customRange.start) &&
            record.timestamp.isBefore(
              customRange.end.add(const Duration(days: 1)),
            );
      }).toList();
    }

    switch (period) {
      case '1D':
        startDate = now.subtract(const Duration(days: 1));
        break;
      case '1W':
        startDate = now.subtract(const Duration(days: 7));
        break;
      case '1M':
        startDate = now.subtract(const Duration(days: 30));
        break;
      case '1Y':
        startDate = now.subtract(const Duration(days: 365));
        break;
      default:
        return records;
    }

    return records
        .where((record) => record.timestamp.isAfter(startDate))
        .toList();
  }

  Widget _buildStats(List<HealthRecord> records) {
    if (records.isEmpty) return const Text('No stats available');
    final latest = records.first;

    double avg(List<int> values) =>
        values.isEmpty ? 0 : values.reduce((a, b) => a + b) / values.length;
    double avgDouble(List<double> values) =>
        values.isEmpty ? 0 : values.reduce((a, b) => a + b) / values.length;

    final systolics = records.map((r) => r.systolic).toList();
    final diastolics = records.map((r) => r.diastolic).toList();
    final pulses = records.map((r) => r.pulse).toList();
    final sugars = records.map((r) => r.bloodSugar).toList();

    final targetMetrics = _metrics.where((metric) {
      final label = metric.label.toLowerCase();
      return label.contains('blood glucose(fasting)') ||
          label.contains('blood pressure diastolic') ||
          label.contains('cholesterol');
    }).toList();

    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Current Statistics',
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          StatsTable(
            rows: [
              TableRowData(
                title: "SYS",
                average: avg(systolics).toStringAsFixed(1),
                latest: "${latest.systolic}",
              ),
              TableRowData(
                title: "DIA",
                average: avg(diastolics).toStringAsFixed(1),
                latest: "${latest.diastolic}",
              ),
              TableRowData(
                title: "Pulse",
                average: avg(pulses).toStringAsFixed(1),
                latest: "${latest.pulse}",
              ),
              TableRowData(
                title: "Sugar",
                average: avgDouble(sugars).toStringAsFixed(1),
                latest: "${latest.bloodSugar}",
              ),
            ],
            isMobile: isMobile,
          ),
          const SizedBox(height: 24),

          if (targetMetrics.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Your measurement predictions in the next two weeks based on your current diet and activity levels will be:',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                childAspectRatio: isMobile ? 2.5 : 1.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: targetMetrics.length,
              itemBuilder: (context, index) {
                return MetricCard(metric: targetMetrics[index]);
              },
            ),
          ],
        ],
      ),
    );
  }

  void _showFullscreenChart({
    required BuildContext context,
    required ChartType chartType,
    required List<HealthRecord> records,
    required Set<String> averagedDates,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog.fullscreen(
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AspectRatio(
                      aspectRatio: 1.5,
                      child: Builder(
                        builder: (builderContext) {
                          switch (chartType) {
                            case ChartType.bloodPressure:
                              return BloodPressureChart(
                                records: records,
                                averagedDates: averagedDates,
                                selectedPeriod: 'All',
                                onCustomDatePicker: (_) {},
                              );
                            case ChartType.bloodSugar:
                              return BloodSugarChart(
                                records: records,
                                averagedDates: averagedDates,
                                selectedPeriod: 'All',
                                onCustomDatePicker: (_) {},
                              );
                            case ChartType.oxygen:
                              return OxygenChart(
                                records: records,
                                averagedDates: averagedDates,
                                selectedPeriod: 'All',
                                onCustomDatePicker: (_) {},
                              );
                            case ChartType.pulse:
                              return PulseChart(
                                records: records,
                                averagedDates: averagedDates,
                                selectedPeriod: 'All',
                                onCustomDatePicker: (_) {},
                              );
                            case ChartType.bodyWeight:
                              return BodyWeightChart(
                                records: records,
                                averagedDates: averagedDates,
                                selectedPeriod: 'All',
                                onCustomDatePicker: (_) {},
                              );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey, size: 32),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DateRangeTextFieldWithCalendar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final Color headerColor;
  final VoidCallback onCalendarTap;

  const _DateRangeTextFieldWithCalendar({
    required this.controller,
    required this.hintText,
    this.onChanged,
    required this.headerColor,
    required this.onCalendarTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _DateInputFormatter(),
          _LimitedLengthTextInputFormatter(10),
        ],
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: headerColor.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: headerColor, width: 2),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today, size: 16, color: headerColor),
            onPressed: onCalendarTap,
            padding: const EdgeInsets.all(2),
            constraints: const BoxConstraints(),
          ),
        ),
      ),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final RegExp dateRegex = RegExp(r'^(\d{0,4})-?(\d{0,2})-?(\d{0,2})$');
    String formattedText = '';
    final StringBuffer buffer = StringBuffer();

    if (!dateRegex.hasMatch(newValue.text)) {
      return oldValue;
    }

    final RegExpMatch match = dateRegex.firstMatch(newValue.text)!;
    final String year = match.group(1) ?? '';
    final String month = match.group(2) ?? '';
    final String day = match.group(3) ?? '';

    buffer.write(year);

    if (month.isNotEmpty) {
      final int monthValue = int.tryParse(month) ?? 0;
      if (monthValue > 12) {
        buffer.write('-');
        buffer.write(month.substring(0, 1));
      } else if (month.length == 2 && monthValue < 10) {
        buffer.write('-');
        buffer.write('0$monthValue');
      } else if (month.length == 1 && monthValue > 1) {
        buffer.write('-');
        buffer.write('0$monthValue');
      } else {
        buffer.write('-');
        buffer.write(month);
      }
    }

    if (day.isNotEmpty) {
      final int dayValue = int.tryParse(day) ?? 0;
      if (dayValue > 31) {
        buffer.write('-');
        buffer.write(day.substring(0, 1));
      } else if (day.length == 2 && dayValue < 10) {
        buffer.write('-');
        buffer.write('0$dayValue');
      } else if (day.length == 1 && dayValue > 3) {
        buffer.write('-');
        buffer.write('0$dayValue');
      } else {
        buffer.write('-');
        buffer.write(day);
      }
    }

    formattedText = buffer.toString();

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class _LimitedLengthTextInputFormatter extends TextInputFormatter {
  final int maxLength;
  _LimitedLengthTextInputFormatter(this.maxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > maxLength) {
      return oldValue;
    }
    return newValue;
  }
}
