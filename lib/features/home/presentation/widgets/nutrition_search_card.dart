import 'package:flutter/material.dart';
import 'package:patient_app/features/home/data/models/nutrition_ai_model.dart';
import 'package:patient_app/features/home/data/services/nutrition_ai_service.dart';

class NutritionSearchCard extends StatefulWidget {
  final String apiKey;

  const NutritionSearchCard({super.key, required this.apiKey});

  @override
  State<NutritionSearchCard> createState() => _NutritionSearchCardState();
}

class _NutritionSearchCardState extends State<NutritionSearchCard> {
  late NutritionAIService _nutritionService;
  final TextEditingController _searchController = TextEditingController();
  List<FoodSearchResult> _searchResults = [];
  bool _isSearching = false;
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    _nutritionService = NutritionAIService(nutritionAiKey: widget.apiKey);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    if (_searchController.text.isEmpty) return;

    setState(() {
      _isSearching = true;
      _hasSearched = true;
    });

    final results = await _nutritionService.searchFoods(
      _searchController.text,
      limit: 10,
      semantic: true,
    );

    setState(() {
      _searchResults = results;
      _isSearching = false;
    });
  }

  void _onSearchChanged(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        _searchResults.clear();
        _hasSearched = false;
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green.shade600, Colors.teal.shade600],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutrition AI',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Search foods & track nutrition',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: (_) => _performSearch(),
              decoration: InputDecoration(
                hintText: 'Search for foods',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                suffixIcon: _isSearching
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.green.shade600,
                            ),
                          ),
                        ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.green.shade600,
                          size: 24,
                        ),
                        onPressed: _performSearch,
                      ),
              ),
            ),
          ),
          if (_hasSearched) ...[
            const SizedBox(height: 16),
            if (_searchResults.isEmpty && !_isSearching)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'No foods found. Try another search.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Results',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 300),

                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final food = _searchResults[index];
                        return _buildFoodResultItem(food);
                      },
                    ),
                  ),
                ],
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildFoodResultItem(FoodSearchResult food) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            food.displayName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          if (food.brandName != null) ...[
            const SizedBox(height: 4),
            Text(
              food.brandName!,
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ],
          if (food.nutritionPreview != null) ...[
            const SizedBox(height: 8),
            _buildNutritionRow(food.nutritionPreview!),
          ],
        ],
      ),
    );
  }

  Widget _buildNutritionRow(NutritionPreview nutrition) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        if (isMobile) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildNutrientBadge(
                '${nutrition.calories?.toStringAsFixed(0) ?? "0"} cal',
                Colors.orange,
              ),
              SizedBox(width: isMobile ? 10 : 40),
              _buildNutrientBadge(
                '${nutrition.carbs?.toStringAsFixed(1) ?? "0"}g carbs',
                Colors.blue,
              ),
              SizedBox(width: isMobile ? 10 : 40),
              _buildNutrientBadge(
                '${nutrition.protein?.toStringAsFixed(1) ?? "0"}g protein',
                Colors.red,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 6 : 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildNutrientBadge(
                '${nutrition.fat?.toStringAsFixed(1) ?? "0"}g fat',
                Colors.yellow,
              ),
              SizedBox(width: isMobile ? 10 : 40),
              _buildNutrientBadge(
                '${nutrition.fiber?.toStringAsFixed(1) ?? "0"}g fiber',
                const Color.fromARGB(255, 29, 141, 47),
              ),
              SizedBox(width: isMobile ? 10 : 40),
              _buildNutrientBadge(
                '${nutrition.portion?.name}',
                const Color.fromARGB(255, 6, 5, 5),
              ),
            ],
          ),
        ],
        if (!isMobile) ...[
          Wrap(
            spacing: 16,
            runSpacing: 6,
            children: [
              _buildNutrientBadge(
                '${nutrition.calories?.toStringAsFixed(0) ?? "0"} cal',
                Colors.orange,
              ),
              _buildNutrientBadge(
                '${nutrition.carbs?.toStringAsFixed(1) ?? "0"}g carbs',
                Colors.blue,
              ),
              _buildNutrientBadge(
                '${nutrition.protein?.toStringAsFixed(1) ?? "0"}g protein',
                Colors.red,
              ),
              _buildNutrientBadge(
                '${nutrition.fat?.toStringAsFixed(1) ?? "0"}g fat',
                Colors.yellow,
              ),
              _buildNutrientBadge(
                '${nutrition.fiber?.toStringAsFixed(1) ?? "0"}g fiber',
                const Color.fromARGB(255, 29, 141, 47),
              ),
              _buildNutrientBadge(
                '${nutrition.portion?.name}',
                const Color.fromARGB(255, 6, 5, 5),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildNutrientBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
