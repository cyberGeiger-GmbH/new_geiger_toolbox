import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

class TodoListTile extends StatelessWidget {
  final TodoOffering item;
  final VoidCallback onChanged;

  final VoidCallback showDetails;
  final bool noTrailWidget;

  const TodoListTile({
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
      child: ListTile(
        onTap: () => showDetails(),
        leading:
            Platform.isIOS
                ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    item.status == Status.done ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.circle,
                    color: item.status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
                    size: 28,
                  ),
                  onPressed: () => onChanged(),
                )
                : IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    item.status == Status.done ? Icons.check_circle : Icons.circle,
                    color: item.status == Status.done ? colorScheme.primary : colorScheme.surfaceDim,
                    size: 28,
                  ),
                  onPressed: () => onChanged(),
                ),
        title: AppText.bodyMedium(
          text: item.offering.name,
          color: item.status == Status.done ? Colors.grey : Colors.black,
          context: context,
          textAlign: TextAlign.start,
          textRemoved: item.status == Status.done,
        ),
        trailing: noTrailWidget ? null : Icon(Icons.chevron_right),
      ),
    );
  }
}
