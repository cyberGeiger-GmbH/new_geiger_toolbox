import 'package:flutter/material.dart';

import '../../molecules/buttons/app_icon_button.dart';

class AppAssetsIcons extends StatelessWidget {
  const AppAssetsIcons({super.key, required this.children});

  factory AppAssetsIcons.defaultStyle(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? color,
      required BuildContext context}) {
    final icons = [
      AppIconButton.defaultStyle(
        iconData: Icons.desktop_mac,
        onPressed: desktop,
        backgroundColor: color,
        context: context,
      ),
      AppIconButton.defaultStyle(
        iconData: Icons.list,
        onPressed: todos,
        backgroundColor: color,
        context: context,
      ),
      AppIconButton.defaultStyle(
        iconData: Icons.devices,
        onPressed: devices,
        backgroundColor: color,
        context: context,
      ),
      AppIconButton.defaultStyle(
        iconData: Icons.wifi,
        onPressed: wifi,
        backgroundColor: color,
        context: context,
      )
    ];

    return AppAssetsIcons(children: icons);
  }
  factory AppAssetsIcons.filled(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? background,
      required BuildContext context}) {
    final icons = [
      AppIconButton.filled(
        iconData: Icons.desktop_mac,
        onPressed: desktop,
        backgroundColor: background,
        context: context,
      ),
      AppIconButton.filled(
        iconData: Icons.list,
        onPressed: todos,
        backgroundColor: background,
        context: context,
      ),
      AppIconButton.filled(
        iconData: Icons.devices,
        onPressed: devices,
        backgroundColor: background,
        context: context,
      ),
      AppIconButton.filled(
        iconData: Icons.wifi,
        onPressed: wifi,
        backgroundColor: background,
        context: context,
      )
    ];

    return AppAssetsIcons(children: icons);
  }

  factory AppAssetsIcons.outlined(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? color,
      required BuildContext context}) {
    final icons = [
      AppIconButton.outline(
          iconData: Icons.desktop_mac,
          onPressed: desktop,
          backgroundColor: color,
          context: context),
      AppIconButton.outline(
          iconData: Icons.list,
          onPressed: todos,
          backgroundColor: color,
          context: context),
      AppIconButton.outline(
          iconData: Icons.devices,
          onPressed: devices,
          backgroundColor: color,
          context: context),
      AppIconButton.outline(
          iconData: Icons.wifi,
          onPressed: wifi,
          backgroundColor: color,
          context: context)
    ];

    return AppAssetsIcons(children: icons);
  }

  factory AppAssetsIcons.filledTonal(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      required BuildContext context,
      Color? backgroundColor}) {
    final icons = [
      AppIconButton.filledTonal(
        iconData: Icons.desktop_mac,
        onPressed: desktop,
        backgroudColor: backgroundColor,
        context: context,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.list,
        onPressed: todos,
        backgroudColor: backgroundColor,
        context: context,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.devices,
        onPressed: devices,
        backgroudColor: backgroundColor,
        context: context,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.wifi,
        onPressed: wifi,
        backgroudColor: backgroundColor,
        context: context,
      )
    ];

    return AppAssetsIcons(children: icons);
  }

  final List<AppIconButton> children;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: children);
  }
}
