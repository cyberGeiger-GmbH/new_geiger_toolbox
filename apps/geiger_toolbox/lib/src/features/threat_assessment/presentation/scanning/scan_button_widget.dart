import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

class ScanButtonWidget extends ConsumerWidget {
  const ScanButtonWidget({super.key, required this.onScanPressed});

  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanButtonControllerProvider);
    final newsFeedState = ref.watch(watchRecentNewsFeedsProvider);

    return AppButton.scan(
        label:
            state.isLoading || newsFeedState.isLoading ? "scanning..." : 'Scan',
        context: context,
        onPressed: state.isLoading ? null : onScanPressed);
  }
}
