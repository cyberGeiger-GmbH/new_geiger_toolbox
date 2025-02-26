import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

void showWoltModalBottomSheet(
  BuildContext context, {
  required String title,
  required Widget page,
  Widget? stickyActionBar,
  double horizontalPadding = Spacing.p16,
  bool forceMaxHeight = true,
}) {
  WoltModalSheet.show(
    modalTypeBuilder: (context) => WoltModalType.bottomSheet(),
    context: context,
    barrierDismissible: false,

    pageListBuilder: (bottomSheetContext) {
      return [
        _takeActionSliverWolModalSheetPage(
          context,
          title: title,
          mainContent: page,
          stickyActionBar: stickyActionBar,
          forceMaxHeight: forceMaxHeight,
          horizontalPadding: horizontalPadding,
        ),
      ];
    },
  );
}

void showWoltAlertDialog(
  BuildContext context, {
  required String title,
  required Widget mainContent,
  bool forceMaxHeight = true,
  double horizontalPadding = Spacing.p0,
}) {
  WoltModalSheet.show(
    modalTypeBuilder: (context) => WoltModalType.alertDialog(),
    context: context,
    barrierDismissible: false,

    pageListBuilder: (bottomSheetContext) {
      return [
        _takeActionSliverWolModalSheetPage(
          context,
          title: title,
          mainContent: mainContent,
          forceMaxHeight: forceMaxHeight,
          horizontalPadding: horizontalPadding,
        ),
      ];
    },
  );
}

SliverWoltModalSheetPage _takeActionSliverWolModalSheetPage(
  BuildContext modalSheetContext, {
  required String title,
  required Widget mainContent,
  Widget? stickyActionBar,
  bool forceMaxHeight = true,
  required double horizontalPadding,
}) {
  final appColors = Theme.of(modalSheetContext).colorScheme;

  return SliverWoltModalSheetPage(
    forceMaxHeight: forceMaxHeight,
    enableDrag: false,

    backgroundColor: appColors.onInverseSurface,
    topBarTitle: AppText.headlineSmall(
      text: title,
      context: modalSheetContext,
      textAlign: TextAlign.center,
      color: Colors.black,
    ),
    isTopBarLayerAlwaysVisible: true,

    trailingNavBarWidget: AppIconButton.filledTonal(
      backgroudColor: appColors.surface,
      iconData: Icons.close,
      context: modalSheetContext,
      onPressed: Navigator.of(modalSheetContext).pop,
    ),

    mainContentSliversBuilder: (bottomSheetContext) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.p8, horizontal: horizontalPadding),
            child: mainContent,
          ),
        ),
      ];
    },
    stickyActionBar: Padding(
      padding: EdgeInsets.symmetric(vertical: Spacing.p22, horizontal: horizontalPadding),
      child: stickyActionBar,
    ),
  );
}
