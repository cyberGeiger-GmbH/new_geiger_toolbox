import 'package:flutter/material.dart';

import '../molecules/buttons/app_icon_button.dart';

class AppAssetsIcons extends StatelessWidget {
  const AppAssetsIcons({super.key, required this.children});
  final List<AppIconButton> children;

  factory AppAssetsIcons.defaultStyle(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? color}) {
    final icons = [
      AppIconButton.defaultStyle(
        iconData: Icons.desktop_mac,
        onPressed: desktop ?? () {},
        color: color,
      ),
      AppIconButton.defaultStyle(
        iconData: Icons.list,
        onPressed: todos ?? () {},
        color: color,
      ),
      AppIconButton.defaultStyle(
        iconData: Icons.devices,
        onPressed: devices ?? () {},
        color: color,
      ),
      AppIconButton.defaultStyle(
          iconData: Icons.wifi, onPressed: wifi ?? () {}, color: color)
    ];
    return AppAssetsIcons(children: icons);
  }
  factory AppAssetsIcons.filled(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? background}) {
    final icons = [
      AppIconButton.filled(
        iconData: Icons.desktop_mac,
        onPressed: desktop ?? () {},
        color: background,
      ),
      AppIconButton.filled(
        iconData: Icons.list,
        onPressed: todos ?? () {},
        color: background,
      ),
      AppIconButton.filled(
        iconData: Icons.devices,
        onPressed: devices ?? () {},
        color: background,
      ),
      AppIconButton.filled(
        iconData: Icons.wifi,
        onPressed: wifi ?? () {},
        color: background,
      )
    ];
    return AppAssetsIcons(children: icons);
  }

  factory AppAssetsIcons.outlined(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? color}) {
    final icons = [
      AppIconButton.outline(
        iconData: Icons.desktop_mac,
        onPressed: desktop ?? () {},
        color: color,
      ),
      AppIconButton.outline(
        iconData: Icons.list,
        onPressed: todos ?? () {},
        color: color,
      ),
      AppIconButton.outline(
        iconData: Icons.devices,
        onPressed: devices ?? () {},
        color: color,
      ),
      AppIconButton.outline(
          iconData: Icons.wifi, onPressed: wifi ?? () {}, color: color)
    ];
    return AppAssetsIcons(children: icons);
  }

  factory AppAssetsIcons.filledTonal(
      {VoidCallback? desktop,
      VoidCallback? todos,
      VoidCallback? devices,
      VoidCallback? wifi,
      Color? backgroundColor}) {
    final icons = [
      AppIconButton.filledTonal(
        iconData: Icons.desktop_mac,
        onPressed: desktop ?? () {},
        color: backgroundColor,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.list,
        onPressed: todos ?? () {},
        color: backgroundColor,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.devices,
        onPressed: devices ?? () {},
        color: backgroundColor,
      ),
      AppIconButton.filledTonal(
        iconData: Icons.wifi,
        onPressed: wifi ?? () {},
        color: backgroundColor,
      )
    ];
    return AppAssetsIcons(children: icons);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: children);
  }
}
