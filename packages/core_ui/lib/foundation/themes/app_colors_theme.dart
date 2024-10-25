library core_ui;

import 'package:core_ui/foundation/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final AppColors appColors;

  const AppColorsTheme._({required this.appColors});

  factory AppColorsTheme.light() =>
      AppColorsTheme._(appColors: AppColors.light());

  factory AppColorsTheme.dark() =>
      AppColorsTheme._(appColors: AppColors.dark());

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.light();
    } else {
      return AppColorsTheme.dark();
    }
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
      covariant ThemeExtension<AppColorsTheme>? other, double t) {
    return this;
  }

  @override
  String toString() => 'AppColorsTheme(appColor:$appColors)';
}
