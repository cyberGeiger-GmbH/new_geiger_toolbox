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
  const TodoListWidget({super.key});

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
                  ? const SizedBox.shrink()
                  : TodoContainer(
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

    mainContent: Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.3, // Use 40% of screen height
          child: TodoDetails(item: item),
        ),
      ],
    ),
  );
}

class TodoContainer extends StatelessWidget {
  const TodoContainer({super.key, required this.items, required this.displayLimit, required this.showAllTodos});
  final List<TodoItem> items;
  final int displayLimit;

  final VoidCallback showAllTodos;

  @override
  Widget build(BuildContext context) {
    return GeigerCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContainerLabel(text: "Todos".hardcoded, showAllItems: showAllTodos),
          LimitTodoList(items: items, displayLimit: displayLimit, showAllTodos: showAllTodos),
        ],
      ),
    );
  }
}
