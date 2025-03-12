// ignore_for_file: no-empty-block, no-magic-number

import 'package:core_ui/golden/golden_test_wrapper.dart';
import 'package:core_ui/molecules/cards/protection_tile.dart';
import 'package:core_ui/molecules/cards/todo_tile.dart';
import 'package:core_ui/organisms/list/app_assets_icons.dart';
import 'package:core_ui/organisms/list/recommendation_tile_list_view.dart';
import 'package:core_ui/organisms/list/todo_tile_list_view.dart';
import 'package:flutter/material.dart';

import '../molecules/buttons/app_button.dart';
import '../molecules/buttons/app_text_button.dart';
import '../molecules/buttons/tool_button.dart';
import '../molecules/texts/app_text.dart';

class DesignSystemHelper {
  const DesignSystemHelper._();

  static Widget getColors() {
    return GoldenTestWrapper(
      getChild: (context) {
        final appColor = Theme.of(context).colorScheme;

        return Container(
          width: double.infinity,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children:
                  [
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
                  ].map((color) => Container(width: 48, height: 48, color: color)).toList(),
            ),
          ),
        );
      },
    );
  }

  static Widget getTexts() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Container(
          width: double.infinity,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  [
                    AppText.displayLarge(text: 'displayLarge', context: context),
                    AppText.displayMedium(text: 'displayMedium', context: context),
                    AppText.displaySmall(text: 'displaysmall', context: context),
                    AppText.headlineLarge(text: 'headlineLarge', context: context),
                    AppText.headlineMedium(text: 'headlineMedium', context: context),
                    AppText.headlineSmall(text: 'headlineSmall', context: context),
                    AppText.titleLarge(text: 'titleLarge', context: context),
                    AppText.titleMedium(text: 'titleMedium', context: context),
                    AppText.titleSmall(text: 'titleSmall', context: context),
                    AppText.labelLarge(text: 'LabelLarge', context: context),
                    AppText.labelMedium(text: 'LabelMedium', context: context),
                    AppText.labelSmall(text: 'LabelSmall', context: context),
                    AppText.bodyLarge(text: 'bodyLarge', context: context),
                    AppText.bodyMedium(text: 'bodyMedium', context: context),
                    AppText.bodySmall(text: 'bodySmall', context: context),
                  ].map((text) => text).toList(),
            ),
          ),
        );
      },
    );
  }

  static Widget getAppButtons() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Container(
          width: double.infinity,
          color: Colors.black12,
          child: Wrap(
            spacing: 1,
            //crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children:
                [
                  AppTextButton.primary(label: "Primary text btn", onTap: () {}, context: context),
                  AppTextButton.secondary(label: "Secondary text btn", onTap: () {}, context: context),
                  AppButton.primary(label: " Active Primary btn", onPressed: () {}, context: context),
                  AppButton.secondary(label: "Active Secondary btn", onPressed: () {}, context: context),
                  AppButton.tertiary(label: "Active Tertiary btn", onPressed: () {}, context: context),
                  AppButton.primary(label: " Inactive Primary btn", context: context),
                  AppButton.secondary(label: "Inactive Secondary btn", context: context),
                  AppButton.tertiary(label: "Inactive Tertiary btn", context: context),

                  AppButton.newsCard(onPressed: () {}, title: "News Card", context: context),
                  AppButton.activeNewsCard(onPressed: () {}, title: "Active News Card", context: context),
                  ToolButton.elevated(
                    label: "Elevated Tool Card",
                    context: context,
                    ontap: () {
                      debugPrint("on pressed");
                    },
                  ),
                  ToolButton.outlined(
                    label: "Outlined Tool Card",
                    context: context,
                    onPressed: () {},
                    icon: Icons.book,
                  ),
                ].map((button) => Padding(padding: const EdgeInsets.all(8.0), child: button)).toList(),
          ),
        );
      },
    );
  }

  static Widget getAppAssestIcons() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Container(
          color: Colors.black12,
          child: Column(
            children:
                [
                  AppAssetsIcons.defaultStyle(
                    context: context,
                    desktop: () {},
                    wifi: () {},
                    todos: () {},
                    devices: () {},
                  ),
                  AppAssetsIcons.filled(context: context, desktop: () {}, wifi: () {}, todos: () {}, devices: () {}),
                  AppAssetsIcons.filledTonal(context: context),
                  AppAssetsIcons.outlined(context: context, desktop: () {}, wifi: () {}, todos: () {}, devices: () {}),
                ].map((button) => button).toList(),
          ),
        );
      },
    );
  }

  static Widget getProtectionTileVariant() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Column(
          children:
              [
                ProtectionTile.plain(context: context, title: "Plain Protection Content", onPressed: () {}),
                ProtectionTile.outlined(context: context, title: "Card Protection Content ", onPressed: () {}),
              ].map((button) => button).toList(),
        );
      },
    );
  }

  static Widget getProtectionTileListView() {
    return GoldenTestWrapper(
      getChild: (context) {
        final data = [
          "Two-Factor Authentication (2FA)",
          "VPN and Secure Connections",
          "Control Remote Access Software",
        ];

        return ProtectionTileListView(
          protectionTile: data.map((value) => ProtectionTile.plain(context: context, title: value)).toList(),
        );
      },
    );
  }

  static Widget getTodoTileVariants() {
    return GoldenTestWrapper(
      getChild: (context) {
        return Column(
          
          children:
              [
                TodoTile.plain(
                  title: "Swiss Crime Prevention (SKP)",
                  summary: "Provides informational materials and prevention campaigns on phone fraud",
                  done: true,
                  onChange: (value) {
                    debugPrint("checkbox pressed $value");
                  },
                ),
                TodoTile.outlined(
                  context: context,
                  title: "Swiss Crime Prevention (SKP)",
                  summary: "Provides informational materials and prevention campaigns on phone fraud",
                  done: true,
                  onChange: (value) {
                    debugPrint("checkbox pressed $value");
                  },
                ),
              ].map((button) => button).toList(),
        );
      },
    );
  }

  static Widget getTodoCheckListView() {
    return GoldenTestWrapper(
      getChild: (context) {
        final List<Todo> data = [
          Todo(
            title: "Swiss Crime Prevention (SKP)",
            summary: "Provides informational materials and prevention campaigns on phone fraud",
          ),
          Todo(
            title: "Zurich Cantonal Police",
            summary: "Dedicated prevention pages with tips and information about phone fraud",
            value: true,
          ),
        ];

        return TodoTileListView(
          todoTile:
              data
                  .map(
                    (value) => TodoTile.plain(
                      summary: value.summary,
                      title: value.title,
                      done: value.value,
                      onChange: (value) {},
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

class Todo {
  final String title;
  final String summary;
  final bool value;
  Todo({required this.title, required this.summary, this.value = false});
}
