// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patient_app/core/widgets/toast_widget.dart';
import 'package:patient_app/features/home/data/models/nutrition_ai_model.dart';
import 'package:patient_app/features/home/data/services/nutrition_ai_service.dart';

class FoodCameraWidget extends StatefulWidget {
  final String nutritionAiKey;
  final Function(List<ExtractedFood>) onFoodsExtracted;

  const FoodCameraWidget({
    super.key,
    required this.nutritionAiKey,
    required this.onFoodsExtracted,
  });

  @override
  State<FoodCameraWidget> createState() => FoodCameraWidgetState();
}

class FoodCameraWidgetState extends State<FoodCameraWidget>
    with TickerProviderStateMixin {
  final ImagePicker _imagePicker = ImagePicker();
  late NutritionAIService _nutritionService;

  bool _isProcessing = false;
  XFile? _selectedImage;
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _nutritionService = NutritionAIService(
      nutritionAiKey: widget.nutritionAiKey,
    );
  }

  void clear() {
    setState(() {
      _selectedImage = null;
      _imageBytes = null;
      _isProcessing = false;
    });

    widget.onFoodsExtracted([]);
  }

  Future<void> _pickFromCamera() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image == null) return;

      setState(() {
        _selectedImage = image;
        _imageBytes = null;
        _isProcessing = true;
      });

      await _processImage(image);
    } catch (e) {
      showToast(context, 'Failed to open camera', backgroundColor: Colors.red);
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image == null) return;

      final bytes = await image.readAsBytes();

      setState(() {
        _selectedImage = image;
        _imageBytes = bytes;
        _isProcessing = true;
      });

      await _processImage(image);
    } catch (e) {
      showToast(context, 'Failed to pick image', backgroundColor: Colors.red);
    }
  }

  Future<void> _processImage(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      final foods = await _nutritionService.extractFoodsFromImage(base64Image);

      if (!mounted) return;

      if (foods.isNotEmpty) {
        widget.onFoodsExtracted(foods);
        showToast(
          context,
          'Found ${foods.length} food items',
          backgroundColor: Colors.green,
        );
      } else {
        showToast(
          context,
          'No food detected. Try another image.',
          backgroundColor: Colors.orange,
        );
      }
    } catch (e) {
      showToast(
        context,
        'Failed to analyze image',
        backgroundColor: Colors.red,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 240),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade600, Colors.green.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _buildCameraContent(isMobile),
            ),
          ),
        ),

        if (_selectedImage != null &&
            !_isProcessing &&
            _imageBytes != null) ...[
          const SizedBox(height: 16),
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: kIsWeb
                      ? Image.memory(
                          _imageBytes!,
                          height: 220,
                          fit: BoxFit.contain,
                        )
                      : Image.file(
                          File(_selectedImage!.path),
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: clear,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCameraContent(bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.camera_alt_rounded, size: 48, color: Colors.white),
        const SizedBox(height: 12),
        const Text(
          'Scan Your Food',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Take or upload a photo to get nutrition insights',
          style: TextStyle(fontSize: 14, color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        _isProcessing
            ? const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isMobile)
                    ElevatedButton.icon(
                      onPressed: _pickFromCamera,
                      icon: const Icon(Icons.camera),
                      label: const Text('Camera'),
                      style: _buttonStyle(),
                    ),
                  if (isMobile) const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _pickFromGallery,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Gallery'),
                    style: _buttonStyle(),
                  ),
                ],
              ),
      ],
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.teal.shade600,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}
