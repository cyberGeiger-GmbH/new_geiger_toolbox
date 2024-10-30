// ignore_for_file: public_member_api_docs, sort_constructors_first
library core_ui;

import 'package:core_ui/foundation/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextStyleTheme extends ThemeExtension<AppTextStyleTheme> {
  final AppTextStyle _appText;

  const AppTextStyleTheme._(this._appText);

  factory AppTextStyleTheme.main() =>
      AppTextStyleTheme._(AppTextStyle.regular());

  factory AppTextStyleTheme.big() => AppTextStyleTheme._(AppTextStyle.big());

  AppTextStyle get appTextStyle => _appText;

  @override
  ThemeExtension<AppTextStyleTheme> copyWith() {
    return AppTextStyleTheme._(_appText);
  }

  @override
  ThemeExtension<AppTextStyleTheme> lerp(
      covariant ThemeExtension<AppTextStyleTheme>? other, double t) {
    return this;
  }

 

  @override
  String toString() => 'AppTextStyleTheme(_appText: $_appText)';
}
