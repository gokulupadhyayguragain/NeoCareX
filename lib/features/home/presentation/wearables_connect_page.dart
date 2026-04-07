import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:patient_app/features/home/data/services/wearable_sync_manager.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';
import 'package:patient_app/features/home/presentation/widgets/wearable_connect_section.dart';
import 'package:patient_app/test_user.dart';

class WearablesConnectPage extends StatefulWidget {
  const WearablesConnectPage({super.key});

  @override
  State<WearablesConnectPage> createState() => _WearablesConnectPageState();
}

class _WearablesConnectPageState extends State<WearablesConnectPage> {
  final bool _isInitializingAppleHealth = false;
  bool _isLoading = false;
  bool _mounted = true;
  String? _errorMessage;

  bool _isDataLoaded = false;

  int _steps = 0;
  int _sleepMinutes = 0;
  double _weight = 0.0;
  int _calories = 0;

  String _stepsDate = '';

  @override
  void initState() {
    super.initState();
    _mounted = true;

    WidgetsBinding.instance.addPostFrameCallback((_) => _loadData());
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      setState(() => _isLoading = true);

      final rookService = context.read<RookService>();
      final userId = await TestUser.getUserId();

      await rookService.refreshTodayData(userId);
      await Future.delayed(const Duration(milliseconds: 500));

      final todayResult = {
        'success':
            rookService.realtimeSteps > 0 || rookService.realtimeCalories > 0,
        'data': rookService.realtimeTodayData.isNotEmpty
            ? rookService.realtimeTodayData
            : null,
      };

      if (todayResult != null && _mounted) {
        _extractDataFromResponse(todayResult, isToday: true);
      }

      if (_steps == 0) {
        final yesterday = DateTime.now().subtract(const Duration(days: 1));
        final yesterdayStr =
            '${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}';

        final yesterdayResult = await rookService.getAggregatedHealthData(
          userId,
          yesterdayStr,
          forceRefresh: true,
        );

        if (yesterdayResult != null && _mounted) {
          _extractDataFromResponse(yesterdayResult, isToday: false);
        }
      }

      if (_weight == 0) {
        if (_steps > 0 && _stepsDate == 'today') {
          final yesterday = DateTime.now().subtract(const Duration(days: 1));
          final yesterdayStr =
              '${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}';

          final yesterdayResult = await rookService.getAggregatedHealthData(
            userId,
            yesterdayStr,
            forceRefresh: true,
          );

          if (yesterdayResult != null && _mounted) {
            _extractDataFromResponse(yesterdayResult, isToday: false);
          }
        }
      }

      if (_sleepMinutes > 0) {}

      if (_mounted) {
        setState(() {
          _isDataLoaded = true;
        });
      }
    } catch (e) {
      if (_mounted) {
        setState(() {
          _errorMessage =
              'Error: ${e.toString().substring(0, min(100, e.toString().length))}';
        });
      }
    } finally {
      if (_mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _extractDataFromResponse(
    Map<String, dynamic> result, {
    required bool isToday,
  }) {
    Map<String, dynamic>? data;

    if (result.containsKey('data') && result['data'] != null) {
      final dataObj = result['data'];
      if (dataObj is Map) {
        data = Map<String, dynamic>.from(dataObj);
      }
    } else if (result.containsKey('result') && result['result'] != null) {
      final resultWrapper = result['result'];
      if (resultWrapper is Map) {
        final resultMap = Map<String, dynamic>.from(resultWrapper);
        if (resultMap.containsKey('data') && resultMap['data'] != null) {
          final dataObj = resultMap['data'];
          if (dataObj is Map) {
            data = Map<String, dynamic>.from(dataObj);
          }
        }
      }
    }

    if (data == null) return;

    if (data.containsKey('sleep') && data['sleep'] != null) {
      try {
        final sleepObj = data['sleep'];
        if (sleepObj is Map) {
          final sleep = Map<String, dynamic>.from(sleepObj);

          if (sleep.containsKey('sleep_health') &&
              sleep['sleep_health'] != null) {
            final sleepHealthObj = sleep['sleep_health'];
            if (sleepHealthObj is Map) {
              final sleepHealth = Map<String, dynamic>.from(sleepHealthObj);

              if (sleepHealth.containsKey('summary') &&
                  sleepHealth['summary'] != null) {
                final summaryObj = sleepHealth['summary'];
                if (summaryObj is Map) {
                  final summary = Map<String, dynamic>.from(summaryObj);

                  if (summary.containsKey('sleep_summary') &&
                      summary['sleep_summary'] != null) {
                    final sleepSummaryObj = summary['sleep_summary'];
                    if (sleepSummaryObj is Map) {
                      final sleepSummary = Map<String, dynamic>.from(
                        sleepSummaryObj,
                      );

                      if (sleepSummary.containsKey('duration') &&
                          sleepSummary['duration'] != null) {
                        final durationObj = sleepSummary['duration'];
                        if (durationObj is Map) {
                          final duration = Map<String, dynamic>.from(
                            durationObj,
                          );

                          final seconds =
                              duration['sleep_duration_seconds_int'] as int?;

                          if (seconds != null && seconds > 0) {
                            _sleepMinutes = seconds ~/ 60;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {
        return;
      }
    }

    if (data.containsKey('physical') && data['physical'] != null) {
      try {
        final physicalObj = data['physical'];
        if (physicalObj is Map) {
          final physical = Map<String, dynamic>.from(physicalObj);

          if (physical.containsKey('physical_health') &&
              physical['physical_health'] != null) {
            final physicalHealthObj = physical['physical_health'];
            if (physicalHealthObj is Map) {
              final physicalHealth = Map<String, dynamic>.from(
                physicalHealthObj,
              );

              if (physicalHealth.containsKey('summary') &&
                  physicalHealth['summary'] != null) {
                final summaryObj = physicalHealth['summary'];
                if (summaryObj is Map) {
                  final summary = Map<String, dynamic>.from(summaryObj);

                  if (summary.containsKey('physical_summary') &&
                      summary['physical_summary'] != null) {
                    final physicalSummaryObj = summary['physical_summary'];
                    if (physicalSummaryObj is Map) {
                      final physicalSummary = Map<String, dynamic>.from(
                        physicalSummaryObj,
                      );

                      if (physicalSummary.containsKey('distance') &&
                          physicalSummary['distance'] != null) {
                        final distanceMapObj = physicalSummary['distance'];
                        if (distanceMapObj is Map) {
                          final distanceMap = Map<String, dynamic>.from(
                            distanceMapObj,
                          );
                          final steps = distanceMap['steps_int'] as int? ?? 0;
                          if (steps > 0) {
                            _steps = steps;
                            _stepsDate = isToday ? 'today' : 'yesterday';
                          }

                          final distance =
                              (distanceMap['traveled_distance_meters_float']
                                      as num?)
                                  ?.toDouble() ??
                              0.0;
                          if (distance > 0) {}
                        }
                      }

                      if (physicalSummary.containsKey('calories') &&
                          physicalSummary['calories'] != null) {
                        final caloriesMapObj = physicalSummary['calories'];
                        if (caloriesMapObj is Map) {
                          final caloriesMap = Map<String, dynamic>.from(
                            caloriesMapObj,
                          );
                          final calories =
                              (caloriesMap['calories_expenditure_kcal_float']
                                      as num?)
                                  ?.toInt() ??
                              0;
                          if (calories > 0) {
                            _calories = calories;
                          }
                        }
                      }

                      if (physicalSummary.containsKey('heart_rate') &&
                          physicalSummary['heart_rate'] != null) {
                        final heartRateMapObj = physicalSummary['heart_rate'];
                        if (heartRateMapObj is Map) {
                          final heartRateMap = Map<String, dynamic>.from(
                            heartRateMapObj,
                          );
                          final heartRate =
                              heartRateMap['hr_avg_bpm_int'] as int? ?? 0;
                          if (heartRate > 0) {}
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {}
    }

    if (data.containsKey('body') && data['body'] != null) {
      try {
        final bodyObj = data['body'];
        if (bodyObj is Map) {
          final body = Map<String, dynamic>.from(bodyObj);

          if (body.containsKey('body_health') && body['body_health'] != null) {
            final bodyHealthObj = body['body_health'];
            if (bodyHealthObj is Map) {
              final bodyHealth = Map<String, dynamic>.from(bodyHealthObj);

              if (bodyHealth.containsKey('summary') &&
                  bodyHealth['summary'] != null) {
                final summaryObj = bodyHealth['summary'];
                if (summaryObj is Map) {
                  final summary = Map<String, dynamic>.from(summaryObj);

                  if (summary.containsKey('body_summary') &&
                      summary['body_summary'] != null) {
                    final bodySummaryObj = summary['body_summary'];
                    if (bodySummaryObj is Map) {
                      final bodySummary = Map<String, dynamic>.from(
                        bodySummaryObj,
                      );

                      if (bodySummary.containsKey('body_metrics') &&
                          bodySummary['body_metrics'] != null) {
                        final bodyMetricsObj = bodySummary['body_metrics'];
                        if (bodyMetricsObj is Map) {
                          final bodyMetrics = Map<String, dynamic>.from(
                            bodyMetricsObj,
                          );

                          final newWeight =
                              (bodyMetrics['weight_kg_float'] as num?)
                                  ?.toDouble() ??
                              0.0;

                          if (newWeight > 0) {
                            _weight = newWeight;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final syncManager = context.watch<WearablesSyncManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wearables',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadData,
              tooltip: 'Refresh',
            ),
          if (_isInitializingAppleHealth)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        color: Colors.blue,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WearableConnectSection(),
              const SizedBox(height: 24),

              if (syncManager.lastSyncTime != null)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade400,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Last synced: ${_formatSyncTime(syncManager.lastSyncTime!)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              if (_errorMessage != null && !_isDataLoaded)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red.shade800),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatSyncTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}
