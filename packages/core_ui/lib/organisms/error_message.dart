import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

import '../molecules/texts/app_text.dart';

/// Widget for showing error messages
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message, this.onRetry, this.retryLabel});
  final String message;
  final VoidCallback? onRetry;
  final String? retryLabel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColor = theme.colorScheme;

    return ListTile(
      leading: Icon(Icons.warning_amber_rounded, color: appColor.error),
      title: AppText.bodySmall(
        text: message,
        context: context,
        textAlign: TextAlign.start,
        textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: appColor.error),
        
      ),
      trailing:
          onRetry != null
              ? InkWell(
                onTap: onRetry,
                child: AppText.bodyMedium(
                  text: retryLabel ?? "Retry",
                  context: context,
                  textStyle: theme.textTheme.labelLarge?.copyWith(
                    color: appColor.primary,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
              : null,
    );
  }
}
