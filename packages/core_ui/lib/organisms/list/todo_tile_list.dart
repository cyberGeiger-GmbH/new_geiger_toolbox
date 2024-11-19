import 'package:core_ui/utils/list_view_builder.dart';

import 'package:flutter/material.dart';

import '../../molecules/cards/todo_tile.dart';

///* DON'T EXPORT
///example on how to use [ListViewBuilder.outlined]

class TodoTileList extends StatelessWidget {
  const TodoTileList({super.key, required this.data});
  final List<Todo> data;
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder.outlined(
        itemBuilder: (_, index) => TodoTile.plain(
            title: data[index].title,
            summary: data[index].summary,
            done: data[index].value,
            onChange: (value) {}),
        length: data.length,
        context: context);
  }
}

class Todo {
  final String title;
  final String summary;
  final bool value;
  Todo({required this.title, required this.summary, this.value = false});
}
