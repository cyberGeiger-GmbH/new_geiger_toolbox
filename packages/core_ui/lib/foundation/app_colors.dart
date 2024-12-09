library core_ui;

import 'package:core_ui/tokens/core_color.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_colors.freezed.dart';


@freezed
class AppColors with _$AppColors {
  const factory AppColors(
      {required Brightness brightness,
      required Color primary,
      required Color onPrimary,
      required Color primaryContainer,
      required Color onPrimaryContainer,
      required Color secondary,
      required Color onSecondary,
      required Color secondaryContainer,
      required Color onSecondaryContainer,
      required Color tertiary,
      required Color onTertiary,
      required Color tertiaryContainer,
      required Color onTertiaryContainer,
      required Color surface,
      required Color onSurface,
      required Color error,
      required Color onError,
      required Color errorContainer,
      required Color onErrorContainer,
      required Color scaffoldBackgroundColor,
    }) = _AppColors;

  factory AppColors.light() => const AppColors(
      brightness: Brightness.light,
      primary: CoreColor.primary,
      onPrimary: CoreColor.onPrimary,
      primaryContainer: CoreColor.primaryContainer,
      onPrimaryContainer: CoreColor.onPrimaryContainer,
      secondary: CoreColor.secondary,
      onSecondary: CoreColor.onSecondary,
      secondaryContainer: CoreColor.secondaryContainer,
      onSecondaryContainer: CoreColor.onSecondaryContainer,
      tertiary: CoreColor.tertiary,
      onTertiary: CoreColor.onTertiary,
      tertiaryContainer: CoreColor.tertiaryContainer,
      onTertiaryContainer: CoreColor.onTertiaryContainer,
      surface: CoreColor.surface,
      onSurface: CoreColor.onSurface,
      error: CoreColor.error,
      onError: CoreColor.onError,
      errorContainer: CoreColor.errorContainer,
      onErrorContainer: CoreColor.onErrorContainer,
      scaffoldBackgroundColor: CoreColor.surface,
      );

  factory AppColors.dark() => const AppColors(
      brightness: Brightness.dark,
      primary: CoreColor.onPrimaryDark,
      onPrimary: CoreColor.onPrimaryContainerDark,
      primaryContainer: CoreColor.primaryContainerDark,
      onPrimaryContainer: CoreColor.onPrimaryContainerDark,
      secondary: CoreColor.secondaryDark,
      onSecondary: CoreColor.onSecondaryDark,
      secondaryContainer: CoreColor.secondaryContainerDark,
      onSecondaryContainer: CoreColor.onSecondaryContainerDark,
      tertiary: CoreColor.tertiaryDark,
      onTertiary: CoreColor.onTertiaryDark,
      tertiaryContainer: CoreColor.tertiaryContainerDark,
      onTertiaryContainer: CoreColor.onTertiaryContainerDark,
      surface: CoreColor.surfaceDark,
      onSurface: CoreColor.onSurfaceDark,
      error: CoreColor.error,
      onError: CoreColor.onError,
      errorContainer: CoreColor.errorContainer,
      onErrorContainer: CoreColor.onErrorContainer,
      scaffoldBackgroundColor: CoreColor.surfaceDark,
      );
}
