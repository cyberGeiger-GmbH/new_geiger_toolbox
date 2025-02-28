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
    return ListTile(
      leading: Avatar(radius: 25, photoUrl: url),
      title: AppText.bodySmall(
        text: title,
        context: context,
        textAlign: TextAlign.start,
        textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: LastUpdatedWidget(lastUpdated: lastUpdated),
      trailing: onPress != null ? Icon(Icons.chevron_right) : null,
      onTap: onPress,
      contentPadding: EdgeInsets.zero, // Adjust padding
    );
  }
}