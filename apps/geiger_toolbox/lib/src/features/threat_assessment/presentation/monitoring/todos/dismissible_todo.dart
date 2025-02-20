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
    return Dismissible(
      key: Key(item.id),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: onDismissed,
      child: child,
    );
  }
}
