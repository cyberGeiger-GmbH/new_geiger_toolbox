import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class WelcomeNoteWidget extends StatelessWidget {
  const WelcomeNoteWidget({super.key, required this.isScanning, this.backgroundColor});
  final bool isScanning;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GeigerCard(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(Spacing.p32),
        child: SizedBox(
          width: double.infinity,

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
                        TextSpan(text: "No actions required yet!\n".hardcoded),
                        TextSpan(text: "Please wait for the scan to complete".hardcoded),
                      ],
            ),
          ),
        ),
      ),
    );
  }
}
