import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_widget.dart';

class OfferingListWidget extends ConsumerWidget {
  const OfferingListWidget({super.key, required this.id});
  final RecommendationID id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen to error message when adding offering to todo to be done
    ref.listen(addOfferingTodoControllerProvider,
        (_, nxtState) => nxtState.showAlertDialogOnError(context: context));

    final offering = ref.watch(fetchOfferStatusProvider(id: id));

    return AsyncValueWidget(
      value: offering,
      data: (data) => data.isEmpty
          ? Center(
              child: EmptyContent(
                message: "No Offerings found",
                title: "Info",
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TodoTileList(
                    todoTile: data
                        .map(
                          (offer) =>
                              AddOfferingToDoWidget(key: key, offer: offer),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
