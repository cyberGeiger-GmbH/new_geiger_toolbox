import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/organisms/empty_content.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent(
      {super.key,
      required this.summary,
      this.lastUpdatedLabel,
      required this.lastedUpdated,
      required this.title});
  final String summary;
  final String? lastUpdatedLabel;
  final String lastedUpdated;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge(
          text: title,
          context: context,
        ),
        Spacing.gapH4,
        EmptyContent(textAlign: TextAlign.justify, message: summary),
        Spacing.gapH4,
        _HorizontalTitleContent(
            key: key,
            title: lastUpdatedLabel ?? "last updated",
            source: lastedUpdated),
      ],
    );
  }
}

class _HorizontalTitleContent extends StatelessWidget {
  const _HorizontalTitleContent(
      {super.key, required this.title, required this.source});
  final String title;
  final String source;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Theme.of(context).hintColor;

    return RichText(
      text: TextSpan(
        text: "$title: ", // Title in bold
        style: theme.textTheme.labelLarge!.copyWith(color: color),
        children: [
          TextSpan(text: source, style: theme.textTheme.bodySmall
              // Message in normal style
              ),
        ],
      ),
    );
  }
}
