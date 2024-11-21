import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/cards/todo_tile.dart';
import 'package:core_ui/organisms/news_content.dart';

import 'package:flutter/material.dart';

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
                protectionTileList: ProtectionList(
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

class ProtectionList extends StatelessWidget {
  const ProtectionList({super.key, required this.recommendations});
  final List<Recommendation> recommendations;
  @override
  Widget build(BuildContext context) {
    return ProtectionTileList(
      protectionTile: recommendations
          .map(
            (reco) => ProtectionTile.plain(
              title: reco.name,
              onPressed: () {
                showModal(
                  context,
                  title: reco.name,
                  takeAction: ActionPoint(actionPoints: reco.offerings),
                );
              },
            ),
          )
          .toList(),
    );
  }
}

class ActionPoint extends StatelessWidget {
  const ActionPoint({super.key, required this.actionPoints});
  final List<Offering> actionPoints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TodoTileList(
        todoTile: actionPoints
            .map(
              (actionPoint) => TodoTile.plain(
                summary: actionPoint.summary,
                title: actionPoint.name,
                onChange: (value) {
                  // add todos
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
