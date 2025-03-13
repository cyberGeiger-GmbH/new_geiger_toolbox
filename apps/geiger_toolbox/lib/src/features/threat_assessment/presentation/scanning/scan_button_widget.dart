import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

class ScanButtonWidget extends ConsumerWidget {
  const ScanButtonWidget({super.key, required this.onScanPressed});

  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanButtonControllerProvider);
    final newsFeedState = ref.watch(watchRecentNewsFeedsProvider);

    // return AppButton.scan(
    //   label: state.isLoading || newsFeedState.isLoading ? "scanning..." : 'Scan',
    //   context: context,
    //   onPressed: state.isLoading ? null : onScanPressed,
    // );

    return CircularScanningButton(
      onPressed: onScanPressed,
      size: 120.0,
      initStatelabel: 'Scan'.hardcoded,
      loadingStateLabel: 'Scanning'.hardcoded,
      isLoading: state.isLoading,
    );
  }
}

class CircularScanningButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  final String loadingStateLabel;
  final String initStatelabel;
  final bool isLoading;
  const CircularScanningButton({
    super.key,
    required this.onPressed,
    this.loadingStateLabel = 'Scanning',
    this.size = 0.0,

    this.initStatelabel = 'Scan',
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Material(
        elevation: 3.0,
        shape: const CircleBorder(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size + 20,
              height: size + 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color.primary.withAlpha(128), width: 5.0),
              ),
            ),

            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color.primary),
              child: Center(
                child:
                    isLoading
                        ? ScanningText(size: size, state: loadingStateLabel)
                        : AppText.labelLarge(text: initStatelabel, color: color.onPrimary, context: context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanningText extends StatelessWidget {
  const ScanningText({super.key, required this.size, required this.state});
  final double size;
  final String state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        //child:
        AppText.labelLarge(text: state, context: context, color: color.onPrimary),
        LoadingAnimationWidget.threeArchedCircle(color: color.onPrimary, size: size * 0.9),
        // ),
      ],
    );
  }
}
