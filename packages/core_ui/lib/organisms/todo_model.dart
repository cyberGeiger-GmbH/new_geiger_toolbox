import 'package:core_ui/helpers/design_system_helper.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

void showModal(BuildContext context) {
  WoltModalSheet.show(
    context: context,
    onModalDismissedWithBarrierTap: () {
      debugPrint('Closed modal sheet with barrier tap');
      Navigator.of(context).pop();
    },
    pageListBuilder: (bottomSheetContext) {
      return [
        SliverWoltModalSheetPage(
            backgroundColor: Colors.white,
            // trailingNavBarWidget: AppIconButton.filledTonal(
            //   iconData: Icons.close,
            //   context: context,
            //   onPressed: () {
            //     debugPrint('Closed modal sheet with bottomSheetContext');
            //     Navigator.of(bottomSheetContext).pop;
            //   },
            // ),

            pageTitle: AppText.headlineMedium(
              text: "Title good here",
              context: context,
              color: Colors.black,
            ),
            mainContentSliversBuilder: (bottomSheetContext) {
              return [
                SliverToBoxAdapter(
                  child: DesignSystemHelper.getTodoCheckList(),
                ),
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
            })
      ];
    },
  );
}
