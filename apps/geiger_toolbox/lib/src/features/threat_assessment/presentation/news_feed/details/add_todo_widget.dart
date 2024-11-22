import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/add_todo_controller.dart';

class AddTodoWidget extends StatelessWidget {
  const AddTodoWidget({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TodoTileList(
        todoTile: todos
            .map(
              (todo) => AddTodoListWidget(
                key: key,
                todo: todo,
              ),
            )
            .toList(),
      ),
    );
  }
}

class AddTodoListWidget extends ConsumerWidget {
  const AddTodoListWidget({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTodoControllerProvider(todo));

    return TodoTile.plain(
        key: key,
        summary: todo.offering.summary,
        title: todo.offering.name,
        done: state.done,
        onChange: (value) {
          ref
              .read(addTodoControllerProvider(todo).notifier)
              .onChange(todo.copyWith(done: value));
        });
  }
}
