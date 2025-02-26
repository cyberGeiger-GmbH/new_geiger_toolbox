import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/date_time_formatter.dart';

class TodoItem extends StatelessWidget {
  final TodoOffering item;
  final VoidCallback onChanged;

  final VoidCallback showDetails;
  final bool noTrailWidget;

  const TodoItem({
    super.key,
    required this.item,
    required this.onChanged,
    required this.showDetails,
    this.noTrailWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.p8),
        child: Row(
          children: [
            TodoCheckbox(
              onChanged: onChanged,
              status: item.status,
              color: item.status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
            ),
            Spacing.gapW4,
            Expanded(child: TodoContent(item: item, showDetails: showDetails)),
            IconButton(onPressed: showDetails, icon: const Icon(Icons.chevron_right)),
          ],
        ),
      ),
    );
  }
}

class TodoContent extends StatelessWidget {
  const TodoContent({super.key, required this.item, required this.showDetails});
  final TodoOffering item;
  final VoidCallback showDetails;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bodyMedium(
            text: item.offering.name,
            color: item.status == Status.done ? Colors.grey : Colors.black,
            context: context,
            textAlign: TextAlign.start,
            textRemoved: item.status == Status.done,
          ),
          TodoLastUpdated(lastUpdated: item.lastUpdated!),
        ],
      ),
    );
  }
}

class TodoLastUpdated extends ConsumerWidget {
  const TodoLastUpdated({super.key, required this.lastUpdated});
  final DateTime lastUpdated;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final formattedDate = ref.watch(dateTimeFormatterProvider(inputDate: lastUpdated));
    return RichText(
      text: TextSpan(
        style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
        children: [TextSpan(text: "Updated: ".hardcoded), TextSpan(text: formattedDate)],
      ),
    );
  }
}

class TodoCheckbox extends StatelessWidget {
  const TodoCheckbox({super.key, required this.onChanged, required this.status, this.color});
  final Status status;
  final Color? color;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Platform.isIOS
        ? CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            status == Status.done ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.circle,
            color: status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
            size: 28,
          ),
          onPressed: () => onChanged(),
        )
        : IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            status == Status.done ? Icons.check_circle : Icons.circle,
            color: status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
            size: 28,
          ),
          onPressed: () => onChanged(),
        );
  }
}
