import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/helpers/design_system_helper.dart';
import 'package:core_ui/molecules/custom_app_bar.dart';
import 'package:core_ui/routing/core_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.appColors.appColor.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          context.goNamed(CoreAppRouter.home.name);
        },
        child: const Icon(Icons.home),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              Theme.of(context).appIcons.appIcon.character.search,
              style: TextStyle(
                  fontSize: Theme.of(context).appIcons.appIcon.sizes.large),
            ),
            Theme.of(context).appImages.imagesData.name,
            DesignSystemHelper.getColors(),
            DesignSystemHelper.getTexts(),
            DesignSystemHelper.getAppButtons(),
            DesignSystemHelper.getCategoriesCard()
          ],
        ),
      ),
    );
  }
}
