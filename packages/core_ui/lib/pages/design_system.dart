import 'package:core_ui/core_ui.dart';

import 'package:core_ui/helpers/design_system_helper.dart';
import 'package:core_ui/pages/news_screen.dart';

import 'package:flutter/material.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    //final appTheme = Theme.of(context);

    return GeigerScaffold(
      //backgroundColor: appTheme.colorScheme.surface,
      appBar: const GeigerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeigerSvgImages.assessIcon(width: 50, height: 50),
                GeigerSvgImages.improveIcon(width: 50, height: 50),
                GeigerSvgImages.indicatorIcon(width: 50, height: 50),
              ],
            ),
            Spacing.gapH22,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Theme.of(context).iconTheme.appIcons.appImages.imagesData.image,
                AppButton.primary(
                  label: "News Screen",
                  context: context,
                  onPressed: () {
                    // Navigate to SecondScreen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsScreen()));
                  },
                ),
                AppButton.primary(
                  label: "terms and conditions",
                  context: context,
                  onPressed: () {
                    // Navigate to SecondScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsAndConditionScreen(acceptCondition: (value) {})),
                    );
                  },
                ),
              ],
            ),
            Spacing.gapH22,
            DesignSystemHelper.getColors(),
            Spacing.gapH16,
            DesignSystemHelper.getTexts(),
            Spacing.gapH16,
            DesignSystemHelper.getAppButtons(),
            Spacing.gapH16,
            DesignSystemHelper.getProtectionTileVariant(),
            Spacing.gapH16,
            DesignSystemHelper.getProtectionTileListView(),
            Spacing.gapH16,
            DesignSystemHelper.getTodoTileVariants(),
            Spacing.gapH16,
            DesignSystemHelper.getAppAssestIcons(),
            Spacing.gapH16,
          ],
        ),
      ),
    );
  }
}
