import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geiger_toolbox/src/common_widgets/last_updated_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/list_title.dart';
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
      padding: EdgeInsets.symmetric(vertical: Spacing.p8),
      child: Row(
        children: [
          TodoCheckbox(onChanged: onChanged, status: item.status),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTitle(title: item.offering.name, crossTitle: item.status == Status.done),
                Spacing.gapH4,
                LastUpdatedWidget(lastUpdated: item.lastUpdated!),
              ],
            ),
          ),
          IconButton(onPressed: showDetails, icon: const Icon(Icons.chevron_right)),
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
          iconSize: 28,
          icon: Icon(
            status == Status.done ? Icons.check_circle : Icons.circle_outlined,
            color: status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
          ),
          onPressed: () => onChanged(),
        );
  }
}

class ContainerLabel extends StatelessWidget {
  const ContainerLabel({super.key, required this.showAllItems, required this.text});
  final VoidCallback showAllItems;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.p4, horizontal: Spacing.p22),
      child: GestureDetector(
        onTap: showAllItems,
        child: Row(
          children: [
            AppText.bodySmall(text: text, context: context, color: theme.hintColor),
            Icon(Icons.chevron_right, color: theme.hintColor),
          ],
        ),
      ),
    );
  }
}
