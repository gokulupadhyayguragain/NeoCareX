import 'package:dio/dio.dart';
import 'package:patient_app/features/home/data/models/nutrition_ai_model.dart';

class NutritionAIService {
  final Dio _dio;
  final String _nutritionAiKey;
  String? _accessToken;
  DateTime? _tokenExpiry;

  static const String _baseUrl = 'https://api.passiolife.com/v2/products/napi';

  String get _tokenUrl =>
      'https://api.passiolife.com/v2/token-cache/unified/oauth/token/$_nutritionAiKey';

  NutritionAIService({required String nutritionAiKey})
    : _nutritionAiKey = nutritionAiKey,
      _dio = Dio(
        BaseOptions(
          // connectTimeout: 30, receiveTimeout: 30
        ),
      );

  Future<bool> _ensureToken() async {
    try {
      if (_accessToken != null &&
          _tokenExpiry != null &&
          DateTime.now().isBefore(_tokenExpiry!)) {
        return true;
      }

      final response = await _dio.post(
        _tokenUrl,
        options: Options(headers: {'Accept': 'application/json'}),
        data: {},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _accessToken = response.data['access_token'];

        final dynamic expiresInValue = response.data['expires_in'] ?? 3600;
        final int expiresInSeconds;

        if (expiresInValue is double) {
          expiresInSeconds = expiresInValue.round();
        } else if (expiresInValue is int) {
          expiresInSeconds = expiresInValue;
        } else {
          expiresInSeconds = 3600;
        }

        _tokenExpiry = DateTime.now().add(
          Duration(seconds: expiresInSeconds - 60),
        );
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Map<String, String> get _authHeaders => {
    'Authorization': 'Bearer $_accessToken',
    'Accept': 'application/json',
  };

  Future<List<FoodSearchResult>> searchFoods(
    String query, {
    int limit = 30,
    bool semantic = true,
  }) async {
    try {
      if (!await _ensureToken()) {
        throw Exception('Failed to get access token');
      }

      final endpoint = semantic
          ? 'food/search/semantic'
          : 'food/search/advanced';
      final response = await _dio.get(
        '$_baseUrl/$endpoint',
        queryParameters: {'term': query, 'limit': limit},
        options: Options(headers: _authHeaders),
      );

      if (response.statusCode == 200) {
        final results = response.data['results'] as List?;
        if (results != null) {
          return results
              .map((item) => FoodSearchResult.fromJson(item))
              .toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<ExtractedFood>> extractFoodsFromImage(String base64Image) async {
    if (!await _ensureToken()) {
      throw Exception('Failed to get access token');
    }

    final imageData = base64Image.startsWith('data:image')
        ? base64Image
        : 'data:image/jpeg;base64,$base64Image';

    final response = await _dio.post(
      '$_baseUrl/tools/vision/extractIngredientsAutoTyped',
      options: Options(headers: _authHeaders),
      data: {"image": imageData},
    );

    if (response.data is List) {
      return (response.data as List)
          .map((e) => ExtractedFood.fromJson(e))
          .toList();
    }

    return [];
  }

  Future<List<MealLogAction>> extractMealLogActions(String content) async {
    try {
      if (!await _ensureToken()) {
        throw Exception('Failed to get access token');
      }

      final response = await _dio.post(
        '$_baseUrl/tools/extractMealLogAction',
        data: {'content': content},
        options: Options(headers: _authHeaders),
      );

      if (response.statusCode == 200) {
        final results = response.data as List?;
        if (results != null) {
          return results.map((item) => MealLogAction.fromJson(item)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<PackagedProduct?> extractPackagedProduct(String base64Image) async {
    try {
      if (!await _ensureToken()) {
        throw Exception('Failed to get access token');
      }

      final response = await _dio.post(
        '$_baseUrl/tools/vision/extractPackagedProduct',
        data: {'image': base64Image},
        options: Options(headers: _authHeaders),
      );

      if (response.statusCode == 200) {
        return PackagedProduct.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getFoodDetails(String foodId) async {
    try {
      if (!await _ensureToken()) {
        throw Exception('Failed to get access token');
      }

      final response = await _dio.get(
        '$_baseUrl/food/details/$foodId',
        options: Options(headers: _authHeaders),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }
      return {};
    } catch (e) {
      return {};
    }
  }
}
