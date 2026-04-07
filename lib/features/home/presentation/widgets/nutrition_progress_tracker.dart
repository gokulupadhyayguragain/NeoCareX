import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/features/home/data/models/observations_model.dart';
import 'package:patient_app/features/home/data/services/health_api_service.dart';
import 'package:shimmer/shimmer.dart';

class NutritionProgressTracker extends StatefulWidget {
  final String patientId;
  final VoidCallback? onRefresh;

  const NutritionProgressTracker({
    super.key,
    required this.patientId,
    this.onRefresh,
  });

  @override
  State<NutritionProgressTracker> createState() =>
      NutritionProgressTrackerState();
}

class NutritionProgressTrackerState extends State<NutritionProgressTracker> {
  late final HealthApiService _healthApiService;
  double _totalCalories = 0;
  double _totalProtein = 0;
  double _totalCarbs = 0;
  double _totalFat = 0;
  bool _loading = true;

  static const double _calorieTarget = 2500;
  static const double _proteinTarget = 150;
  static const double _carbsTarget = 300;
  static const double _fatTarget = 100;

  @override
  void initState() {
    super.initState();
    _healthApiService = HealthApiService();
    _fetchTodayNutritionData();
  }

  Future<void> _fetchTodayNutritionData() async {
    try {
      setState(() => _loading = true);

      final observations = await _healthApiService.fetchNutritionObservations(
        widget.patientId,
      );

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final todayObservations = observations.where((obs) {
        final effectiveDate = _extractDate(obs);
        final obsDate = DateTime(
          effectiveDate.year,
          effectiveDate.month,
          effectiveDate.day,
        );
        return obsDate.isAtSameMomentAs(today);
      }).toList();

      _calculateTotals(todayObservations);

      setState(() => _loading = false);
    } catch (e) {
      debugPrint('[NutritionProgressTracker] Error: $e');
      setState(() => _loading = false);
    }
  }

  DateTime _extractDate(Observation obs) {
    if (obs.effective?.dateTime != null) {
      try {
        return DateTime.parse(obs.effective!.dateTime!);
      } catch (e) {
        debugPrint('Could not parse effective date: $e');
      }
    }

    if (obs.meta?.lastUpdated != null) {
      try {
        return DateTime.parse(obs.meta!.lastUpdated!);
      } catch (e) {
        debugPrint('Could not parse lastUpdated: $e');
      }
    }

    return DateTime.now();
  }

  void _calculateTotals(List<Observation> observations) {
    double calories = 0;
    double protein = 0;
    double carbs = 0;
    double fat = 0;

    for (final obs in observations) {
      calories += obs.value?.quantity?.value?.toDouble() ?? 0;

      if (obs.component != null) {
        for (final component in obs.component!) {
          final display =
              component.code?.coding?.firstOrNull?.display?.toLowerCase() ?? '';
          final value = component.value?.quantity?.value?.toDouble() ?? 0;

          if (display.contains('protein')) {
            protein += value;
          } else if (display.contains('carbohydrate')) {
            carbs += value;
          } else if (display.contains('fat')) {
            fat += value;
          }
        }
      }
    }

    setState(() {
      _totalCalories = calories;
      _totalProtein = protein;
      _totalCarbs = carbs;
      _totalFat = fat;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "24 Hours Nutrition Analysis",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('MMMM dd, yyyy').format(DateTime.now()),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              /* IconButton(
                onPressed: _fetchTodayNutritionData,
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh nutrition data',
              ), */
            ],
          ),
          const SizedBox(height: 20),

          if (_loading)
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(children: _buildShimmerItems(isMobile)),
            )
          else
            Column(
              children: [
                _buildProgressItem(
                  label: 'Calories',
                  current: _totalCalories,
                  target: _calorieTarget,
                  unit: 'kcal',
                  color: Colors.red[400]!,
                ),
                const SizedBox(height: 16),

                _buildProgressItem(
                  label: 'Protein',
                  current: _totalProtein,
                  target: _proteinTarget,
                  unit: 'g',
                  color: Colors.blue[400]!,
                ),
                const SizedBox(height: 16),

                _buildProgressItem(
                  label: 'Carbohydrates',
                  current: _totalCarbs,
                  target: _carbsTarget,
                  unit: 'g',
                  color: Colors.orange[400]!,
                ),
                const SizedBox(height: 16),

                _buildProgressItem(
                  label: 'Fat',
                  current: _totalFat,
                  target: _fatTarget,
                  unit: 'g',
                  color: Colors.green[400]!,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildProgressItem({
    required String label,
    required double current,
    required double target,
    required String unit,
    required Color color,
  }) {
    final progress = (current / target).clamp(0.0, 1.0);
    final percentage = (progress * 100).toStringAsFixed(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              '${current.toStringAsFixed(1)} / ${target.toStringAsFixed(0)} $unit',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,

              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: color,

                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '$percentage%',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildShimmerItems(bool isMobile) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: isMobile ? 12 : 14,
                width: 80,
                color: Colors.grey[300],
              ),
              Container(
                height: isMobile ? 10 : 12,
                width: 120,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: isMobile ? 6 : 8, color: Colors.grey[300]),
        ],
      ),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: isMobile ? 12 : 14,
                width: 70,
                color: Colors.grey[300],
              ),
              Container(
                height: isMobile ? 10 : 12,
                width: 120,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: isMobile ? 6 : 8, color: Colors.grey[300]),
        ],
      ),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: isMobile ? 12 : 14,
                width: 100,
                color: Colors.grey[300],
              ),
              Container(
                height: isMobile ? 10 : 12,
                width: 120,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: isMobile ? 6 : 8, color: Colors.grey[300]),
        ],
      ),
      const SizedBox(height: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: isMobile ? 12 : 14,
                width: 50,
                color: Colors.grey[300],
              ),
              Container(
                height: isMobile ? 10 : 12,
                width: 120,
                color: Colors.grey[300],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: isMobile ? 6 : 8, color: Colors.grey[300]),
        ],
      ),
    ];
  }

  Future<void> refreshData() async {
    await _fetchTodayNutritionData();
  }
}
