
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class ScanButtonWidget extends ConsumerWidget {
  const ScanButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanButtonControllerProvider);
    final newsFeedState = ref.watch(watchNewsFeedsProvider);

    return AppButton.scan(
      label:
          state.isLoading || newsFeedState.isLoading ? "scanning..." : 'Scan',
      context: context,
      onPressed: state.isLoading
          ? null
          : () {
              ref.read(scanButtonControllerProvider.notifier).scan();
            },
    );
  }
}

class CleanData extends ConsumerWidget {
  const CleanData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanButtonControllerProvider);

    return AppButton.delete(
      context: context,
      label: state.isLoading ? 'deleting' : 'clean data'.hardcoded,
      onPressed: state.isLoading
          ? null
          : () {
              ref.read(scanButtonControllerProvider.notifier).deleteData();
            },
    );
  }
}
