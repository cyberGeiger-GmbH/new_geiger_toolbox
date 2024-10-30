import 'package:core_ui/foundation/app_colors.dart';
import 'package:core_ui/foundation/app_text_style.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText._(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.color,
      required this.textAlign,
      required this.textOverflow});

  factory AppText.displayLarge(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).displayLarge,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.displayMedium(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).displayMedium,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.displaySmall(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).displaySmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.headlineLarge(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).headlineLarge,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.headlineMedium(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).headlineMedium,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.headlineSmall(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).headlineSmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.titleLarge(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).titleLarge,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.titleMedium(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).titleMedium,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.titleSmall(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).titleSmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.labelLarge(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).labelLarge,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.labelMedium(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).labelMedium,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.labelSmall(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).labelSmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.bodyLarge(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).bodyLarge,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.bodyMedium(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).bodyMedium,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  factory AppText.bodySmall(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: _appTexts(context).bodySmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  static AppTextStyle _appTexts(BuildContext context) =>
      Theme.of(context).appTextStyles.appTextStyle;

  static AppColors _appColors(BuildContext context) =>
      Theme.of(context).appColors.appColor;

  final String text;
  final TextStyle textStyle;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      key: key,
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: textStyle.copyWith(color: color),
    );
  }
}
