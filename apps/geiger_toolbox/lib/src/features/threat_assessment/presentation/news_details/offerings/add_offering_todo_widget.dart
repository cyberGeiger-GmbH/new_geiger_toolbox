import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/offering_status.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';

class AddOfferingToDoWidget extends ConsumerWidget {
  const AddOfferingToDoWidget({
    super.key,
    required this.offer,
  });

  final OfferingStatus offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(toggleOfferControllerProvider(offer));

    return TodoTile.plain(
        key: key,
        summary: offer.offering.summary,
        title: offer.offering.name,
        done: state.added!,
        onChange: (value) async {
          //to update the ui
          ref
              .read(toggleOfferControllerProvider(offer).notifier)
              .onChange(offer.copyWith(added: value));

          //add to a todo list
          ref
              .read(toggleListOfferControllerProvider.notifier)
              .selectTodoItems(state.copyWith(added: value));
        });
  }
}
