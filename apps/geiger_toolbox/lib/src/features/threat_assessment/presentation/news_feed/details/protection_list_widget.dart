import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/add_todo_widget.dart';

class ProtectionListWidget extends StatelessWidget {
  const ProtectionListWidget({super.key, required this.recommendations});
  final List<Recommendation> recommendations;
  @override
  Widget build(BuildContext context) {
    return ProtectionTileList(
      protectionTile: recommendations
          .map(
            (reco) => ProtectionTile.plain(
              title: reco.name,
              onPressed: () {
                final todos =
                    reco.offerings.map((v) => Todo(offering: v)).toList();
                showModal(
                  context,
                  title: reco.name,
                  takeAction:
                      AddTodoWidget(todos: todos),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
