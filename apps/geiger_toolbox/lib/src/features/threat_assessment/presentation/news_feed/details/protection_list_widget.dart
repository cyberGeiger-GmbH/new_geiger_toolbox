import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/add_todo_widget.dart';

class ProtectionListWidget extends StatelessWidget {
  const ProtectionListWidget({super.key, required this.recommendations});

  final List<Recommendation> recommendations;
  @override
  Widget build(BuildContext context) {

    // return AsyncValueWidget(
    //     value: filterProtection,
    //     data: (data) {
    //       return ProtectionTileList(
    //           protectionTile: data.items.entries.map((value) {

    //         return ProtectionTile.plain(context: context, title: value.key, onPressed: () {
    //           showModal(
    //             context,
    //             title: value.key,
    //             takeAction: AddTodoWidget(task: data,),
    //           );
    //         },);
    //       }).toList());
    //     });

    return ProtectionTileList(
      protectionTile: recommendations.map(
        (reco) {
          final todos = reco.offerings
              .map(
                (v) => TodoTask(offering: v),
              )
              .toList();

          return ProtectionTile.plain(
            context: context,
            title: reco.name,
            onPressed: () {
              showModal(
                context,
                title: reco.name,
                takeAction: AddTodoWidget(todos: todos),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
