import 'package:core_ui/foundation/app_colors.dart';
import 'package:core_ui/foundation/app_text_style.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton._(
      {super.key,
      required this.label,
      required this.color,
      required this.disabledColor,
      required this.onTap,
      required this.isEnabled});

  factory AppTextButton.primary(
          {Key? key,
          required String label,
          bool isEnabled = true,
          required VoidCallback onTap,
          required BuildContext context}) =>
      AppTextButton._(
          key: key,
          label: label,
          color: appColor(context).primary,
          disabledColor: appColor(context).surface,
          onTap: onTap,
          isEnabled: isEnabled);

  factory AppTextButton.secondary(
          {Key? key,
          required String label,
          bool isEnabled = true,
          required VoidCallback onTap,
          required BuildContext context}) =>
      AppTextButton._(
          key: key,
          label: label,
          color: appColor(context).secondary,
          disabledColor: appColor(context).surface,
          onTap: onTap,
          isEnabled: isEnabled);

  final String label;
  final VoidCallback onTap;
  final Color disabledColor;
  final Color color;
  final bool isEnabled;

  static AppTextStyle appText(BuildContext context) {
    return Theme.of(context).appTextStyles.appTextStyle;
  }

  static AppColors appColor(BuildContext context) {
    return Theme.of(context).appColors.appColor;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: onTap,
      child: AppText.labelLarge(
        text: label,
        context: context,
        color: isEnabled ? color : disabledColor,
      ),
    );
  }
}
