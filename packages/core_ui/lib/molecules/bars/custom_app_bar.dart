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
      title: AppImagesData.logoIcon().name,
      actions: const [Icon(Icons.ac_unit)],
      backgroundColor: appColor.scaffoldBackgroundColor,
      surfaceTintColor: appColor.scaffoldBackgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
