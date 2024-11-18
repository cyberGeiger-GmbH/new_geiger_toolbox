import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

import '../../foundation/app_radius.dart';
import '../texts/app_text.dart';

class ToolButton extends StatelessWidget {
  const ToolButton._({
    super.key,
    this.style,
    this.onPressed,
    required this.icon,
    required this.text,
  });

  final Widget text;
  final Icon icon;

  final ButtonStyle? style;
  final VoidCallback? onPressed;
  // bool

  factory ToolButton.elevated(
      {Key? key,
      required String label,
      required BuildContext context,
      VoidCallback? ontap,
      IconData? icon}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ToolButton._(
      key: key,
      text: AppText.labelLarge(
        text: label,
        context: context,
        color: appColors.primary,
      ),
      icon: Icon(icon ?? Icons.settings),
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: appColors.surface,
        foregroundColor: appColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.main().asBorderRadius.regular,
        ),
      ),
    );
  }

  factory ToolButton.outlined(
      {Key? key,
      required String label,
      required BuildContext context,
      VoidCallback? onPressed,
      IconData? icon}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ToolButton._(
      key: key,
      text: AppText.labelLarge(
        text: label,
        context: context,
        color: appColors.primary,
      ),
      icon: Icon(icon ?? Icons.settings),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: appColors.surface,
        foregroundColor: appColors.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.main().asBorderRadius.regular,
          side: BorderSide(color: appColors.tertiary),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _CustomButton(
      key: key,
      onPressed: onPressed,
      text: text,
      style: style,
      icon: icon,
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    super.key,
    this.style,
    required this.icon,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final Widget text;
  final ButtonStyle? style;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: _ContentWidget(key: key, icon: icon, text: text));
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          text,
          const Icon(
            Icons.chevron_right_sharp,
          )
        ],
      ),
    );
  }
}
