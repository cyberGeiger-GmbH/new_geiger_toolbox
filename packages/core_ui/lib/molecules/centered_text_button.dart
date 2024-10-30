import 'package:core_ui/core_ui.dart';
import 'package:core_ui/foundation/app_colors.dart';
import 'package:core_ui/foundation/app_text_style.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/app_text.dart';
import 'package:flutter/material.dart';

class CenteredTextButton extends StatelessWidget {
  const CenteredTextButton._({
    super.key,
    required this.label,
    required this.isPrimary,
    required this.isEnabled,
    required this.onTap,
    required this.background,
    required this.textColor,
  });

  factory CenteredTextButton.primary(
      {Key? key,
      required String label,
      bool isEnabled = true,
      required VoidCallback onTap,
      required BuildContext context}) {
    return CenteredTextButton._(
      key: key,
      label: label,
      isPrimary: true,
      isEnabled: isEnabled,
      onTap: onTap,
      background: isEnabled ? appColor(context).primary : Colors.grey,
      textColor: isEnabled ? appColor(context).onPrimary : Colors.grey.shade700,
    );
  }

  factory CenteredTextButton.secondary(
      {Key? key,
      required String label,
      bool isEnabled = true,
      required VoidCallback onTap,
      required BuildContext context}) {
    return CenteredTextButton._(
      key: key,
      label: label,
      isPrimary: false,
      isEnabled: isEnabled,
      onTap: onTap,
      background: isEnabled ? appColor(context).secondary : Colors.grey,
      textColor:
          isEnabled ? appColor(context).onSecondary : Colors.grey.shade700,
    );
  }

  factory CenteredTextButton.tertiary(
      {Key? key,
      required String label,
      bool isEnabled = true,
      required VoidCallback onTap,
      required BuildContext context}) {
    return CenteredTextButton._(
      key: key,
      label: label,
      isPrimary: false,
      isEnabled: isEnabled,
      onTap: onTap,
      background: isEnabled ? appColor(context).tertiary : Colors.grey,
      textColor:
          isEnabled ? appColor(context).onTertiary : Colors.grey.shade700,
    );
  }

  static AppColors appColor(BuildContext context) {
    return Theme.of(context).appColors.appColor;
  }

  static AppTextStyle appText(BuildContext context) {
    return Theme.of(context).appTextStyles.appTextStyle;
  }

  final String label;
  final bool isPrimary;
  final bool isEnabled;
  final VoidCallback onTap;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: background),
      child: AppText.labelLarge(
        text: label,
        color: textColor,
        context: context,
      ),
    );
  }
}
