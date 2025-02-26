import 'package:core_ui/molecules/buttons/custom_checkbox.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
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

    return ListTile(
      key: key,
      title: AppText.bodySmall(
        text: offer.offering.name,
        context: context,
        textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: AppText.bodySmall(text: offer.offering.summary, context: context),
      trailing: CustomCheckbox(
        value: state.status == Status.planned,
        onChanged: (value) {
          //to update the ui
          ref.read(toggleOfferControllerProvider(offer).notifier).onChange(offer.copyWith(status: Status.planned));

          //add to a todo list
          ref.read(toggleListOfferControllerProvider.notifier).selectTodoItems(state.copyWith(status: Status.planned));
        },
      ),
    );
    // return TodoTile.plain(
    //   key: key,
    //   summary: offer.offering.summary,
    //   title: offer.offering.name,
    //   done: state.status == Status.planned,

    //   onChange: (value) async {
    //     //to update the ui
    //     ref.read(toggleOfferControllerProvider(offer).notifier).onChange(offer.copyWith(status: Status.planned));

    //     //add to a todo list
    //     ref.read(toggleListOfferControllerProvider.notifier).selectTodoItems(state.copyWith(status: Status.planned));
    //   },
    // ); // only all to activeTodo
  }
}
