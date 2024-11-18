import 'package:core_ui/atoms/app_images_data.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors.appColor;

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppImagesData.logoIcon().name,
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.person_outline),
        )
      ],
      backgroundColor: appColor.scaffoldBackgroundColor,
      surfaceTintColor: appColor.scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
