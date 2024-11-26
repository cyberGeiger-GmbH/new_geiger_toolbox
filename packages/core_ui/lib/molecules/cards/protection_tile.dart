import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:core_ui/molecules/texts/app_text.dart';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ProtectionTile extends StatelessWidget {
  const ProtectionTile._(
      {super.key, required this.title, this.decoration, this.trailing});

  final String title;

  final BoxDecoration? decoration;
  final Widget? trailing;

  factory ProtectionTile.trailingOnly(
      {Key? key, required String title}) {
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
    return ProtectionTile._(
      key: key,
      title: title,
      trailing: AppIconButton.filled(
        context: context,
        iconData: Icons.chevron_right,
        //iconColor: iconColor,
        onPressed: onPressed,
      ),
    );
  }

  factory ProtectionTile.outlined(
      {required String title,
      required BuildContext context,
      VoidCallback? onPressed}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ProtectionTile._(
      title: title,
      trailing: AppIconButton.filled(
        context: context,
        iconData: Icons.chevron_right,
        //iconColor: iconColor,
        onPressed: onPressed,
      ),
      decoration: Utils.getDecoration(appColors),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Container(
      decoration: decoration,
      child: _ContentWidget(
        key: key,
        title: title,
        iconColor: appColors.surface,
        trailing: trailing,
        textColor: appColors.defaultColor,
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget(
      {super.key,
      required this.title,
      required this.iconColor,
      this.textColor,
      this.trailing});

  final String title;
  final Color iconColor;
  final Color? textColor;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: AppText.bodyMedium(
          text: title,
          context: context,
          color: textColor,
        ),
        trailing: trailing);
  }
}
