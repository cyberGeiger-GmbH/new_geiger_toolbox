import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/item_list_tile.dart';
import 'package:geiger_toolbox/src/common_widgets/last_updated_widget.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.url, required this.title, required this.lastUpdated, this.onPress});
  final String url;
  final String title;
  final DateTime lastUpdated;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return ItemListTile(
      leading: Avatar(radius: 25, photoUrl: url),
      title: title,
      subtitle: LastUpdatedWidget(lastUpdated: lastUpdated),
      trailing: onPress != null ? IconButton(onPressed: onPress, icon: Icon(Icons.chevron_right)) : null,
    );
  }
}
