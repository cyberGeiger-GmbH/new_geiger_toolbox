import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';


import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/limit_todo_list.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_tile.dart';


import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(watchTodosProvider);

    return AsyncValueWidget(
      value: todos,
      data:
          (data) =>
              data.isEmpty
                  ? const SizedBox.shrink()
                  : TodoList(
                    showAllTodos: () {
                      context.goNamed(AppRouter.todoRouter.name);
                    },
                    items:
                        data
                            .expand(
                              (category) => category.offerings.map(
                                (todo) => TodoListTile(
                                  item: todo,
                                  onChanged: () {
                                    if (todo.status == Status.done) {
                                      final value = todo.copyWith(status: Status.planned);
                                      ref.read(todoControllerProvider.notifier).planLater(value);
                                    } else {
                                      final value = todo.copyWith(status: Status.done);
                                      ref.read(todoControllerProvider.notifier).makeAsDone(value);
                                    }
                                  },
                                  showDetails: () => showTodoDetails(context, todo),
                                ),
                              ),
                            )
                            .toList(),
                    displayLimit: 3,
                  ),
    );
  }
}

void showTodoDetails(BuildContext context, TodoOffering item) {
  showWoltModalBottomSheet(
    context,
    title: item.offering.name,
    forceMaxHeight: false,
    page: Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3, // Use 40% of screen height
          child: Padding(
            padding: const EdgeInsets.all(Spacing.p16),
            child: AppText.bodySmall(text: item.offering.summary, context: context),
          ),
        ),
      ],
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.items, required this.displayLimit, required this.showAllTodos});
  final List<TodoListTile> items;
  final int displayLimit;

  final VoidCallback showAllTodos;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Label(text: "Todos".hardcoded, showAllItems: showAllTodos),
          LimitTodoList(items: items, displayLimit: displayLimit, showAllTodos: showAllTodos),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.showAllItems, required this.text});
  final VoidCallback showAllItems;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.p16, top: Spacing.p8),
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

class SeeAllText extends StatelessWidget {
  const SeeAllText({super.key, required this.seeAll});
  final VoidCallback seeAll;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(height: 1),
        AppTextButton.primary(context: context, label: "See All".hardcoded, onTap: seeAll),
      ],
    );
  }
}
