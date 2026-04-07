import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/models/nutrition_ai_model.dart';

class NutritionResultsCard extends StatelessWidget {
  final List<ExtractedFood> extractedFoods;
  final VoidCallback onDismiss;
   final Function(List<ExtractedFood>, double, double, double, double) onAccept;
  final VoidCallback onDecline;

  const NutritionResultsCard({
    super.key,
    required this.extractedFoods,
    required this.onDismiss,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    final totalCalories = extractedFoods.fold(
      0.0,
      (sum, item) => sum + (item.calories ?? 0),
    );
    final totalProtein = extractedFoods.fold(
      0.0,
      (sum, item) => sum + (item.protein ?? 0),
    );
    final totalCarbs = extractedFoods.fold(
      0.0,
      (sum, item) => sum + (item.carbs ?? 0),
    );
    final totalFat = extractedFoods.fold(
      0.0,
      (sum, item) => sum + (item.fat ?? 0),
    );

    return Container(
      margin: const EdgeInsets.all(16),
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green[500]!, Colors.teal[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutrition Analysis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Summary of detected items',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${totalCalories.toStringAsFixed(0)} kcal',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTotalMetric(
                  'Protein',
                  '${totalProtein.toStringAsFixed(1)}g',
                  Colors.blue,
                ),
                _buildTotalMetric(
                  'Carbs',
                  '${totalCarbs.toStringAsFixed(1)}g',
                  Colors.orange,
                ),
                _buildTotalMetric(
                  'Fat',
                  '${totalFat.toStringAsFixed(1)}g',
                  Colors.red,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: extractedFoods.length,
            itemBuilder: (context, index) {
              final food = extractedFoods[index];
              return _FoodItemTile(food: food, index: index);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onDecline,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("I'm just checking"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => onAccept(extractedFoods, totalCalories, totalProtein, totalCarbs, totalFat),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Yes, I will eat this'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _FoodItemTile extends StatelessWidget {
  final ExtractedFood food;
  final int index;

  const _FoodItemTile({required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green[300]!, Colors.teal[400]!],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.displayName ?? food.ingredientName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    if (food.portionSize != null) ...[
                      Text(
                        '${food.portionQuantity ?? 1} ${food.portionSize!}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.teal[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        ' • ',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                    Text(
                      '${food.calories?.toStringAsFixed(0) ?? "0"} kcal',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      'Protein: ${food.protein?.toStringAsFixed(1) ?? "0"}g',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      'Carbs: ${food.carbs?.toStringAsFixed(1) ?? "0"}g',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                    const Text(
                      ' • ',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      'Fat: ${food.fat?.toStringAsFixed(1) ?? "0"}g',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: Colors.green[400], size: 24),
        ],
      ),
    );
  }
}
