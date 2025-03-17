import 'package:core_ui/organisms/item_list_tile.dart';
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

    return ItemListTile(
      leading: Icon(Icons.warning_amber_rounded, color: appColor.error),
      title: message,
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
