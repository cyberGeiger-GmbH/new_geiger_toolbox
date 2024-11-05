import 'package:core_ui/core_ui.dart';
import 'package:core_ui/golden/golden_test_wrapper.dart';
import 'package:core_ui/molecules/app_text.dart';
import 'package:flutter/material.dart';

class DesignSystemHelper {
  const DesignSystemHelper._();

  static Widget getColors() {
    return GoldenTestWrapper(
      getChild: (context) {
        final appColor = Theme.of(context).appColors.appColor;
        return Wrap(
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
                (color) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: 48,
                    height: 48,
                    color: color,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  static Widget getTexts() {
    return GoldenTestWrapper(getChild: (context) {
      return Wrap(
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
        ]
            .map(
              (text) => Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  color: text.color,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text.text,
                      style: text.textStyle,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }

  static Widget getAppButtons() {
    return GoldenTestWrapper(getChild: (context) {
      return Wrap(
        children: [
          AppTextButton.primary(
              label: "AppTextprimaryButton", onTap: () {}, context: context),
          CenteredTextButton.primary(
              label: "CenteredPrimaryButton", onTap: () {}, context: context),
          AppTextButton.secondary(
              label: "AppTextSecondaryyButton", onTap: () {}, context: context),
          CenteredTextButton.secondary(
              label: "CenteredSecondaryButton", onTap: () {}, context: context),
        ]
            .map(
              (button) => Padding(
                padding: const EdgeInsets.all(4),
                child: Container(child: button),
              ),
            )
            .toList(),
      );
    });
  }

  static Widget getCategoriesCard() {
    return GoldenTestWrapper(getChild: (context) {
      return Wrap(
        children: [
          CategoryCard.elevated(
            label: "Elevated Category Card",
            context: context,
            ontap: () {
              debugPrint("on pressed");
            },
          ),
          CategoryCard.outlined(
            label: "Outlined Category Card",
            context: context,
            ontap: () {},
            icon: Icons.book,
          )
        ]
            .map((card) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: card,
                ))
            .toList(),
      );
    });
  }
}
