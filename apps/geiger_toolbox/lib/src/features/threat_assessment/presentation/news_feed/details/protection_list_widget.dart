import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/recommendation_tile_list_widget.dart';



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

    return RecommendationTileListWidget(recommendations: recommendations);
  }
}

