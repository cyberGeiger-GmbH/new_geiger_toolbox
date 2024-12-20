import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/organisms/news_content.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/recommendations/recommendation_tile_list_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/date_formater.dart';

class NewsDetailsWidget extends StatelessWidget {
  const NewsDetailsWidget({super.key, required this.newsfeed});
  final News newsfeed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppCachedNetworkImage.newsImage(imageUrl: newsfeed.imageUrl),
          Spacing.gapH4,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final formattedDate = ref.watch(
                        formattedDateProvider(inputDate: newsfeed.dateCreated));
                    return NewsContent(
                        summary: newsfeed.summary,
                        lastedUpdated: formattedDate,
                        lastUpdatedLabel: "Last updated".hardcoded,
                        title: newsfeed.title);
                  },
                ),
                Spacing.gapH4,
                ProtectionTileListWithTitle(
                  title: "How to Protect me?".hardcoded,
                  protectionTileList: RecommendationTileListWidget(
                    recommendations: newsfeed.recommendations,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


