import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.variant,
  });
  final IconButton variant;

  factory AppIconButton.filled(
      {Key? key,
      required IconData iconData,
      required BuildContext context,
      VoidCallback? onPressed,
      Color? backgroundColor,
      Color? iconColor}) {
    final appColor = Theme.of(context).appColors.appColor;
    return AppIconButton(
      key: key,
      variant: IconButton.filled(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        style: IconButton.styleFrom(
            backgroundColor: backgroundColor ?? appColor.tertiary),
      ),
    );
  }

  factory AppIconButton.outline(
      {Key? key,
      required IconData iconData,
      required BuildContext context,
      VoidCallback? onPressed,
      Color? backgroundColor,
      Color? iconColor}) {
    final appColor = Theme.of(context).appColors.appColor;
    return AppIconButton(
      key: key,
      variant: IconButton.outlined(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        color: backgroundColor ?? appColor.primary,
      ),
    );
  }

  factory AppIconButton.filledTonal(
      {Key? key,
      required IconData iconData,
      required BuildContext context,
      VoidCallback? onPressed,
      Color? backgroudColor,
      Color? iconColor}) {
    final appColor = Theme.of(context).appColors.appColor;
    return AppIconButton(
      key: key,
      variant: IconButton.filledTonal(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        style: IconButton.styleFrom(
            backgroundColor: backgroudColor ?? appColor.tertiaryContainer),
      ),
    );
  }
  factory AppIconButton.defaultStyle(
      {Key? key,
      required IconData iconData,
      required BuildContext context,
      VoidCallback? onPressed,
      Color? backgroundColor,
      Color? iconColor}) {
    final appColor = Theme.of(context).appColors.appColor;
    return AppIconButton(
      key: key,
      variant: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: iconColor,
        ),
        color: backgroundColor ?? appColor.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return variant;
  }
}
