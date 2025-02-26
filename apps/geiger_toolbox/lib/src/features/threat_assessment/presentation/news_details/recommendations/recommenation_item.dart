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
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.all(Spacing.p8),
      title: AppText.bodyLarge(
        text: item.name,
        context: context,
        textAlign: TextAlign.start,
        textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.chevron_right)),
    );
  }
}
