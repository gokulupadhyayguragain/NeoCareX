import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:patient_app/features/home/data/services/health_api_service.dart';
import '../../data/datasources/health_remote_datasource.dart';
import '../../data/repositories/health_repository_impl.dart';
import '../../data/models/health_data_model.dart';
import '../bloc/history_bloc.dart';
import '../widgets/health_data_card.dart';
import '../widgets/shimmer_card.dart';
import '../widgets/daily_nutrition_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        repository: HealthRepositoryImpl(
          remoteDataSource: HealthRemoteDataSourceImpl(dio: Dio()),
          healthApiService: HealthApiService(),
        ),
      )..add(const HistoryEvent.fetchHealthData()),
      child: const HistoryPageView(),
    );
  }
}

class HistoryPageView extends StatefulWidget {
  const HistoryPageView({super.key});

  @override
  State<HistoryPageView> createState() => _HistoryPageViewState();
}

class _HistoryPageViewState extends State<HistoryPageView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;
  DateTimeRange? _selectedRange;

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _shimmerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );
    _shimmerController.repeat();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _shimmerController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  HealthDataType _getCurrentType() {
    switch (_tabController.index) {
      case 0:
        return HealthDataType.bloodSugar;
      case 1:
        return HealthDataType.bloodPressure;
      case 2:
        return HealthDataType.bodyWeight;
      case 3:
        return HealthDataType.pulse;
      case 4:
        return HealthDataType.oxygenLevel;
      case 5:
        return HealthDataType.nutrition;
      default:
        return HealthDataType.bloodSugar;
    }
  }

  Color _getCurrentColor() {
    switch (_tabController.index) {
      case 0:
        return const Color.fromARGB(255, 132, 10, 1);
      case 1:
        return const Color.fromARGB(255, 110, 1, 129);
      case 2:
        return const Color.fromARGB(255, 1, 100, 5);
      case 3:
        return const Color.fromARGB(255, 2, 72, 129);
      case 4:
        return const Color.fromARGB(255, 1, 129, 129);
      case 5:
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  Color _getHeaderColorForTab() {
    switch (_tabController.index) {
      case 0:
        return const Color.fromARGB(255, 132, 10, 1);
      case 1:
        return const Color.fromARGB(255, 96, 1, 112);
      case 2:
        return const Color.fromARGB(255, 2, 95, 5);
      case 3:
        return const Color.fromARGB(255, 3, 60, 106);
      case 4:
        return const Color.fromARGB(255, 1, 100, 100);
      case 5:
        return Colors.orange;
      default:
        return const Color(0xFFD32F2F);
    }
  }

  String _getTypeLabel(HealthDataType type) {
    switch (type) {
      case HealthDataType.bloodSugar:
        return 'Blood Sugar';
      case HealthDataType.bloodPressure:
        return 'Blood Pressure';
      case HealthDataType.bodyWeight:
        return 'Body Weight';
      case HealthDataType.pulse:
        return 'Pulse Rate';
      case HealthDataType.oxygenLevel:
        return 'Oxygen Level';
      case HealthDataType.nutrition:
        return 'Nutrition';
    }
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
            23,
            59,
            59,
            999,
            999,
          );

          setState(() {
            _selectedRange = DateTimeRange(start: startDate, end: endDate);
          });
          context.read<HistoryBloc>().add(
            HistoryEvent.filterByDateRange(_selectedRange!),
          );
        }
      } catch (e) {
        debugPrint('Date parsing error: $e');
      }
    }
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Health History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey.shade800),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<HistoryBloc>().add(
                const HistoryEvent.refreshHealthData(),
              );
              _startDateController.clear();
              _endDateController.clear();
              _selectedRange = null;
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: Center(
              child: SizedBox(
                width: isDesktop ? 1000 : double.infinity,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'Blood Sugar'),
                    Tab(text: 'Blood Pressure'),
                    Tab(text: 'Body Weight'),
                    Tab(text: 'Pulse'),
                    Tab(text: 'Oxygen Level'),
                    Tab(text: 'Nutrition'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildDateRangeInputBar(context, isDesktop),
              _buildHeader(isDesktop),
              Expanded(
                child: state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => _buildShimmerList(isDesktop),
                  loaded: (healthData) => _buildDataList(healthData, isDesktop),
                  error: (message) => _buildErrorView(message, context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isDesktop) {
    final headerColor = _getHeaderColorForTab();

    return Center(
      child: Container(
        width: isDesktop ? 800 : double.infinity,
        margin: EdgeInsets.fromLTRB(
          isDesktop ? 24 : 16,
          0,
          isDesktop ? 24 : 16,
          0,
        ),
        decoration: BoxDecoration(
          color: headerColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: Border(
            left: BorderSide(color: headerColor, width: 3),
            right: BorderSide(color: headerColor, width: 3),
            top: BorderSide(color: headerColor, width: 3),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(children: [const Spacer()]),
      ),
    );
  }

  Widget _buildDateRangeInputBar(BuildContext context, bool isDesktop) {
    final headerColor = _getHeaderColorForTab();
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 160,
              child: _DateRangeTextFieldWithCalendar(
                controller: _startDateController,
                hintText: 'YYYY-MM-DD',
                onChanged: (value) => _handleDateRangeSelection(),
                headerColor: headerColor,
                onCalendarTap: () => _showDatePickerDialog(context, true),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'to',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 160,
              child: _DateRangeTextFieldWithCalendar(
                controller: _endDateController,
                hintText: 'YYYY-MM-DD',
                onChanged: (value) => _handleDateRangeSelection(),
                headerColor: headerColor,
                onCalendarTap: () => _showDatePickerDialog(context, false),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Widget _buildDataList(
    Map<HealthDataType, List<HealthDataModel>> healthData,
    bool isDesktop,
  ) {
    final currentType = _getCurrentType();
    final data = healthData[currentType] ?? [];
    final color = _getCurrentColor();
    final headerColor = _getHeaderColorForTab();

    List<Widget> contentWidgets = [];

    if (currentType == HealthDataType.nutrition) {
      final groupedByDate = <String, List<HealthDataModel>>{};
      for (final entry in data) {
        if (!groupedByDate.containsKey(entry.date)) {
          groupedByDate[entry.date] = [];
        }
        groupedByDate[entry.date]!.add(entry);
      }

      contentWidgets = groupedByDate.entries.map((entry) {
        final dateKey = entry.key;
        final entries = entry.value;

        double totalCalories = 0;
        double totalProtein = 0;
        double totalCarbs = 0;
        double totalFat = 0;

        for (final item in entries) {
          totalCalories += double.tryParse(item.value) ?? 0;

          final proteinStr = item.additionalInfo['protein'] as String? ?? '0 g';
          final carbsStr = item.additionalInfo['carbs'] as String? ?? '0 g';
          final fatStr = item.additionalInfo['fat'] as String? ?? '0 g';

          totalProtein += double.tryParse(proteinStr.split(' ')[0]) ?? 0;
          totalCarbs += double.tryParse(carbsStr.split(' ')[0]) ?? 0;
          totalFat += double.tryParse(fatStr.split(' ')[0]) ?? 0;
        }

        return DailyNutritionCard(
          key: ValueKey(dateKey),
          date: dateKey,
          nutritionEntries: entries,
          isDesktop: isDesktop,
          totalCalories: totalCalories,
          totalProtein: totalProtein,
          totalCarbs: totalCarbs,
          totalFat: totalFat,
        );
      }).toList();
    }

    return Center(
      child: Container(
        width: isDesktop ? 800 : double.infinity,
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: headerColor, width: 3),
            right: BorderSide(color: headerColor, width: 3),
            bottom: BorderSide(color: headerColor, width: 3),
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: data.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconForType(currentType),
                      size: 64,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No ${_getTypeLabel(currentType).toLowerCase()} data available',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: currentType == HealthDataType.nutrition
                    ? contentWidgets.length
                    : data.length,
                itemBuilder: (context, index) {
                  if (currentType == HealthDataType.nutrition) {
                    return contentWidgets[index];
                  } else {
                    return HealthDataCard(
                      data: data[index],
                      type: currentType,
                      color: color,
                      isDesktop: isDesktop,
                    );
                  }
                },
              ),
      ),
    );
  }

  Widget _buildShimmerList(bool isDesktop) {
    final headerColor = _getHeaderColorForTab();

    return Center(
      child: Container(
        width: isDesktop ? 800 : double.infinity,
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: headerColor.withValues(alpha: 0.5)),
            right: BorderSide(color: headerColor.withValues(alpha: 0.5)),
            bottom: BorderSide(color: headerColor.withValues(alpha: 0.5)),
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ShimmerCard(
              isDesktop: isDesktop,
              shimmerAnimation: _shimmerAnimation,
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorView(String message, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<HistoryBloc>().add(
                const HistoryEvent.refreshHealthData(),
              );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
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
            horizontal: 12,
            vertical: 10,
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
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade500),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today, size: 20, color: headerColor),
            onPressed: onCalendarTap,
            padding: const EdgeInsets.all(8),
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
