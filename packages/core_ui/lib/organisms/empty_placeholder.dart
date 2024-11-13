import 'package:core_ui/molecules/buttons/app_button.dart';
import 'package:flutter/material.dart';

import '../molecules/texts/app_text.dart';
import '../tokens/spacing.dart';

///placeholder widget for showing a message
///[onTap] to return to home screen
///
class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder(
      {super.key, required this.message, required this.label, this.onTap});
  final String message;
  final VoidCallback? onTap;
  final String label;
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
            AppButton.primary(label: label, onPressed: onTap, context: context)
          ],
        ),
      ),
    );
  }
}
