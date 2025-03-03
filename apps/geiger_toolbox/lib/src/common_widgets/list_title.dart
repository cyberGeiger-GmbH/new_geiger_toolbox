import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, required this.title, required this.crossTitle});
  final String title;
  final bool crossTitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColorScheme = theme.colorScheme;
    return AppText.bodyLarge(
      text: title,

      context: context,
      textAlign: TextAlign.start,

      textStyle: theme.textTheme.bodyMedium?.copyWith(
        color: crossTitle ? theme.hintColor : appColorScheme.onSurface,
        decoration: crossTitle ? TextDecoration.lineThrough : TextDecoration.none,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
