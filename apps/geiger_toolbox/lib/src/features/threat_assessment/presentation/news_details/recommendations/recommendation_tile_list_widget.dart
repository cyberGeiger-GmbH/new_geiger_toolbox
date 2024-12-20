import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/offering_listing_widget.dart';


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
          return ProtectionTile.plain(
            context: context,
            title: reco.name,
            onPressed: () {
              showModal(
                context,
                title: reco.name,
                takeAction: OfferingListWidget(id: reco.id),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
