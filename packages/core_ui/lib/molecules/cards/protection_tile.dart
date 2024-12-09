import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:core_ui/molecules/texts/app_text.dart';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ProtectionTile extends StatelessWidget {
  const ProtectionTile._(
      {super.key, required this.title, this.decoration, this.trailing});

  factory ProtectionTile.trailingOnly({Key? key, required String title}) {
    return ProtectionTile._(
      key: key,
      title: title,
    );
  }

  factory ProtectionTile.plain(
      {Key? key,
      required BuildContext context,
      required String title,
      VoidCallback? onPressed}) {
    final appColors = Theme.of(context).colorScheme;
    return ProtectionTile._(
      key: key,
      title: title,
      trailing: AppIconButton.filled(
        context: context,
        iconData: Icons.chevron_right,
        iconColor: appColors.onPrimary,
        onPressed: onPressed,
      ),
    );
  }

  factory ProtectionTile.outlined(
      {required String title,
      required BuildContext context,
      VoidCallback? onPressed}) {
    final appColors = Theme.of(context).colorScheme;

    return ProtectionTile._(
      title: title,
      trailing: AppIconButton.filled(
        context: context,
        iconData: Icons.chevron_right,
        iconColor: appColors.onPrimary,
        onPressed: onPressed,
      ),
      decoration: Utils.getDecoration(appColors),
    );
  }

  final String title;

  final BoxDecoration? decoration;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Container(
      decoration: decoration,
      child: _ContentWidget(
        key: key,
        title: title,
        iconColor: appColors.surface,
        trailing: trailing,
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget(
      {super.key, required this.title, required this.iconColor, this.trailing});

  final String title;
  final Color iconColor;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: AppText.bodyMedium(
          text: title,
          context: context,
        ),
        trailing: trailing);
  }
}
