import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/constants/environment.dart';
import 'package:patient_app/core/widgets/toast_widget.dart';
import 'package:patient_app/features/home/data/models/nutrition_ai_model.dart';
import 'package:patient_app/features/home/data/services/health_api_service.dart';
import 'package:patient_app/features/home/presentation/widgets/food_camera_widget.dart';
import 'package:patient_app/features/home/presentation/widgets/nutrition_results_card.dart';
import 'package:patient_app/features/home/presentation/widgets/nutrition_search_card.dart';
import 'package:patient_app/features/home/presentation/widgets/nutrition_progress_tracker.dart';
import 'package:fhir/r4.dart' as r4;

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final String _nutritionAiKey = Environment.nutritionAiKey;
  List<ExtractedFood> _detectedFoods = [];
  bool _showNutritionResults = false;
  bool _loading = false;
  final GlobalKey<FoodCameraWidgetState> _cameraKey =
      GlobalKey<FoodCameraWidgetState>();
  final GlobalKey<NutritionProgressTrackerState> _progressTrackerKey =
      GlobalKey<NutritionProgressTrackerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nutrition AI',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => context.goNamed('home'),
        ),
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              final horizontalPadding = width < 600
                  ? 16.0
                  : width < 1024
                  ? 32.0
                  : 64.0;

              final maxContentWidth = 900.0;

              final showSidePanel = width >= 1200;

              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 24,
                    ),
                    child: showSidePanel
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: maxContentWidth,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      FoodCameraWidget(
                                        key: _cameraKey,
                                        nutritionAiKey: _nutritionAiKey,
                                        onFoodsExtracted: _handleFoodsExtracted,
                                      ),
                                      const SizedBox(height: 12),
                                      if (_showNutritionResults &&
                                          _detectedFoods.isNotEmpty)
                                        NutritionResultsCard(
                                          extractedFoods: _detectedFoods,
                                          onDismiss: _resetResults,
                                          onAccept:
                                              (
                                                foods,
                                                totalCalories,
                                                totalProtein,
                                                totalCarbs,
                                                totalFat,
                                              ) {
                                                _saveNutritionToAidbox(
                                                  foods,
                                                  totalCalories,
                                                  totalProtein,
                                                  totalCarbs,
                                                  totalFat,
                                                );
                                              },
                                          onDecline: _resetResults,
                                        ),
                                      const SizedBox(height: 20),
                                      NutritionSearchCard(
                                        apiKey: _nutritionAiKey,
                                      ),
                                      const SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    NutritionProgressTracker(
                                      key: _progressTrackerKey,
                                      patientId:
                                          '093266f6-6417-4e07-9219-e55bcd8a4e73',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: maxContentWidth,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FoodCameraWidget(
                                  key: _cameraKey,
                                  nutritionAiKey: _nutritionAiKey,
                                  onFoodsExtracted: _handleFoodsExtracted,
                                ),
                                const SizedBox(height: 12),
                                if (_showNutritionResults &&
                                    _detectedFoods.isNotEmpty)
                                  NutritionResultsCard(
                                    extractedFoods: _detectedFoods,
                                    onDismiss: _resetResults,
                                    onAccept:
                                        (
                                          foods,
                                          totalCalories,
                                          totalProtein,
                                          totalCarbs,
                                          totalFat,
                                        ) {
                                          _saveNutritionToAidbox(
                                            foods,
                                            totalCalories,
                                            totalProtein,
                                            totalCarbs,
                                            totalFat,
                                          );
                                        },
                                    onDecline: _resetResults,
                                  ),
                                const SizedBox(height: 20),

                                NutritionProgressTracker(
                                  key: _progressTrackerKey,
                                  patientId:
                                      '093266f6-6417-4e07-9219-e55bcd8a4e73',
                                ),
                                const SizedBox(height: 40),

                                NutritionSearchCard(apiKey: _nutritionAiKey),

                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
          if (_loading)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        Text(
                          'Saving nutrition data...',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _saveNutritionToAidbox(
    List<ExtractedFood> foods,
    double totalCalories,
    double totalProtein,
    double totalCarbs,
    double totalFat,
  ) async {
    setState(() => _loading = true);
    try {
      final patientId = '093266f6-6417-4e07-9219-e55bcd8a4e73';
      final healthApiService = HealthApiService();

      String foodNames = foods
          .map((food) => food.displayName ?? food.ingredientName)
          .join(', ');

      final nutritionObs = r4.Observation(
        status: r4.FhirCode('final'),
        category: [
          r4.CodeableConcept(
            coding: [
              r4.Coding(
                system: r4.FhirUri(
                  'http://terminology.hl7.org/CodeSystem/observation-category',
                ),
                code: r4.FhirCode('vital-signs'),
              ),
            ],
          ),
        ],
        code: r4.CodeableConcept(
          coding: [
            r4.Coding(
              system: r4.FhirUri('http://loinc.org'),
              code: r4.FhirCode('9052-2'),
              display: 'Calorie intake total',
            ),
          ],
          text: 'Nutrition intake - Total',
        ),
        subject: r4.Reference(reference: 'Patient/$patientId'),
        effectiveDateTime: r4.FhirDateTime(DateTime.now()),
        valueQuantity: r4.Quantity(
          value: r4.FhirDecimal(totalCalories),
          unit: 'kcal',
          system: r4.FhirUri('http://unitsofmeasure.org'),
          code: r4.FhirCode('kcal'),
        ),
        component: [
          if (totalProtein > 0)
            r4.ObservationComponent(
              code: r4.CodeableConcept(
                coding: [
                  r4.Coding(
                    system: r4.FhirUri('http://loinc.org'),
                    code: r4.FhirCode('82810-3'),
                    display: 'Protein intake total',
                  ),
                ],
              ),
              valueQuantity: r4.Quantity(
                value: r4.FhirDecimal(totalProtein),
                unit: 'g',
                system: r4.FhirUri('http://unitsofmeasure.org'),
                code: r4.FhirCode('g'),
              ),
            ),
          if (totalCarbs > 0)
            r4.ObservationComponent(
              code: r4.CodeableConcept(
                coding: [
                  r4.Coding(
                    system: r4.FhirUri('http://loinc.org'),
                    code: r4.FhirCode('2340-8'),
                    display: 'Carbohydrate intake total',
                  ),
                ],
              ),
              valueQuantity: r4.Quantity(
                value: r4.FhirDecimal(totalCarbs),
                unit: 'g',
                system: r4.FhirUri('http://unitsofmeasure.org'),
                code: r4.FhirCode('g'),
              ),
            ),
          if (totalFat > 0)
            r4.ObservationComponent(
              code: r4.CodeableConcept(
                coding: [
                  r4.Coding(
                    system: r4.FhirUri('http://loinc.org'),
                    code: r4.FhirCode('2339-0'),
                    display: 'Fat intake total',
                  ),
                ],
              ),
              valueQuantity: r4.Quantity(
                value: r4.FhirDecimal(totalFat),
                unit: 'g',
                system: r4.FhirUri('http://unitsofmeasure.org'),
                code: r4.FhirCode('g'),
              ),
            ),
        ],
        note: [
          r4.Annotation(
            text: r4.FhirMarkdown(
              'Food items: $foodNames\n'
              'Total: ${foods.length} item${foods.length > 1 ? 's' : ''}\n'
              'Calories: ${totalCalories.toStringAsFixed(1)} kcal\n'
              'Protein: ${totalProtein.toStringAsFixed(1)} g\n'
              'Carbs: ${totalCarbs.toStringAsFixed(1)} g\n'
              'Fat: ${totalFat.toStringAsFixed(1)} g',
            ),
          ),
        ],
      );

      final observationJson = nutritionObs.toJson();
      final Map<String, dynamic> observationData = {};
      observationJson.forEach((key, value) {
        observationData[key.toString()] = value;
      });
      observationData['resourceType'] = 'Observation';

      await healthApiService.postObservation(observationData);

      if (mounted && _progressTrackerKey.currentState != null) {
        await _progressTrackerKey.currentState!.refreshData();
      }

      if (mounted) {
        showToast(
          context,
          'Successfully saved total nutrition for ${foods.length} food item${foods.length > 1 ? 's' : ''}',
          backgroundColor: Colors.green,
        );
      }

      _resetResults();
    } catch (e) {
      debugPrint("[NutritionPage] Error saving nutrition: $e");
      if (mounted) {
        showToast(
          context,
          'Failed to save nutrition data: ${e.toString()}',
          backgroundColor: Colors.red,
        );
      }
    } finally {
      setState(() => _loading = false);
    }
  }

  void _handleFoodsExtracted(List<ExtractedFood> foods) {
    setState(() {
      _detectedFoods = foods;
      _showNutritionResults = true;
    });
  }

  void _resetResults() {
    _cameraKey.currentState?.clear();
    setState(() {
      _showNutritionResults = false;
      _detectedFoods = [];
    });
  }
}
