import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class ToolButton extends StatelessWidget {
  const ToolButton._({
    super.key,
    this.outlinedColor,
    this.ontap,
    required this.icon,
    required this.text,
    required this.backgroundColor,
  });

  final Widget text;
  final Icon icon;
  final Color backgroundColor;
  final Color? outlinedColor;
  final VoidCallback? ontap;
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
      text: AppText.titleLarge(
        text: label,
        context: context,
        color: appColors.primary,
      ),
      backgroundColor: appColors.surface,
      icon: Icon(icon ?? Icons.settings),
      ontap: ontap,
    );
  }

  factory ToolButton.outlined(
      {Key? key,
      required String label,
      required BuildContext context,
      VoidCallback? ontap,
      IconData? icon}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ToolButton._(
      key: key,
      text: AppText.titleLarge(
        text: label,
        context: context,
        color: appColors.primary,
      ),
      backgroundColor: appColors.surface,
      outlinedColor: appColors.tertiary,
      icon: Icon(icon ?? Icons.settings),
      ontap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      key: key,
      backgroundColor: backgroundColor,
      ontap: ontap,
      text: text,
      outlinedColor: outlinedColor,
      icon: icon,
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.outlinedColor,
    required this.icon,
    required this.backgroundColor,
    required this.ontap,
    required this.text,
  });

  final Color backgroundColor;
  final VoidCallback? ontap;
  final Widget text;
  final Color? outlinedColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: outlinedColor != null
                ? BorderSide(color: outlinedColor!)
                : BorderSide.none),
      ),
      onPressed: ontap,
      child: _ContentWidget(key: key, icon: icon, text: text),
    );
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
    return Padding(
      key: key,
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          Center(child: text),
          const Icon(Icons.chevron_right_sharp)
        ],
      ),
    );
  }
}
