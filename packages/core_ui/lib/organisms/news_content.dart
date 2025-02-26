import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/organisms/empty_content.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({
    super.key,
    required this.summary,
    this.lastUpdatedLabel,
    required this.lastedUpdated,
    required this.title,
  });
  final String summary;
  final String? lastUpdatedLabel;
  final String lastedUpdated;
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.bodyLarge(
          text: title,
          context: context,
          textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Spacing.gapH4,
        EmptyContent(textAlign: TextAlign.justify, message: summary),
        Spacing.gapH4,
        HorizontalTitleContent(key: key, title: lastUpdatedLabel ?? "last updated", source: lastedUpdated),
      ],
    );
  }
}

class HorizontalTitleContent extends StatelessWidget {
  const HorizontalTitleContent({super.key, required this.title, required this.source});
  final String title;
  final String source;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Theme.of(context).hintColor;

    return RichText(
      text: TextSpan(
        text: "$title: ", // Title in bold
        style: theme.textTheme.bodySmall!.copyWith(color: color, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: source,
            style: theme.textTheme.bodySmall,
            // Message in normal style
          ),
        ],
      ),
    );
  }
}
