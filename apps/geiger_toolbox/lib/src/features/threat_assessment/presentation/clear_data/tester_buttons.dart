import 'package:core_ui/molecules/buttons/app_button.dart';
import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/clear_data_button.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class TesterButtons extends StatelessWidget {
  const TesterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [FeedbackButton(), ClearDataButton()],
    );
  }
}

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton.tertiary(
      label: ' Give feedback'.hardcoded,
      context: context,
      onPressed: () {
        BetterFeedback.of(context).showAndUploadToSentry();
      },
    );
  }
}
