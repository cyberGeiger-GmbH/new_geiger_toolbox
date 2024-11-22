import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/organisms/news_content.dart';

import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/protection_list_widget.dart';

class NewsFeedDetails extends StatelessWidget {
  const NewsFeedDetails({super.key, required this.newsfeed});
  final News newsfeed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCachedNetworkImage.newsImage(imageUrl: newsfeed.imageUrl),
        Spacing.gapH4,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NewsContent(
                  summary: newsfeed.summary,
                  articleUrl: newsfeed.articleUrl,
                  title: newsfeed.title),
              Spacing.gapH4,
              ProtectionTileListWithTitle(
                title: "How to Protect me?",
                protectionTileList: ProtectionListWidget(
                  recommendations: newsfeed.recommendations,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
