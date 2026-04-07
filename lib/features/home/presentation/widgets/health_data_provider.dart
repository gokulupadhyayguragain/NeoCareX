// features/home/presentation/providers/health_data_provider.dart
import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/services/health_data_service.dart';
import 'package:patient_app/test_user.dart';

class HealthDataProvider extends ChangeNotifier {
  final HealthDataService _service = HealthDataService();
  
  Map<String, dynamic>? _healthData;
  String? _error;
  bool _isLoading = false;
  DateTime? _lastLoadTime;

  Map<String, dynamic>? get healthData => _healthData;
  String? get error => _error;
  bool get isLoading => _isLoading;
  bool get hasData => _healthData != null;

  HealthDataProvider() {
    _init();
  }

  void _init() {
    // Listen to the service stream
    _service.dataStream.listen((data) {
      if (data != null) {
        _healthData = data;
        _error = null;
        _isLoading = false;
        _lastLoadTime = DateTime.now();
        notifyListeners();
      }
    });
  }

  Future<void> loadHealthData({bool forceRefresh = false}) async {
    // Prevent multiple simultaneous loads
    if (_isLoading) {
      debugPrint('[HealthDataProvider] Already loading, skipping...');
      return;
    }

    // Prevent loading too frequently (minimum 3 seconds)
    if (!forceRefresh && _lastLoadTime != null) {
      final age = DateTime.now().difference(_lastLoadTime!);
      if (age.inSeconds < 3) {
        debugPrint('[HealthDataProvider] Loading too frequently, skipping...');
        return;
      }
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final today = DateTime.now();
      final formattedDate = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';

      final result = await _service.fetchAggregatedHealthData(
        userId: await TestUser.getUserId(),
        date: formattedDate,
        forceRefresh: forceRefresh,
      );

      if (result != null) {
        _healthData = result;
        _error = null;
      } else {
        _error = 'No data available';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      _lastLoadTime = DateTime.now();
      notifyListeners();
    }
  }

  void clearData() {
    _service.clearCache();
    _healthData = null;
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}