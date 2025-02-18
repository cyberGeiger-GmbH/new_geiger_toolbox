import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.height = kToolbarHeight, this.title, this.userProfile, this.onCloseProfile});

  final double height;
  final String? title;
  final VoidCallback? userProfile;
  final VoidCallback? onCloseProfile;
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;

    return AppBar(
      title: title != null ? AppText.titleMedium(text: title ?? "", context: context) : null,
      leading:
          title == null
              ? Padding(padding: const EdgeInsets.all(8.0), child: AppAssetImageData.logoIcon().image)
              : onCloseProfile != null
              ? IconButton(onPressed: onCloseProfile, icon: const Icon(Icons.close))
              : null,
      actions: [
        Padding(
          padding: const EdgeInsets.all(Spacing.p8),
          child: IconButton(icon: const Icon(Icons.person), onPressed: userProfile),
        ),
      ],
      backgroundColor: appColor.onPrimary,
      //surfaceTintColor: appColor.error,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
