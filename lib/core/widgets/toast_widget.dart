// ignore_for_file: strict_top_level_inference

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  int? time,
}) {
  final fToast = FToast();
  fToast.removeCustomToast();
  fToast.init(context);
  fToast.showToast(
    child: _toastWidget(context, message, backGroundColor: backgroundColor),
    toastDuration: Duration(seconds: time ?? 4),
  );
}

bool isDark(BuildContext context) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return isDark;
}

Widget _toastWidget(
  BuildContext context,
  String message, {
  Color? backGroundColor,
}) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: backGroundColor ?? Colors.black,
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    ],
  ),
);
