import 'package:flutter/material.dart';
import 'package:patient_app/features/history/data/models/health_data_model.dart';

class DailyNutritionCard extends StatefulWidget {
  final String date;
  final List<HealthDataModel> nutritionEntries;
  final bool isDesktop;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;

  const DailyNutritionCard({
    super.key,
    required this.date,
    required this.nutritionEntries,
    required this.isDesktop,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbs,
    required this.totalFat,
  });

  @override
  State<DailyNutritionCard> createState() => _DailyNutritionCardState();
}

class _DailyNutritionCardState extends State<DailyNutritionCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        bottom: 12,
        left: widget.isDesktop ? 8 : 4,
        right: widget.isDesktop ? 8 : 4,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.orange.withValues(alpha: 0.3), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontSize: widget.isDesktop ? 16 : 14,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.nutritionEntries.length} ${widget.nutritionEntries.length == 1 ? 'meal' : 'meals'}',
                        style: TextStyle(
                          fontSize: widget.isDesktop ? 12 : 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _isExpanded
                            ? Icons.expand_less_rounded
                            : Icons.expand_more_rounded,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMacroCard(
                  'Calories',
                  widget.totalCalories.toStringAsFixed(0),
                  Colors.orange,
                  Icons.local_fire_department,
                ),
                _buildMacroCard(
                  'Protein',
                  '${widget.totalProtein.toStringAsFixed(1)}g',
                  Colors.blue,
                  Icons.fitness_center,
                ),
                _buildMacroCard(
                  'Carbs',
                  '${widget.totalCarbs.toStringAsFixed(1)}g',
                  Colors.green,
                  Icons.grain,
                ),
                _buildMacroCard(
                  'Fat',
                  '${widget.totalFat.toStringAsFixed(1)}g',
                  Colors.red,
                  Icons.opacity,
                ),
              ],
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 12),
              Text(
                'Meal Details',
                style: TextStyle(
                  fontSize: widget.isDesktop ? 13 : 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.nutritionEntries.length,
                itemBuilder: (context, index) {
                  final entry = widget.nutritionEntries[index];
                  final protein =
                      entry.additionalInfo['protein'] as String? ?? '0 g';
                  final carbs =
                      entry.additionalInfo['carbs'] as String? ?? '0 g';
                  final fat = entry.additionalInfo['fat'] as String? ?? '0 g';
                  final calories = entry.value;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.time,
                              style: TextStyle(
                                fontSize: widget.isDesktop ? 13 : 11,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '$calories kcal',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'P: $protein',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'C: $carbs',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'F: $fat',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMacroCard(
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
