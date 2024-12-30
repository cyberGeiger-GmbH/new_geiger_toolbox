import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/offering_status.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class AddOfferingToDoWidget extends ConsumerWidget {
  const AddOfferingToDoWidget({
    super.key,
    required this.offer,
  });

  final OfferingStatus offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //* listen to error message when adding offerings to todos
    // * and reset check to false
    ref.listen(addOfferingTodoControllerProvider, (_, nxtState) {
      if (!nxtState.isLoading && nxtState.hasError) {
        //reset
        ref
            .read(toggleOfferControllerProvider(offer).notifier)
            .onChange(offer.copyWith(added: false));
      }
    });

    //listen to  message when adding offering to todos
    ref.listen(toggleOfferControllerProvider(offer), (_, nxtValue) {
      final appColor = Theme.of(context).colorScheme;
      showSnackBar(
          context: context,
          content: nxtValue.added == true
              ? "Added successfully".hardcoded
              : "Removed successfully",
          backgroundColor:
              nxtValue.added == true ? appColor.primary : appColor.error);
    });

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
          //store in db
          await ref
              .read(addOfferingTodoControllerProvider.notifier)
              .addOrUpdate(status: offer.copyWith(added: value));
        });
  }
}
