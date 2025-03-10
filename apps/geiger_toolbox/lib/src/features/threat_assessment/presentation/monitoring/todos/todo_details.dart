import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:go_router/go_router.dart';

class TodoDetails extends ConsumerWidget {
  const TodoDetails({super.key, required this.item});
  final TodoOffering item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AppText.bodySmall(text: item.offering.summary, context: context),
        Spacing.gapH16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppButton.primarySmall(
              label: "Mark as done",
              context: context,
              onPressed: () {
                ref.read(todoControllerProvider.notifier).makeAsDone(item, onSuccess: context.pop);
              },
            ),
            AppButton.deleteSmall(
              label: "Remove",
              context: context,
              onPressed: () {
                ref.read(todoControllerProvider.notifier).removeTodo(item, onSuccess: context.pop);
              },
            ),
          ],
        ),
      ],
    );
  }
}
