import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_app_bar.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering_category.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/category/todos_category.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class TodosCategoryScreen extends ConsumerWidget {
  const TodosCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(watchTodosProvider);
    return Scaffold(
      appBar: GeigerAppBar(title: "Todos".hardcoded),
      body: AsyncValueWidget(value: todos, data: (data) => TodoCategoryCardList(categories: data)),
    );
  }
}



class TodoCategoryCardList extends ConsumerWidget {
  final List<TodoOfferingCategory> categories;
  const TodoCategoryCardList({super.key, required this.categories});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: categories.map((e) => TodoCategory(category: e)).toList());
  }
}
