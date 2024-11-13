import 'package:core_ui/core_ui.dart';
import 'package:core_ui/golden/golden_test_wrapper.dart';
import 'package:flutter/material.dart';

class DesignSystemHelper {
  const DesignSystemHelper._();

  static Widget getColors() {
    return GoldenTestWrapper(
      getChild: (context) {
        final appColor = Theme.of(context).appColors.appColor;
        return Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                appColor.primary,
                appColor.onPrimary,
                appColor.secondary,
                appColor.onSecondary,
                appColor.tertiary,
                appColor.onTertiary,
                appColor.error,
                appColor.onError,
                appColor.surface,
                appColor.onSurface,
                appColor.primaryContainer,
                appColor.onPrimaryContainer,
                appColor.secondaryContainer,
                appColor.onSecondaryContainer,
                appColor.tertiaryContainer,
                appColor.onTertiaryContainer,
                appColor.errorContainer,
                appColor.onErrorContainer,
              ]
                  .map(
                    (color) => Container(
                      width: 48,
                      height: 48,
                      color: color,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  static Widget getTexts() {
    return GoldenTestWrapper(getChild: (context) {
      return Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.displayLarge(
                text: 'displayLarge',
                context: context,
              ),
              AppText.displayMedium(
                text: 'displayMedium',
                context: context,
              ),
              AppText.displaySmall(
                text: 'displaysmall',
                context: context,
              ),
              AppText.headlineLarge(
                text: 'headlineLarge',
                context: context,
              ),
              AppText.headlineMedium(
                text: 'headlineMedium',
                context: context,
              ),
              AppText.headlineSmall(
                text: 'headlineSmall',
                context: context,
              ),
              AppText.titleLarge(
                text: 'titleLarge',
                context: context,
              ),
              AppText.titleMedium(
                text: 'titleMedium',
                context: context,
              ),
              AppText.titleSmall(
                text: 'titleSmall',
                context: context,
              ),
              AppText.labelLarge(
                text: 'LabelLarge',
                context: context,
              ),
              AppText.labelMedium(
                text: 'LabelMedium',
                context: context,
              ),
              AppText.labelSmall(
                text: 'LabelSmall',
                context: context,
              ),
              AppText.bodyLarge(
                text: 'bodyLarge',
                context: context,
              ),
              AppText.bodyMedium(
                text: 'bodyMedium',
                context: context,
              ),
              AppText.bodySmall(
                text: 'bodySmall',
                context: context,
              ),
            ].map((text) => text).toList(),
          ),
        ),
      );
    });
  }

  static Widget getAppButtons() {
    return GoldenTestWrapper(getChild: (context) {
      return Container(
        color: Colors.black12,
        child: Wrap(
          spacing: 1,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextButton.primary(
                label: "AppTextprimaryButton", onTap: () {}, context: context),
            AppTextButton.secondary(
                label: "AppTextSecondaryyButton",
                onTap: () {},
                context: context),
            AppButton.primary(
                label: "Primary Button", onPressed: () {}, context: context),
            AppButton.secondary(
                label: "Secondary Button", onPressed: () {}, context: context),
            AppButton.tertiary(
                label: "Tertiary Button", onPressed: () {}, context: context),
            AppButton.scan(onPressed: () {}, label: "Scan", context: context),
            AppButton.news(
                onPressed: () {},
                title:
                    "Cyberbetrug durch Telefontricks verbreitet, news about threat aowfjoawfjwo",
                context: context),
            AppButton.news(onPressed: () {}, title: "News 1", context: context),
            AppButton.news(onPressed: () {}, title: "News 3", context: context),
            AppButton.activeNews(
                onPressed: () {}, title: "Active News", context: context),
            ToolButton.elevated(
              label: "Elevated Category Card",
              context: context,
              ontap: () {
                debugPrint("on pressed");
              },
            ),
            ToolButton.outlined(
              label: "Outlined Category Card",
              context: context,
              ontap: () {},
              icon: Icons.book,
            ),
          ]
              .map(
                (button) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: button,
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
