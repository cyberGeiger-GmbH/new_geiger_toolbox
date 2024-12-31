import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/clear_data_button.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class TesterButtons extends StatelessWidget {
  const TesterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [FeedbackButton(), Spacing.gapH4, ClearDataButton()],
    );
  }
}

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton.filled(
      iconData: Icons.feedback,
      context: context,
      onPressed: () {
        BetterFeedback.of(context).showAndUploadToSentry();
      },
    );
  }
}
