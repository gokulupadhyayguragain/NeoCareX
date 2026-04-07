import 'package:flutter/material.dart';

import 'break_points.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget defaultWidget;
  final Widget? smallWidget;
  final Widget? xSmallWidget;
  final Widget? mediumWidget;
  final Widget? largeWidget;
  final Widget? xLargeWidget;
  final Widget? xxLargeWidget;

  const ResponsiveWidget({super.key, 
    required this.defaultWidget,
    this.largeWidget,
    this.mediumWidget,
    this.smallWidget,
    this.xLargeWidget,
    this.xSmallWidget,
    this.xxLargeWidget,
  }) ;

  static bool isXSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < kSmallScreenSize;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width >= kSmallScreenSize &&
      MediaQuery.of(context).size.width < kMediumScreenSize;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width >= kMediumScreenSize &&
      MediaQuery.of(context).size.width < kLargeScreenSize;

  static bool isExtraLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= kExtraLargeScreenSize &&
      MediaQuery.of(context).size.width < kExtraExtraLargeScreenSize;

  static bool isExtraExtraLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= kExtraExtraLargeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      Widget result = defaultWidget;

      if (constraints.maxWidth < kSmallScreenSize) {
        result = xSmallWidget ?? smallWidget ?? defaultWidget;
      } else if (constraints.maxWidth >= kSmallScreenSize &&
          constraints.maxWidth < kMediumScreenSize) {
        result = smallWidget ?? mediumWidget ?? defaultWidget;
      } else if (constraints.maxWidth >= kMediumScreenSize &&
          constraints.maxWidth < kLargeScreenSize) {
        result = mediumWidget ?? defaultWidget;
      } else if (constraints.maxWidth >= kLargeScreenSize &&
          constraints.maxWidth < kExtraLargeScreenSize) {
        result = largeWidget ?? defaultWidget;
      } else if (constraints.maxWidth >= kExtraLargeScreenSize &&
          constraints.maxWidth < kExtraExtraLargeScreenSize) {
        result = xLargeWidget ?? defaultWidget;
      } else {
        result = xxLargeWidget ?? defaultWidget;
      }

      return result;
    }));
  }
}
