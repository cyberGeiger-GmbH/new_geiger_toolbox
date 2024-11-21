import 'package:core_ui/core_ui.dart';

import 'package:core_ui/helpers/design_system_helper.dart';
import 'package:core_ui/pages/news_screen.dart';

import 'package:flutter/material.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.appColors.appColor.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Theme.of(context).appIcons.appIcon.character.search,
              style: TextStyle(
                  fontSize: Theme.of(context).appIcons.appIcon.sizes.large),
            ),
            Spacing.gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme.of(context).appImages.imagesData.image,
                AppButton.primary(
                  label: "News Screen",
                  context: context,
                  onPressed: () {
                    // Navigate to SecondScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewsScreen()),
                    );
                  },
                ),
              ],
            ),
            Spacing.gapH8,
            DesignSystemHelper.getColors(),
            Spacing.gapH16,
            DesignSystemHelper.getTexts(),
            Spacing.gapH16,
            DesignSystemHelper.getAppButtons(),
            Spacing.gapH16,
            DesignSystemHelper.getProtectionTileVariant(),
            Spacing.gapH16,
            DesignSystemHelper.getTileListView(),
            Spacing.gapH16,
            DesignSystemHelper.getTodoTileVariants(),
            Spacing.gapH16,
            DesignSystemHelper.getTodoCheckListView(),
            Spacing.gapH16,
            DesignSystemHelper.getAppAssestIcons(),
            Spacing.gapH16,
          ],
        ),
      ),
    );
  }
}
