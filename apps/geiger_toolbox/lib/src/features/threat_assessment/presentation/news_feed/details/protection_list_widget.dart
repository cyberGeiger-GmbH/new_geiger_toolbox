import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/task_service.dart';


import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/add_todo_widget.dart';

class ProtectionListWidget extends ConsumerWidget {
  const ProtectionListWidget({super.key, required this.recommendations});

  final List<Recommendation> recommendations;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProtection =
        ref.watch(filterProtectListProvider(recommendations: recommendations));

    return AsyncValueWidget(
        value: filterProtection,
        data: (data) {
          return ProtectionTileList(
              protectionTile: data.items.entries.map((value) {
            return ProtectionTile.plain(context: context, title: value.key, onPressed: () {
              showModal(
                context,
                title: value.key,
                takeAction: AddTodoWidget(task: data,),
              );
            },);
          }).toList());
        });

    // return ProtectionTileList(
    //   protectionTile: recommendations.map(
    //     (reco) {
    //       final todos = reco.offerings
    //           .map(
    //             (v) => TodoTask(offering: v),
    //           )
    //           .toList();

    //       return ProtectionTile.plain(
    //         context: context,
    //         title: reco.name,
    //         onPressed: () {
    //           showModal(
    //             context,
    //             title: reco.name,
    //             takeAction: AddTodoWidget(todos: todos),
    //           );
    //         },
    //       );
    //     },
    //   ).toList(),
    // );
  }
}
