import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/limit_todo_list.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_details.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key, this.backgroundColor});
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //show snackbar messsage when user update todo state
    ref.listen(todoControllerProvider, (_, nextState) {
      nextState.todoUpdateStatusSnackBar(context: context);
    });
    //show alert dialog when error is thrown
    ref.listen(todoControllerProvider, (_, nextState) {
      nextState.showSnackBarOnError(context: context);
    });

    final todos = ref.watch(watchTodosProvider);

    return AsyncValueWidget(
      value: todos,
      data:
          (data) =>
              data.isEmpty
                  ? NoTodoWidget(backgroundColor: backgroundColor)
                  : TodoContainer(
                    backgroundColor: backgroundColor,
                    showAllTodos: () {
                      context.goNamed(AppRouter.todoRouter.name);
                    },
                    items:
                        data
                            .expand(
                              (category) => category.offerings.map(
                                (todo) => TodoItem(
                                  item: todo,
                                  onChanged: () {
                                    if (todo.status == Status.done) {
                                      ref.read(todoControllerProvider.notifier).planLater(id: todo.id);
                                    } else {
                                      ref
                                          .read(todoControllerProvider.notifier)
                                          .makeAsDone(id: todo.id, status: Status.done);
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

//show Bottom sheet
void showTodoDetails(BuildContext context, TodoOffering item) {
  showWoltModalBottomSheet(
    context,
    title: item.offering.name,
    forceMaxHeight: false,

    mainContent: Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4, // Use 40% of screen height
          child: TodoDetails(item: item),
        ),
      ],
    ),
    stickyActionBar: TodoActionBar(item: item),
  );
}

class TodoContainer extends StatelessWidget {
  const TodoContainer({
    super.key,
    required this.items,
    required this.displayLimit,
    required this.showAllTodos,
    this.backgroundColor,
  });
  final List<TodoItem> items;
  final int displayLimit;
  final Color? backgroundColor;

  final VoidCallback showAllTodos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerLabel(text: "Todos".hardcoded, showAllItems: showAllTodos),
        Spacing.gapH8,
        GeigerCard(
          backgroundColor: backgroundColor,
          child: LimitTodoList(items: items, displayLimit: displayLimit, showAllTodos: showAllTodos),
        ),
      ],
    );
  }
}

class NoTodoWidget extends StatelessWidget {
  const NoTodoWidget({super.key, this.backgroundColor});
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GeigerCard(
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(Spacing.p32),
        child: SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: textTheme.bodyMedium,
              children: [TextSpan(text: "No Todo Added yet.\n Please Plan Your Todo. ".hardcoded)],
            ),
          ),
        ),
      ),
    );
  }
}
