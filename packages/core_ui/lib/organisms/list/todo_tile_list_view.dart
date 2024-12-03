import 'package:core_ui/foundation/themes/theme_data_extended.dart';
import 'package:core_ui/utils/list_view_builder.dart';
import 'package:core_ui/utils/utils.dart';

import 'package:flutter/material.dart';

import '../../molecules/cards/todo_tile.dart';


///example on how to use [ListViewBuilder.outlined]

class TodoTileListView extends StatelessWidget {
  const TodoTileListView({super.key, required this.todoTile});
  final List<TodoTile> todoTile;
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder.outlined(
        itemBuilder: (_, index) => todoTile[index],
        length: todoTile.length,
        context: context);
  }
}

class TodoTileList extends StatelessWidget {
  const TodoTileList({super.key, required this.todoTile});
  final List<Widget> todoTile;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    
    return Container(
      decoration: Utils.getDecoration(appColors),
      child: Column(
          children: ListTile.divideTiles(
              context: context,
              tiles: todoTile.map((value) => value)).toList()),
    );
  }
}
