library core_ui;

import 'package:core_ui/atoms/app_icons.dart';
import 'package:flutter/material.dart';

class AppIconsTheme extends ThemeExtension<AppIconsTheme> {
  final AppIconData appIcon;

  const AppIconsTheme._(this.appIcon);

  factory AppIconsTheme.main() => AppIconsTheme._(AppIconData.regular());

  @override
  ThemeExtension<AppIconsTheme> copyWith() {
    return AppIconsTheme._(appIcon);
  }

  @override
  ThemeExtension<AppIconsTheme> lerp(
      covariant ThemeExtension<ThemeExtension>? other, double t) {
    return this;
  }
}
