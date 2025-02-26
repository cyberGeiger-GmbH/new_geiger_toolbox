import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class WelcomeScanIntroWidget extends ConsumerWidget {
  const WelcomeScanIntroWidget({super.key, required this.onScanPressed});
  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveCenterWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const GeigerScoreWidget(),
          ScanButtonWidget(onScanPressed: onScanPressed),
          Spacing.gapH12,
          WelcomeNoteWidget(),
        ],
      ),
    );
  }
}

class WelcomeNoteWidget extends StatelessWidget {
  const WelcomeNoteWidget({super.key});

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
            children: [
              TextSpan(text: "Welcome to GEIGER!\n".hardcoded),

              TextSpan(text: "Your To Do List for Cybersecurity".hardcoded),
              TextSpan(text: "\n\nPress the GEIGER Scan Button to get your protection score".hardcoded),
            ],
          ),
        ),
      ),
    );
  }
}
