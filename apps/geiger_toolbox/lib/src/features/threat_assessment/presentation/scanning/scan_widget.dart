import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_controller.dart';

class ScanWidget extends ConsumerWidget {
  const ScanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);

    return AppButton.scan(
      label: state.isLoading ? "scanning.." : 'Scan',
      context: context,
      onPressed: state.isLoading
          ? null
          : () {
              ref.read(scanControllerProvider.notifier).scan();
            },
    );
  }
}
