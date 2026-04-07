class FoodSearchResult {
  final String displayName;
  final String? brandName;
  final String? iconId;
  final NutritionPreview? nutritionPreview;
  final String resultId;
  final double score;
  final String type;

  FoodSearchResult({
    required this.displayName,
    this.brandName,
    this.iconId,
    this.nutritionPreview,
    required this.resultId,
    required this.score,
    required this.type,
  });

  factory FoodSearchResult.fromJson(Map<String, dynamic> json) {
    return FoodSearchResult(
      displayName: json['displayName'] ?? 'Unknown',
      brandName: json['brandName'],
      iconId: json['iconId'],
      nutritionPreview: json['nutritionPreview'] != null
          ? NutritionPreview.fromJson(json['nutritionPreview'])
          : null,
      resultId: json['resultId'] ?? '',
      score: (json['score'] ?? 0).toDouble(),
      type: json['type'] ?? '',
    );
  }
}

class NutritionPreview {
  final double? calories;
  final double? carbs;
  final double? fat;
  final double? protein;
  final double? fiber;
  final Portion? portion;

  NutritionPreview({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
    this.fiber,
    this.portion,
  });

  factory NutritionPreview.fromJson(Map<String, dynamic> json) {
    return NutritionPreview(
      calories: (json['calories'] ?? 0).toDouble(),
      carbs: (json['carbs'] ?? 0).toDouble(),
      fat: (json['fat'] ?? 0).toDouble(),
      protein: (json['protein'] ?? 0).toDouble(),
      fiber: (json['fiber'] ?? 0).toDouble(),
      portion: json['portion'] != null
          ? Portion.fromJson(json['portion'])
          : null,
    );
  }
}

class Portion {
  final double quantity;
  final String name;

  Portion({required this.quantity, required this.name});

  factory Portion.fromJson(Map<String, dynamic> json) {
    final quantityValue = json['quantity'] ?? 1;
    final quantity = quantityValue is int
        ? quantityValue.toDouble()
        : (quantityValue as double);

    return Portion(quantity: quantity, name: json['name'] ?? '1 serving');
  }
}

class ExtractedFood {
  final String ingredientName;
  final String? portionSize;
  final double? portionQuantity;
  final double? weightGrams;
  final String? barcode;
  final String? displayName;
  final double? calories;
  final double? protein;
  final double? carbs;
  final double? fat;

  ExtractedFood({
    required this.ingredientName,
    this.portionSize,
    this.portionQuantity,
    this.weightGrams,
    this.barcode,
    this.displayName,
    this.calories,
    this.protein,
    this.carbs,
    this.fat,
  });

  factory ExtractedFood.fromJson(Map<String, dynamic> json) {
    final nutritionPreview = json['nutritionPreview'] as Map<String, dynamic>?;
    
    if (nutritionPreview != null) {
    } else {
    }

    return ExtractedFood(
      ingredientName: json['ingredientName'] ?? 'Unknown',
      portionSize: json['portionSize'],
      portionQuantity: json['portionQuantity'] != null 
          ? (json['portionQuantity'] as num).toDouble() 
          : null,
      weightGrams: json['weightGrams'] != null 
          ? (json['weightGrams'] as num).toDouble() 
          : null,
      barcode: json['barcode'],
      displayName: json['displayName'],
      calories: nutritionPreview?['calories'] != null
          ? (nutritionPreview!['calories'] as num).toDouble()
          : null,
      protein: nutritionPreview?['protein'] != null
          ? (nutritionPreview!['protein'] as num).toDouble()
          : null,
      carbs: nutritionPreview?['carbs'] != null
          ? (nutritionPreview!['carbs'] as num).toDouble()
          : null,
      fat: nutritionPreview?['fat'] != null
          ? (nutritionPreview!['fat'] as num).toDouble()
          : null,
    );
  }
}

class MealLogAction {
  final String action;
  final String mealTime;
  final List<ExtractedFood> items;

  MealLogAction({
    required this.action,
    required this.mealTime,
    required this.items,
  });

  factory MealLogAction.fromJson(Map<String, dynamic> json) {
    final items = json['items'] as List?;
    return MealLogAction(
      action: json['action'] ?? 'add',
      mealTime: json['mealTime'] ?? 'lunch',
      items: items != null
          ? items.map((item) => ExtractedFood.fromJson(item)).toList()
          : [],
    );
  }
}

class PackagedProduct {
  final String name;
  final List<Nutrient> nutrients;
  final List<Portion> portions;
  final BrandedInfo? branded;

  PackagedProduct({
    required this.name,
    required this.nutrients,
    required this.portions,
    this.branded,
  });

  factory PackagedProduct.fromJson(Map<String, dynamic> json) {
    final nutrients = json['nutrients'] as List?;
    final portions = json['portions'] as List?;

    return PackagedProduct(
      name: json['name'] ?? 'Unknown',
      nutrients: nutrients != null
          ? nutrients.map((n) => Nutrient.fromJson(n)).toList()
          : [],
      portions: portions != null
          ? portions.map((p) => Portion.fromJson(p)).toList()
          : [],
      branded: json['branded'] != null
          ? BrandedInfo.fromJson(json['branded'])
          : null,
    );
  }
}

class Nutrient {
  final String name;
  final String unit;
  final double amount;

  Nutrient({required this.name, required this.unit, required this.amount});

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    final nutrient = json['nutrient'] as Map<String, dynamic>?;
    final amountValue = json['amount'] ?? 0;
    final amount = amountValue is int
        ? amountValue.toDouble()
        : (amountValue as double);

    return Nutrient(
      name: nutrient?['name'] ?? 'Unknown',
      unit: nutrient?['unit'] ?? '',
      amount: amount,
    );
  }
}

class BrandedInfo {
  final String? owner;
  final String? productCode;
  final String? ingredients;

  BrandedInfo({this.owner, this.productCode, this.ingredients});

  factory BrandedInfo.fromJson(Map<String, dynamic> json) {
    return BrandedInfo(
      owner: json['owner'],
      productCode: json['productCode'],
      ingredients: json['ingredients'],
    );
  }
}
