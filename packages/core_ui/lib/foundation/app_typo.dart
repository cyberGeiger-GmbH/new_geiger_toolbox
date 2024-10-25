library core_ui;

import 'package:core_ui/gen/fonts.gen.dart';
import 'package:core_ui/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_typo.freezed.dart';

@freezed
class AppTypo with _$AppTypo {
  AppTypo._();

  factory AppTypo(
      {required TextStyle smallBody,
      required TextStyle reqularBody,
      required TextStyle bigBody,
      required TextStyle smallTitle,
      required TextStyle mediumTitle,
      required TextStyle bigTitle}) = $AppTypo;

  factory AppTypo.regular() => AppTypo(
        smallBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXXSmall,
            decoration: TextDecoration.none),
        reqularBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeBodyText,
            decoration: TextDecoration.none),
        bigBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeH5,
            decoration: TextDecoration.none),
        smallTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeSmall,
            decoration: TextDecoration.none),
        mediumTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeH6,
            decoration: TextDecoration.none),
        bigTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeH5,
            decoration: TextDecoration.none),
      );

  factory AppTypo.small() => AppTypo(
        smallBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXXSmall,
            decoration: TextDecoration.none),
        reqularBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeXSmall,
            decoration: TextDecoration.none),
        bigBody: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeH6,
            decoration: TextDecoration.none),
        smallTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeXSmall,
            decoration: TextDecoration.none),
        mediumTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeSmall,
            decoration: TextDecoration.none),
        bigTitle: const TextStyle(
            fontFamily: FontFamily.ttNorms,
            package: 'core_ui',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeH6,
            decoration: TextDecoration.none),
      );

//sizes
  static const double fontSizeH1 = Typo.sizeXXL;
  static const double fontSizeH2 = Typo.sizeXL;
  static const double fontSizeH3 = Typo.sizeLG;
  static const double fontSizeH4 = Typo.sizeMD;
  static const double fontSizeH5 = Typo.sizeSL;
  static const double fontSizeH6 = Typo.sizeSM;
  static const double fontSizeBodyText = Typo.sizeXS;
  static const double fontSizeLabel = Typo.sizeXS;
  static const double fontSizeLink = Typo.sizeXS;
  static const double fontSizeSmall = Typo.sizeXS;
  static const double fontSizeXSmall = Typo.sizeXXS;
  static const double fontSizeXXSmall = Typo.sizeXXXS;
}
