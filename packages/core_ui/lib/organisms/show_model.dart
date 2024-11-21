import 'package:core_ui/foundation/themes/extension.dart';

import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

void showModal(BuildContext context,
    {required String title, required Widget takeAction}) {
  WoltModalSheet.show(
    context: context,
    onModalDismissedWithBarrierTap: () {
      debugPrint('Closed modal sheet with barrier tap');
      Navigator.of(context).pop();
    },
    pageListBuilder: (bottomSheetContext) {
      return [
        takeActionSliverWolModalSheetPage(context,
            title: title, widget: takeAction)
      ];
    },
  );
}

SliverWoltModalSheetPage takeActionSliverWolModalSheetPage(BuildContext context,
    {required String title, required Widget widget}) {
  final appColors = Theme.of(context).appColors.appColor;
  return SliverWoltModalSheetPage(
      backgroundColor: appColors.scaffoldBackgroundColor,
      // trailingNavBarWidget: AppIconButton.filledTonal(
      //   iconData: Icons.close,
      //   context: context,
      //   onPressed: () {
      //     debugPrint('Closed modal sheet with bottomSheetContext');
      //     Navigator.of(bottomSheetContext).pop;
      //   },
      // ),

      pageTitle: AppText.headlineSmall(
        text: title,
        context: context,
        color: appColors.defaultColor,
      ),
      mainContentSliversBuilder: (bottomSheetContext) {
        return [
          SliverToBoxAdapter(child: widget),
          // const SliverPadding(
          //   padding: EdgeInsets.only(bottom: 20),
          //   sliver: SliverToBoxAdapter(
          //     child: Padding(
          //       padding: EdgeInsets.all(10),
          //       child: Text(
          //         'Last Item',
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
        ];
      });
}
