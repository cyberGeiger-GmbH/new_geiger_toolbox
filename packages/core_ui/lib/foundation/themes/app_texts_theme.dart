library core_ui;

import 'package:core_ui/foundation/app_typo.dart';
import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  final AppTypo appText;

  const AppTextsTheme._({required this.appText});

  factory AppTextsTheme.main() => AppTextsTheme._(appText: AppTypo.regular());
  factory AppTextsTheme.small() => AppTextsTheme._(appText: AppTypo.small());

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme._(appText: appText);
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
      covariant ThemeExtension<AppTextsTheme>? other, double t) {
    return this;
  }

  @override
  String toString() => 'AppTextTheme(appTypo:$appText)';
}
