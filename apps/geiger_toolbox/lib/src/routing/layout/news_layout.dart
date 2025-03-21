import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';

class NewsLayout extends ConsumerWidget {
  const NewsLayout({super.key, required this.isNewsFeedEmpty});

  final bool isNewsFeedEmpty;
 // final double heightFraction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SizedBox(
      height: isNewsFeedEmpty ? 100 : null,
      child: Column(
        // mainAxisSize: MainAxisSize.max,

        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ScoreStatusWidget(),
          Spacing.gapH12,
          NewsFeedsWidget(backgroundColor: theme.colorScheme.surface),
        ],
      ),
    );
  }
}
