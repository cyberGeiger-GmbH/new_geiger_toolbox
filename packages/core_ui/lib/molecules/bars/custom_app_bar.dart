import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:core_ui/foundation/themes/theme_data_extended.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.height = kToolbarHeight, this.title});

  final double height;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors.appColor;

    return AppBar(
      title: title != null
          ? AppText.titleMedium(
              text: title??"",
              context: context,
              color: appColor.defaultColor,
            )
          : null,
      leading: title == null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppAssetImageData.logoIcon().image,
            )
          : null,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.person_outline),
        )
      ],
      backgroundColor: appColor.onSecondary,
      //surfaceTintColor: appColor.error,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
