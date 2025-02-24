import 'package:core_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppText extends StatelessWidget {
  const AppText._({
    super.key,
    required this.text,
    required this.textStyle,
    required this.textAlign,
    required this.textOverflow,
  });

  factory AppText.displayLarge({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).displayLarge!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.displayMedium({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).displayMedium!.copyWith(color: color, fontWeight: fontWeight),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.displaySmall({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).displaySmall!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.headlineLarge({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).headlineLarge!.copyWith(color: color, fontWeight: fontWeight),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.headlineMedium({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).headlineMedium!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.headlineSmall({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).headlineSmall!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.titleLarge({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).titleLarge!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.titleMedium({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
    bool textRemoved = false,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(
      context,
    ).titleMedium!.copyWith(color: color, decoration: textRemoved ? TextDecoration.lineThrough : null),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.titleSmall({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).titleSmall!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.labelLarge({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    FontWeight? fontWeight,
    bool textDeleted = false,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).labelLarge!.copyWith(
      color: color,
      decoration: textDeleted ? TextDecoration.lineThrough : null,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.labelMedium({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).labelMedium!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.labelSmall({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).labelSmall!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.bodyLarge({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(context).bodyLarge!.copyWith(color: color),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  factory AppText.bodyMedium({
    Key? key,
    required String text,
    required BuildContext context,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    bool textRemoved = false,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(
      context,
    ).bodyMedium!.copyWith(color: color, decoration: textRemoved ? TextDecoration.lineThrough : null),
    textAlign: textAlign ?? TextAlign.center,
    textOverflow: textOverflow,
  );

  factory AppText.bodySmall({
    Key? key,
    required String text,
    required BuildContext context,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
    bool textRemoved = false,
  }) => AppText._(
    key: key,
    text: text,
    textStyle: _appTextStyles(
      context,
    ).bodySmall!.copyWith(color: color, decoration: textRemoved ? TextDecoration.lineThrough : null),
    textAlign: textAlign ?? TextAlign.start,
    textOverflow: textOverflow,
  );

  static TextTheme _appTextStyles(BuildContext context) => Theme.of(context).textTheme;

  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      key: key,
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: textStyle.copyWith(fontFamily: FontFamily.ttNorms, package: 'core_ui'),
    );
  }
}
