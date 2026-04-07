import 'package:flutter/material.dart';
import 'package:patient_app/core/widgets/toast_widget.dart';

// ignore: strict_top_level_inference
showErrorMessage(String errorMessge, BuildContext context, {int? time}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    showToast(
      context,
      errorMessge,
      backgroundColor: Colors.red,
      time: time ?? 3,
    );
  });
}

void showSuccessMessage(String message, BuildContext context, {int? time}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    showToast(context, message, backgroundColor: Colors.green, time: time ?? 3);
  });
}
