import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class GeigerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeigerAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.title,
    this.userProfile,
    this.closeDefaultProfile,
    this.mainScreen = false,
  });

  final double height;
  final String? title;
  final VoidCallback? userProfile;
  final VoidCallback? closeDefaultProfile;
  final bool mainScreen;
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;

    return AppBar(
      title: title != null ? AppText.titleMedium(text: title ?? "", context: context) : null,
      leading:
          shouldShowBackButton(context)
              ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back),
              )
              : closeDefaultProfile != null
              ? IconButton(onPressed: closeDefaultProfile, icon: const Icon(Icons.close))
              : null,

      actions: [IconButton(icon: const Icon(Icons.person), onPressed: userProfile)],
      backgroundColor: mainScreen ? appColor.primaryContainer : appColor.onPrimary,
      //surfaceTintColor: appColor.error,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

//check if the current route is the first route
bool shouldShowBackButton(BuildContext context) {
  return ModalRoute.of(context)?.isFirst == false; // Not the first screen
}
