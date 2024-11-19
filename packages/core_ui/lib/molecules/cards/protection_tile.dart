import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:core_ui/molecules/texts/app_text.dart';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ProtectionTile extends StatelessWidget {
  const ProtectionTile._(
      {super.key, required this.title, this.decoration, this.onPressed});

  final String title;
  final VoidCallback? onPressed;
  final BoxDecoration? decoration;

  factory ProtectionTile.plain(
      {Key? key, required String title, VoidCallback? onPressed}) {
    return ProtectionTile._(
      key: key,
      title: title,
      onPressed: onPressed,
    );
  }

  factory ProtectionTile.outlined(
      {required String title,
      required BuildContext context,
      VoidCallback? onPressed}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ProtectionTile._(
      title: title,
      onPressed: onPressed,
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
        onPressed: onPressed,
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
      required this.onPressed,
      this.textColor});

  final String title;
  final Color iconColor;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppText.bodyMedium(
        text: title,
        context: context,
        color: textColor,
      ),
      trailing: AppIconButton.filled(
        context: context,
        iconData: Icons.chevron_right,
        iconColor: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}
