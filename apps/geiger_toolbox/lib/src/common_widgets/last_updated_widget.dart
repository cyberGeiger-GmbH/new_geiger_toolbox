import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/date_time_formatter.dart';

class LastUpdatedWidget extends ConsumerWidget {
  const LastUpdatedWidget({super.key, required this.lastUpdated});
  final DateTime lastUpdated;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final formattedDate = ref.watch(timeAgoProvider(timestamp: lastUpdated));
    return RichText(
      text: TextSpan(
        style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
        children: [TextSpan(text: "Updated: ".hardcoded), TextSpan(text: formattedDate)],
      ),
    );
  }
}