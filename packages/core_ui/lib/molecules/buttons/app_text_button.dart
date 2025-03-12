import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton._({
    super.key,
    required this.label,
    this.color,
    required this.disabledColor,
    this.onTap,
    required this.isEnabled,
  });

  factory AppTextButton.primary({
    Key? key,
    required String label,
    bool isEnabled = true,
    VoidCallback? onTap,
    required BuildContext context,
  }) => AppTextButton._(
    key: key,
    label: label,
    color: appColor(context).primary,
    disabledColor: appColor(context).surface,
    onTap: onTap,
    isEnabled: isEnabled,
  );

  factory AppTextButton.secondary({
    Key? key,
    required String label,
    bool isEnabled = true,
    required VoidCallback onTap,
    required BuildContext context,
  }) => AppTextButton._(
    key: key,
    label: label,
    color: appColor(context).secondary,
    disabledColor: appColor(context).surface,
    onTap: onTap,
    isEnabled: isEnabled,
  );

  static TextTheme appText(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static ColorScheme appColor(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  final String label;
  final VoidCallback? onTap;
  final Color disabledColor;
  final Color? color;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key,
      onPressed: onTap,
      child: AppText.labelLarge(text: label, context: context, color: color),
    );
  }
}
