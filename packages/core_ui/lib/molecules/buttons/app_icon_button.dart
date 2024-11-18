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
      VoidCallback? onPressed,
      Color? color}) {
    return AppIconButton(
      key: key,
      variant: IconButton.filled(
        onPressed: onPressed,
        icon: Icon(iconData),
        style: IconButton.styleFrom(backgroundColor: color),
      ),
    );
  }

  factory AppIconButton.outline(
      {Key? key,
      required IconData iconData,
      VoidCallback? onPressed,
      Color? color}) {
    return AppIconButton(
      key: key,
      variant: IconButton.outlined(
        onPressed: onPressed,
        icon: Icon(iconData),
        color: color,
      ),
    );
  }

  factory AppIconButton.filledTonal(
      {Key? key,
      required IconData iconData,
      VoidCallback? onPressed,
      Color? color}) {
    return AppIconButton(
      key: key,
      variant: IconButton.filledTonal(
        onPressed: onPressed,
        icon: Icon(iconData),
        style: IconButton.styleFrom(backgroundColor: color),
      ),
    );
  }
  factory AppIconButton.defaultStyle(
      {Key? key,
      required IconData iconData,
      VoidCallback? onPressed,
      Color? color}) {
    return AppIconButton(
      key: key,
      variant: IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return variant;
  }
}
