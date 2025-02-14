import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/add_offering_todo_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/offering_listing_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class RecommendationTileListWidget extends StatelessWidget {
  const RecommendationTileListWidget({
    super.key,
    required this.recommendations,
  });

  final List<Recommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    return ProtectionTileList(
      protectionTile: recommendations.map(
        (reco) {
          return ProtectionTile.outlined(
            context: context,
            title: reco.name,
            onPressed: () {
              showWoltModalBottomSheet(context,
                  title: reco.name,
                  page: RecommendedTodoListWidget(id: reco.id),
                  stickyActionBar: AddAllTodoWidget());
            },
          );
        },
      ).toList(),
    );
  }
}

class AddAllTodoWidget extends ConsumerWidget {
  const AddAllTodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addOfferingTodoControllerProvider);
    final todos = ref.watch(toggleListOfferControllerProvider);
    // debugPrint("todos added $todos");
    return AppButton.tertiary(
      isloading: state.isLoading,
      label: "update todo list".hardcoded,
      context: context,
      onPressed: () async {
        await ref
            .read(addOfferingTodoControllerProvider.notifier)
            .addToActiveTodo(offeringsStatus: todos);
      },
    );
  }
}
