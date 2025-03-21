import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/buttons/custom_checkbox.dart';
import 'package:core_ui/organisms/item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';

class OfferingItem extends ConsumerWidget {
  const OfferingItem({super.key, required this.offer});

  final TodoOffering offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(toggleOfferControllerProvider(offer));
    final theme = Theme.of(context);
    return ItemListTile(
      key: key,
      status: state.status == Status.done,
      title: offer.offering.name,
      subtitle: AppText.bodySmall(
        text: offer.offering.summary,
        context: context,
        lintThrough: offer.status == Status.done,
        color: offer.status == Status.done ? theme.hintColor : null,
      ),

      trailing: CustomCheckbox(
        value: state.status == Status.planned || state.status == Status.done,
        onChanged: (value) {
          debugPrint("onChanged: $value");

          if (value != null && value) {
            //to update the ui
            ref.read(toggleOfferControllerProvider(offer).notifier).onChange(offer.copyWith(status: Status.planned));

            //add to a todo list
            ref
                .read(toggleListOfferControllerProvider.notifier)
                .selectTodoItems(state.copyWith(status: Status.planned));
          } else {
            //to update the ui
            ref
                .read(toggleOfferControllerProvider(offer).notifier)
                .onChange(offer.copyWith(status: Status.recommended));

            //add to a todo list
            ref
                .read(toggleListOfferControllerProvider.notifier)
                .selectTodoItems(state.copyWith(status: Status.recommended));
          }
        },
      ),
    );
  }
}
