import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppText.labelLarge(text: label, context: context, color: theme.colorScheme.onSurface);
  }
}
