library core_ui;

import 'package:core_ui/foundation/app_text.dart';
import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  final AppText _appText;

  const AppTextsTheme._(this._appText);

  factory AppTextsTheme.regular() => AppTextsTheme._(AppText.regular());
  factory AppTextsTheme.big() => AppTextsTheme._(AppText.big());

  AppText get appText => _appText;

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme._(appText);
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
      covariant ThemeExtension<AppTextsTheme>? other, double t) {
    return this;
  }

  @override
  String toString() => 'AppTextTheme(appTypo:$appText)';
}
