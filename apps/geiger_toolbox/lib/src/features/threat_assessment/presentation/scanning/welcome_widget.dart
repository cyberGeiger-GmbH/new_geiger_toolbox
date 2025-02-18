import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';

class WelcomeScanIntroWidget extends ConsumerWidget {
  const WelcomeScanIntroWidget({super.key, required this.onScanPressed});
  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [const GeigerScoreWidget(), ScanButtonWidget(onScanPressed: onScanPressed)],
      ),
    );
  }
}
