// ignore_for_file: public_member_api_docs, sort_constructors_first
library core_ui;

import 'package:core_ui/foundation/app_colors.dart';
import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final AppColors _appColors;

  AppColors get appColor => _appColors;

  const AppColorsTheme._(this._appColors);

  factory AppColorsTheme.light() => AppColorsTheme._(AppColors.light());

  factory AppColorsTheme.dark() => AppColorsTheme._(AppColors.dark());

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    return (lightMode == null || lightMode)
        ? AppColorsTheme.light()
        : AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
      covariant ThemeExtension<AppColorsTheme>? other, double t) {
    return this;
  }

  @override
  String toString() => 'AppColorsTheme(_appColors: $_appColors)';
}
