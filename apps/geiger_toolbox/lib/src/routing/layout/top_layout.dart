import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';

class TopContent extends ConsumerWidget {
  const TopContent({super.key, required this.isNewsFeedEmpty, required this.heightFraction});

  final bool isNewsFeedEmpty;
  final double heightFraction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: heightFraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //* if news feed is not empty show geiger Score widget
          !isNewsFeedEmpty ? const GeigerScoreWidget() : const SizedBox.shrink(),
          Spacing.gapH8,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: Spacing.p12),
              child: ScanButtonWidget(
                onScanPressed: () {
                  ref.read(scanButtonControllerProvider.notifier).scan();
                },
              ),
            ),
          ),
          // ScanButtonWidget(
          //   onScanPressed: () {
          //     ref.read(scanButtonControllerProvider.notifier).scan();
          //   },
          // ),
        ],
      ),
    );
  }
}
