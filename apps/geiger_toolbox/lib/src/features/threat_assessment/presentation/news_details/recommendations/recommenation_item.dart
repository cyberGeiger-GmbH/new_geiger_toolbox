import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {
  final Recommendation item;
  final VoidCallback onPressed;

  const RecommendationItem({super.key, required this.item, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Spacing.p4, horizontal: Spacing.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyMedium(
            text: item.name,
            context: context,
            textAlign: TextAlign.start,
            textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          IconButton(onPressed: onPressed, icon: Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
