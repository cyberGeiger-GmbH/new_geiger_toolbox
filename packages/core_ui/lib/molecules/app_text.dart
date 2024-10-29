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

  factory AppText.labelBigEmphasis(
          {Key? key,
          required String text,
          required BuildContext context,
          Color? color,
          TextAlign? textAlign,
          TextOverflow? textOverflow}) =>
      AppText._(
          key: key,
          text: text,
          textStyle: appTexts(context).labelLarge,
          color: color ?? appColors(context).primary,
          textAlign: textAlign ?? TextAlign.start,
          textOverflow: textOverflow);

  static AppTextStyle appTexts(BuildContext context) =>
      Theme.of(context).appTexts.appTextStyle;

  static AppColors appColors(BuildContext context) =>
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
