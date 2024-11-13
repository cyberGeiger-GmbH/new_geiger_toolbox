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
          textStyle: _appTextStyles(context).displayLarge,
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
          textStyle: _appTextStyles(context).displayMedium,
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
          textStyle: _appTextStyles(context).displaySmall,
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
          textStyle: _appTextStyles(context).headlineLarge,
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
          textStyle: _appTextStyles(context).headlineMedium,
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
          textStyle: _appTextStyles(context).headlineSmall,
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
          textStyle: _appTextStyles(context).titleLarge,
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
          textStyle: _appTextStyles(context).titleMedium,
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
          textStyle: _appTextStyles(context).titleSmall,
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
          textStyle: _appTextStyles(context).labelLarge,
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
          textStyle: _appTextStyles(context).labelMedium,
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
          textStyle: _appTextStyles(context).labelSmall,
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
          textStyle: _appTextStyles(context).bodyLarge,
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
          textStyle: _appTextStyles(context).bodyMedium,
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
          textStyle: _appTextStyles(context).bodySmall,
          color: color ?? _appColors(context).onPrimary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  static AppTextStyle _appTextStyles(BuildContext context) =>
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
