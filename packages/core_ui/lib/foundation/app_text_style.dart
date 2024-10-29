library core_ui;

import 'package:core_ui/gen/fonts.gen.dart';
import 'package:core_ui/tokens/typography.dart' as typo;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_text_style.freezed.dart';

@freezed
class AppTextStyle with _$AppTextStyle {
  const AppTextStyle._();

  const factory AppTextStyle(
      {required TextStyle displayLarge,
      required TextStyle displayMedium,
      required TextStyle displaySmall,
      required TextStyle headlineLarge,
      required TextStyle headlineMedium,
      required TextStyle headlineSmall,
      required TextStyle titleLarge,
      required TextStyle titleMedium,
      required TextStyle titleSmall,
      required TextStyle labelLarge,
      required TextStyle labelMedium,
      required TextStyle labelSmall,
      required TextStyle bodyLarge,
      required TextStyle bodyMedium,
      required TextStyle bodySmall}) = _AppTextStyle;

  factory AppTextStyle.regular() => const AppTextStyle(
        bodySmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeBs,
            decoration: TextDecoration.none),
        bodyMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeBm,
            decoration: TextDecoration.none),
        bodyLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeBl,
            decoration: TextDecoration.none),
        labelSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeLs,
            decoration: TextDecoration.none),
        labelMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeLm,
            decoration: TextDecoration.none),
        labelLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeLl,
            decoration: TextDecoration.none),
        titleSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeTs,
            decoration: TextDecoration.none),
        titleMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeTm,
            decoration: TextDecoration.none),
        titleLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeTl,
            decoration: TextDecoration.none),
        headlineSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeHs,
            decoration: TextDecoration.none),
        headlineMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeHm,
            decoration: TextDecoration.none),
        headlineLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeHl,
            decoration: TextDecoration.none),
        displaySmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeDs,
            decoration: TextDecoration.none),
        displayMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeDm,
            decoration: TextDecoration.none),
        displayLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.normal,
            fontSize: fontSizeDl,
            decoration: TextDecoration.none),
      );

  factory AppTextStyle.big() => const AppTextStyle(
        bodySmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeBsB,
            decoration: TextDecoration.none),
        bodyMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXBm,
            decoration: TextDecoration.none),
        bodyLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXBl,
            decoration: TextDecoration.none),
        labelSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeLsB,
            decoration: TextDecoration.none),
        labelMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXLm,
            decoration: TextDecoration.none),
        labelLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXLl,
            decoration: TextDecoration.none),
        titleSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeTsB,
            decoration: TextDecoration.none),
        titleMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXTm,
            decoration: TextDecoration.none),
        titleLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXTl,
            decoration: TextDecoration.none),
        headlineSmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeHsB,
            decoration: TextDecoration.none),
        headlineMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXHm,
            decoration: TextDecoration.none),
        headlineLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXHl,
            decoration: TextDecoration.none),
        displaySmall: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeDsB,
            decoration: TextDecoration.none),
        displayMedium: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXDm,
            decoration: TextDecoration.none),
        displayLarge: TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXDl,
            decoration: TextDecoration.none),
      );

//display sizes
  static const double fontSizeXDl = typo.Typography.sizeXXLB;
  static const double fontSizeDl = typo.Typography.sizeXXL;

  static const double fontSizeXDm = typo.Typography.sizeXLB;
  static const double fontSizeDm = typo.Typography.sizeXL;

  static const double fontSizeDsB = typo.Typography.sizeXLSB;
  static const double fontSizeDs = typo.Typography.sizeLS;

//headline sizes
  static const double fontSizeXHl = typo.Typography.sizeLSB;
  static const double fontSizeHl = typo.Typography.sizeL;

  static const double fontSizeXHm = typo.Typography.sizeLS;
  static const double fontSizeHm = typo.Typography.sizeXXMB;

  static const double fontSizeHsB = typo.Typography.sizeL;
  static const double fontSizeHs = typo.Typography.sizeXMB;

// title sizes
  static const double fontSizeXTl = typo.Typography.sizeXXMB;
  static const double fontSizeTl = typo.Typography.sizeMB;

  static const double fontSizeXTm = typo.Typography.sizeXMB;
  static const double fontSizeTm = typo.Typography.sizeMS;

  static const double fontSizeTsB = typo.Typography.sizeM;
  static const double fontSizeTs = typo.Typography.sizeSM;

//label sizes
  static const double fontSizeXLl = typo.Typography.sizeM;
  static const double fontSizeLl = typo.Typography.sizeSM;

  static const double fontSizeXLm = typo.Typography.sizeMS;
  static const double fontSizeLm = typo.Typography.sizeS;

  static const double fontSizeLsB = typo.Typography.sizeMS;
  static const double fontSizeLs = typo.Typography.sizeXS;

  //body sizes
  static const double fontSizeXBl = typo.Typography.sizeXMB;
  static const double fontSizeBl = typo.Typography.sizeM;

  static const double fontSizeXBm = typo.Typography.sizeM;
  static const double fontSizeBm = typo.Typography.sizeSM;

  static const double fontSizeBsB = typo.Typography.sizeMS;
  static const double fontSizeBs = typo.Typography.sizeS;
}
