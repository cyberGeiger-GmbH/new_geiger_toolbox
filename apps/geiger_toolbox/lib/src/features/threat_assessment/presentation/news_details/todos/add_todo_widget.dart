import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/todo_task_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/task_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/todos/add_todo_task_cache_controller.dart';

class AddTodoWidget extends ConsumerWidget {
  const AddTodoWidget({super.key, required this.todos});
  final List<TodoTask> todos;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(filterProtectListProvider(todoTask: todos));
    
    return AsyncValueWidget(
      value: filtered,
      data: (data) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TodoTileList(
          todoTile: data
              .toItemsList()
              .map(
                (todo) => AddTodoListWidget(
                  key: key,
                  todo: TodoTask(
                      offering: todo.offering, isCompleted: todo.isCompleted),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class AddTodoListWidget extends ConsumerWidget {
  const AddTodoListWidget({
    super.key,
    required this.todo,
  });

  final TodoTask todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen to  message when adding recommendation to task to be done
    ref.listen<TodoTask>(addTodoTaskControllerProvider(todo),
        (_, nxtState) => nxtState.showSnackBarTodoMessage(context: context));

    final state = ref.watch(addTodoTaskControllerProvider(todo));

    return TodoTile.plain(
        key: key,
        summary: todo.offering.summary,
        title: todo.offering.name,
        done: state.isCompleted ?? false,
        onChange: (value) {
          //set
          ref
              .read(addTodoTaskControllerProvider(todo).notifier)
              .onChange(todo.copyWith(isCompleted: value));
          //store
          ref
              .read(addTodoTaskCacheControllerProvider.notifier)
              .addTodoToCache(state);
        });
  }
}
