import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppText.labelLarge(text: title, context: context, color: theme.colorScheme.onSurface);
  }
}
