import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/app_text.dart';
import 'package:core_ui/molecules/centered_text_button.dart';
import 'package:flutter/material.dart';

import '../tokens/spacing.dart';

///placeholder widget for showing a message
///[onTap] to return to home screen
///
class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key, required this.message, this.onTap});
  final String message;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.p16),
      child: Center(
        child: Column(
          children: [
            AppText.headlineMedium(
              context: context,
              text: message,
              textAlign: TextAlign.center,
            ),
            Spacing.gapH32,
            CenteredTextButton.primary(
                label: "Go Home".hardCoded, onTap: onTap, context: context)
          ],
        ),
      ),
    );
  }
}
