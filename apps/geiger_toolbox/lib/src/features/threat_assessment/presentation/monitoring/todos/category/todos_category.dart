import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/common_widgets/section_heading.dart';
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
        SectionHeading(title: category.category),
        Spacing.gapH22,
        TodoCategoryList(offerings: category.offerings),
        Spacing.gapH32,
      ],
    );
  }
}

class TodoCategoryList extends ConsumerWidget {
  final List<TodoOffering> offerings;
  const TodoCategoryList({super.key, required this.offerings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GeigerCard(
      items:
          offerings
              .map(
                (data) => TodoItem(
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
