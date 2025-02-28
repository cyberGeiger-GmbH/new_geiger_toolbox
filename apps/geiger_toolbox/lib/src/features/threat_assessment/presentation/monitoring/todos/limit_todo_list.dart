import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/see_all_text_button.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/dismissible_todo.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';


import 'package:geiger_toolbox/src/utils/constants.dart';

class LimitTodoList extends ConsumerWidget {
  const LimitTodoList({super.key, required this.items, required this.displayLimit, required this.showAllTodos});
  final List<TodoItem> items;
  final int displayLimit;
  final VoidCallback showAllTodos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limit = limitListLength(inputList: items, limit: displayLimit).length;
    return Column(
      children: [
        Column(
          children: [
            for (var i = 0; i < limit; i++) ...[
              DismissibleTodo(
                item: items[i].item,
                onDismissed: (direction) async {
                  final item = items[i].item;
                  if (direction == DismissDirection.startToEnd) {
                    ref.read(todoControllerProvider.notifier).makeAsDone(item);
                    return false;
                  } else {
                    ref.read(todoControllerProvider.notifier).removeTodo(item);
                    return true;
                  }
                },
                child: items[i],
              ),
              //commented out divider for now
              // if (i < (items.length > displayLimit ? displayLimit - 1 : items.length - 1)) Divider(height: 1),
            ],
          ],
        ),
        if (items.length > displayLimit) SeeAllTextButton(seeAll: showAllTodos),
      ],
    );
  }
}
