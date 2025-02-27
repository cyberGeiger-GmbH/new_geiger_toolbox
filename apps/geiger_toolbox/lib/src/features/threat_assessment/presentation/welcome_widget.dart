import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class WelcomeScanIntroWidget extends ConsumerWidget {
  const WelcomeScanIntroWidget({super.key, required this.onScanPressed});
  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScanning = ref.watch(scanButtonControllerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const GeigerScoreWidget(),
        ScanButtonWidget(onScanPressed: onScanPressed),
        Spacing.gapH12,
        WelcomeNoteWidget(isScanning: isScanning.isLoading),
      ],
    );
  }
}

class WelcomeNoteWidget extends StatelessWidget {
  const WelcomeNoteWidget({super.key, required this.isScanning});
  final bool isScanning;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Card(
      margin: EdgeInsets.zero,

      // color: theme.colorScheme.onInverseSurface,
      child: Padding(
        padding: EdgeInsets.all(Spacing.p16),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textTheme.bodyMedium,
            children:
                !isScanning
                    ? [
                      TextSpan(text: "Welcome to GEIGER!\n".hardcoded),
                      TextSpan(text: "Your To Do List for Cybersecurity".hardcoded),
                      TextSpan(text: "\n\nPress the GEIGER Scan Button to get your protection score".hardcoded),
                    ]
                    : [
                      TextSpan(text: "No actions required yet!\n."),
                      TextSpan(text: "Please wait for the scan to complete".hardcoded),
                    ],
          ),
        ),
      ),
    );
  }
}
