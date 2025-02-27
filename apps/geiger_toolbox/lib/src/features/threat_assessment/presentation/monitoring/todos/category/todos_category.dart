import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering_category.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';

class TodoCategory extends ConsumerWidget {
  final TodoOfferingCategory category;
  const TodoCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TodoCategoryTitle(title: category.category),
        Spacing.gapH4,
        TodoCategoryList(offerings: category.offerings),
        Spacing.gapH4,
      ],
    );
  }
}

class TodoCategoryTitle extends StatelessWidget {
  final String title;
  const TodoCategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppText.bodyMedium(text: title, context: context);
  }
}

class TodoCategoryList extends ConsumerWidget {
  final List<TodoOffering> offerings;
  const TodoCategoryList({super.key, required this.offerings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.colorScheme.onInverseSurface,
      margin: EdgeInsets.zero,
      child: Column(
        children:
            offerings
                .map(
                  (data) => TodoItem(
                    noTrailWidget: true,
                    item: data,
                    onChanged: () {
                      if (data.status == Status.done) {
                        final value = data.copyWith(status: Status.planned);
                        ref.read(todoControllerProvider.notifier).planLater(value);
                      } else {
                        final value = data.copyWith(status: Status.done);
                        ref.read(todoControllerProvider.notifier).makeAsDone(value);
                      }
                    },
                    showDetails: () => showTodoDetails(context, data),
                  ),
                )
                .toList(),
      ),
    );
  }
}
