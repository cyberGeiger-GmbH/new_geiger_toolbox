import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geiger_toolbox/src/common_widgets/last_updated_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.p8),
        child: Row(
          children: [
            TodoCheckbox(onChanged: onChanged, status: item.status),
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
    final theme = Theme.of(context);
    final appColorScheme = theme.colorScheme;
    return GestureDetector(
      onTap: showDetails,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bodySmall(
            text: item.offering.name,

            context: context,
            textAlign: TextAlign.start,

            textStyle: theme.textTheme.bodyMedium?.copyWith(
              color: item.status == Status.done ? theme.hintColor : appColorScheme.onSurface,
              decoration: item.status == Status.done ? TextDecoration.lineThrough : TextDecoration.none,
              fontWeight: FontWeight.w700,
            ),
          ),
          LastUpdatedWidget(lastUpdated: item.lastUpdated!),
        ],
      ),
    );
  }
}

class TodoCheckbox extends StatelessWidget {
  const TodoCheckbox({super.key, required this.onChanged, required this.status});
  final Status status;

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
            status == Status.done ? Icons.check_circle : Icons.circle_outlined,
            color: status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
            size: 28,
          ),
          onPressed: () => onChanged(),
        );
  }
}
