import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/last_updated_widget.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.url, required this.title, required this.lastUpdated, this.onPress});
  final String url;
  final String title;
  final DateTime lastUpdated;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: Spacing.p8, right: Spacing.p0, top: Spacing.p8, bottom: Spacing.p8),
      child: Row(
        children: [
          Avatar(radius: 28, photoUrl: url),
          Spacing.gapH8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodySmall(
                  text: title,
                  context: context,
                  textAlign: TextAlign.start,
                  textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                Spacing.gapH4,
                LastUpdatedWidget(lastUpdated: lastUpdated),
              ],
            ),
          ),
          if (onPress != null) IconButton(onPressed: onPress, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
