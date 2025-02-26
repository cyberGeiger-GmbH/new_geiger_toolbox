import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering_category.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/category/todos_category_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';

class TodoCategory extends ConsumerWidget {
  final TodoOfferingCategory category;
  const TodoCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todosCategoryControllerProvider(category));
    return ExpansionTile(
      title: AppText.titleMedium(text: category.category, context: context),
      initiallyExpanded: state.isExpanded,
      onExpansionChanged: (bool expanded) {
        ref.read(todosCategoryControllerProvider(category).notifier).toggleExpanded(expanded);
      },

      children:
          category.offerings
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
    );
  }
}
