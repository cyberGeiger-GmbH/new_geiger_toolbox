library core_ui;

import 'package:core_ui/foundation/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  final AppTextStyle _appText;

  const AppTextsTheme._(this._appText);

  factory AppTextsTheme.regular() => AppTextsTheme._(AppTextStyle.regular());
  factory AppTextsTheme.big() => AppTextsTheme._(AppTextStyle.big());

  AppTextStyle get appTextStyle => _appText;

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme._(_appText);
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
      covariant ThemeExtension<AppTextsTheme>? other, double t) {
    return this;
  }

  @override
  String toString() => 'AppTextTheme(appTypo:$appTextStyle)';
}
