import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

typedef DismissibleCallback<T> = Future<bool?> Function(T value);

class DismissibleTodo extends StatelessWidget {
  const DismissibleTodo({super.key, required this.item, required this.child, required this.onDismissed});

  final TodoOffering item;
  final Widget child;
  final DismissibleCallback<DismissDirection> onDismissed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColorScheme = theme.colorScheme;
    return Dismissible(
      key: Key(item.id),
      background: Container(
        color: appColorScheme.primary,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.check_circle_outline, color: appColorScheme.onPrimary),
      ),
      secondaryBackground: Container(
        color: appColorScheme.error,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.remove_circle_outline, color: appColorScheme.onPrimary),
      ),
      confirmDismiss: onDismissed,
      child: child,
    );
  }
}
