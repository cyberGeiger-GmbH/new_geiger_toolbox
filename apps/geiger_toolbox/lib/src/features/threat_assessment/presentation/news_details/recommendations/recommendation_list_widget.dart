import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/offering_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/recommendations/recommenation_item.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:go_router/go_router.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({super.key, required this.recommendations});

  final List<Recommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return GeigerCard(
      items:
          recommendations.map((reco) {
            return RecommendationItem(
              item: reco,
              onPressed: () {
                showWoltModalBottomSheet(
                  context,
                  title: reco.name,
                  mainContent: OfferingWidget(id: reco.id, rationale: reco.rationale),
                  stickyActionBar: AddAllTodoWidget(),
                );
              },
            );
          }).toList(),
    );
  }
}

class AddAllTodoWidget extends ConsumerWidget {
  const AddAllTodoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addOfferingTodoControllerProvider);
    final todos = ref.watch(toggleListOfferControllerProvider);
    // debugPrint("todos added $todos");
    return AppButton.tertiary(
      isLoading: state.isLoading,
      label: "Save  todos ".hardcoded,
      context: context,
      onPressed: () async {
        await ref
            .read(addOfferingTodoControllerProvider.notifier)
            .addToActiveTodo(offeringsStatus: todos, onSuccess: context.pop);
      },
    );
  }
}
