import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/organisms/item_list_tile.dart';
import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {
  final Recommendation item;
  final VoidCallback onPressed;

  const RecommendationItem({super.key, required this.item, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ItemListTile(title: item.name, trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.chevron_right)));
  }
}
