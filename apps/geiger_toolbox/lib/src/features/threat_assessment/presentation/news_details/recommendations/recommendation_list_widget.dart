import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/offering_listing_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/recommendations/recommenation_item.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class RecommendationListWidget extends StatelessWidget {
  const RecommendationListWidget({super.key, required this.recommendations});

  final List<Recommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    return RecommendationItemContainer(
      items:
          recommendations.map((reco) {
            return RecommendationItem(
              item: reco,
              onPressed: () {
                showWoltModalBottomSheet(
                  context,
                  title: reco.name,
                  page: RecommendedTodoListWidget(id: reco.id, rationale: reco.rationale),
                  stickyActionBar: AddAllTodoWidget(),
                  horizontalPadding: Spacing.p8,
                );
              },
            );
          }).toList(),
    );
  }
}

class RecommendationItemContainer extends StatelessWidget {
  const RecommendationItemContainer({super.key, required this.items});
  final List<RecommendationItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    return Card(
      color: appColors.onInverseSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
      margin: EdgeInsets.zero,
      child: Column(mainAxisSize: MainAxisSize.min, children: items),
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
      label: "Add To todos ".hardcoded,
      context: context,
      onPressed: () async {
        await ref.read(addOfferingTodoControllerProvider.notifier).addToActiveTodo(offeringsStatus: todos);
      },
    );
  }
}
