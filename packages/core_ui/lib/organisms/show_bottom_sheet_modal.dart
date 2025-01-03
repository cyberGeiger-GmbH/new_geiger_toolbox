import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

void showBottomSheetModal(BuildContext context,
    {required String title,
    required Widget takeAction,
    Widget? stickyActionBar}) {
  WoltModalSheet.show(
    modalTypeBuilder: (context) => WoltModalType.bottomSheet(),
    context: context,
    barrierDismissible: false,
    pageListBuilder: (bottomSheetContext) {
      return [
        takeActionSliverWolModalSheetPage(context,
            title: title, widget: takeAction, stickyActionBar: stickyActionBar)
      ];
    },
  );
}

SliverWoltModalSheetPage takeActionSliverWolModalSheetPage(
    BuildContext modalSheetContext,
    {required String title,
    required Widget widget,
    Widget? stickyActionBar}) {
  final appColors = Theme.of(modalSheetContext).colorScheme;

  return SliverWoltModalSheetPage(
    forceMaxHeight: true,
    enableDrag: false,

    //  backgroundColor: appColors.surface,
    topBarTitle: AppText.bodyLarge(
      text: title,
      context: modalSheetContext,
      textAlign: TextAlign.center,
      color: Colors.black,
    ),
    isTopBarLayerAlwaysVisible: true,

    trailingNavBarWidget: AppIconButton.filledTonal(
      backgroudColor: appColors.errorContainer,
      iconData: Icons.close,
      context: modalSheetContext,
      onPressed: Navigator.of(modalSheetContext).pop,
    ),
    mainContentSliversBuilder: (bottomSheetContext) {
      return [
        SliverToBoxAdapter(child: widget),
      ];
    },
    stickyActionBar: Padding(
      padding: const EdgeInsets.only(bottom: Spacing.p22),
      child: stickyActionBar,
    ),
  );
}
