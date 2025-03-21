import 'package:core_ui/core_ui.dart';
import 'package:core_ui/gen/fonts.gen.dart';
import 'package:core_ui/tokens/core_color.dart';
import 'package:core_ui/tokens/typography.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

sealed class AppThemeData {
  static ThemeData light =
      FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: CoreColor.primary,
          secondary: CoreColor.secondary,
          primaryContainer: CoreColor.primaryContainer,
          primaryLightRef: CoreColor.primary,
          secondaryContainer: CoreColor.secondaryContainer,
          secondaryLightRef: CoreColor.secondary,
          tertiary: CoreColor.tertiary,
          tertiaryContainer: CoreColor.tertiaryContainer,
          tertiaryLightRef: CoreColor.tertiary,
          error: CoreColor.error,
          errorContainer: CoreColor.errorContainer,
          appBarColor: CoreColor.tertiaryContainer,
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).customAppTheme();

  static ThemeData dark =
      FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: CoreColor.primaryDark,
          secondary: CoreColor.secondaryDark,
          primaryContainer: CoreColor.primaryContainerDark,
          primaryLightRef: CoreColor.primary,
          secondaryContainer: CoreColor.secondaryContainerDark,
          secondaryLightRef: CoreColor.secondary,
          tertiary: CoreColor.tertiaryDark,
          tertiaryContainer: CoreColor.tertiaryContainerDark,
          tertiaryLightRef: CoreColor.tertiary,
          error: CoreColor.errorDark,
          errorContainer: CoreColor.errorContainerDark,
          appBarColor: CoreColor.tertiaryContainerDark,
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          blendOnColors: true,
          useM2StyleDividerInM3: true,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).customAppTheme();
}

/// Custom theming for the app, based on FlexColorScheme.
/// For more details, see: https://docs.flexcolorscheme.com/
extension CustomThemeData on ThemeData {
  ThemeData customAppTheme() {
    // An updated theme with bigger text sizes
    return copyWith(
      textTheme: TextTheme(
        displayLarge: textTheme.displayLarge?.copyWith(
          fontSize: TypoSize.displayLarge,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        displayMedium: textTheme.displayLarge?.copyWith(
          fontSize: TypoSize.displayMedium,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        displaySmall: textTheme.displayLarge?.copyWith(
          fontSize: TypoSize.displaySmall,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        headlineLarge: textTheme.headlineLarge?.copyWith(
          fontSize: TypoSize.headlineLarge,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontSize: TypoSize.headlineMedium,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          fontSize: TypoSize.headlineSmall,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          fontSize: TypoSize.titleLarge,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          fontSize: TypoSize.titleMedium,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        titleSmall: textTheme.titleSmall?.copyWith(
          fontSize: TypoSize.titleSmall,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          fontSize: TypoSize.bodyLarge,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          fontSize: TypoSize.bodyMedium,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        bodySmall: textTheme.bodySmall?.copyWith(
          fontSize: TypoSize.bodySmall,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        labelLarge: textTheme.labelLarge?.copyWith(
          fontSize: TypoSize.labelLarge,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        labelMedium: textTheme.labelMedium?.copyWith(
          fontSize: TypoSize.labelMedium,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
        labelSmall: textTheme.labelSmall?.copyWith(
          fontSize: TypoSize.labelSmall,
          fontFamily: FontFamily.roboto,
          package: FontFamily.package,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(Spacing.p16),
          textStyle: const TextStyle(
            fontSize: TypoSize.labelLarge,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.roboto,
            package: FontFamily.package,
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(padding: const EdgeInsets.all(Spacing.p16)),
      ),
    );
  }
}
