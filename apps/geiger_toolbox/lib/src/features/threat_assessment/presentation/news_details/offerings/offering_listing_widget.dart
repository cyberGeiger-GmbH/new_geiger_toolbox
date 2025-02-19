import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';

class RecommendedTodoListWidget extends ConsumerWidget {
  const RecommendedTodoListWidget({super.key, required this.id, required this.rationale});
  final RecommendationID id;
  final String rationale;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen to error message when adding offering to todo to be done
    ref.listen(addOfferingTodoControllerProvider, (_, nxtState) => nxtState.showAlertDialogOnError(context: context));

    final offering = ref.watch(fetchOfferStatusProvider(id: id));

    return AsyncValueWidget(
      value: offering,
      data:
          (data) =>
              data.isEmpty
                  ? Center(child: EmptyContent(message: "No Offerings found", title: "Info"))
                  : TodoTileList(
                    todoTile: data.map((offer) => RecommendedTodoWidget(key: key, offer: offer)).toList(),
                    rationale: rationale,
                  ),
    );
  }
}

class RecommendedTodoWidget extends ConsumerWidget {
  const RecommendedTodoWidget({super.key, required this.offer});

  final TodoOffering offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(toggleOfferControllerProvider(offer));

    return TodoTile.plain(
      key: key,
      summary: offer.offering.summary,
      title: offer.offering.name,
      done: state.status == Status.planned,

      onChange: (value) async {
        //to update the ui
        ref.read(toggleOfferControllerProvider(offer).notifier).onChange(offer.copyWith(status: Status.planned));

        //add to a todo list
        ref.read(toggleListOfferControllerProvider.notifier).selectTodoItems(state.copyWith(status: Status.planned));
      },
    ); // only all to activeTodo
  }
}
