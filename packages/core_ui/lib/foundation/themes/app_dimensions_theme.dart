library core_ui;

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';

class AppDimensionsTheme extends ThemeExtension<AppDimensionsTheme> {
  final double radiusHelpIndication;
  final EdgeInsets paddingHelpIndication;

  const AppDimensionsTheme._({
    required this.radiusHelpIndication,
    required this.paddingHelpIndication,
  });

  factory AppDimensionsTheme.regular(FlutterView flutterView) =>
      AppDimensionsTheme._(
        radiusHelpIndication:
            flutterView.isSmallDevice ? Spacing.sm : Spacing.md,
        paddingHelpIndication: const EdgeInsets.symmetric(
            horizontal: Spacing.md, vertical: Spacing.xmd),
      );

  @override
  ThemeExtension<AppDimensionsTheme> copyWith() {
    return AppDimensionsTheme._(
        radiusHelpIndication: radiusHelpIndication,
        paddingHelpIndication: paddingHelpIndication);
  }

  @override
  ThemeExtension<AppDimensionsTheme> lerp(
      covariant ThemeExtension<AppDimensionsTheme>? other, double t) {
    return this;
  }
}

//extensions

extension MediaQueryExtended on FlutterView {
  double get logicalWidth => physicalSize.width / devicePixelRatio;
  double get logicalHeight => physicalSize.height / devicePixelRatio;
  double get logicalWidthSA =>
      (physicalSize.width - padding.left - padding.right) / devicePixelRatio;
  double get logicalHeightSA =>
      (physicalSize.height - padding.top - padding.bottom) / devicePixelRatio;

  bool get isSmallDevice {
    if (logicalWidthSA < logicalHeightSA) {
      return (logicalWidthSA <= Sizes.xsm || logicalHeightSA <= Sizes.md);
    } else {
      return (logicalWidthSA <= Sizes.md || logicalHeightSA <= Sizes.xsm);
    }
  }

  bool get isReqularDeviceOrLess {
    if (logicalWidthSA < logicalHeightSA) {
      return (logicalWidthSA <= Sizes.sm || logicalHeightSA <= Sizes.mdl);
    } else {
      return (logicalWidthSA <= Sizes.mdl || logicalHeightSA <= Sizes.sm);
    }
  }

  bool get isSmallTabletOrLess {
    if (logicalWidthSA < logicalHeightSA) {
      return (logicalWidthSA <= Sizes.md || logicalHeightSA <= Sizes.lg);
    } else {
      return (logicalWidthSA <= Sizes.lg || logicalHeightSA <= Sizes.md);
    }
  }

  bool get isRegularTabletOrLess {
    if (logicalWidthSA < logicalHeightSA) {
      return (logicalWidthSA <= Sizes.mdl || logicalHeightSA <= Sizes.xlg);
    } else {
      return (logicalWidthSA <= Sizes.xlg || logicalHeightSA <= Sizes.mdl);
    }
  }
}
