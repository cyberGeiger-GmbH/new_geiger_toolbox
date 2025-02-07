import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/constants.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(watchTodosProvider);

    return AsyncValueWidget(
      value: todos,
      data: (data) => data.isEmpty
          ? const SizedBox.shrink()
          : ShortTodoList(
              items: data,
              displayLimit: 3,
            ),
    );
  }
}

class ShortTodoList extends StatelessWidget {
  const ShortTodoList({
    super.key,
    required this.items,
    required this.displayLimit,
  });
  final List<TodoOffering> items;
  final int displayLimit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Label(
            text: "Todos".hardcoded,
            showAllItems: () {
              showAllTodos(context);
            },
          ),
          ShowLimitedTodos(
            items: items,
            displayLimit: displayLimit,
          ),
          if (items.length > displayLimit)
            SeeAllText(
              seeAll: () {
                showAllTodos(context);
              },
            ),
        ],
      ),
    );
  }

  void showAllTodos(BuildContext context) {
    return showWoltModalBottomSheet(
      context,
      title: 'Todos',
      page: Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: (items.map(
            (item) => Card(
              child: ListTile(
                title: AppText.bodyMedium(
                  text: item.offering.name,
                  context: context,
                  textAlign: TextAlign.start,
                ),
                subtitle: AppText.bodySmall(
                    text: item.offering.summary, context: context),
              ),
            ),
          )),
        ).toList(),
      ),
    );
  }
}

class ShowLimitedTodos extends StatelessWidget {
  const ShowLimitedTodos(
      {super.key, required this.items, required this.displayLimit});
  final List<TodoOffering> items;
  final int displayLimit;
  @override
  Widget build(BuildContext context) {
    final limit = limitListLength(inputList: items, limit: displayLimit).length;
    return Column(
      children: [
        for (var i = 0; i < limit; i++) ...[
          TodoWidget(item: items[i]),
          if (i <
              (items.length > displayLimit
                  ? displayLimit - 1
                  : items.length - 1))
            Divider(
              height: 1,
            ),
        ],
      ],
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.item,
  });

  final TodoOffering item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: null,
      child: ListTile(
          leading: AppText.bodyMedium(
            text: item.offering.name,
            context: context,
          ),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            showWoltModalBottomSheet(context,
                title: item.offering.name,
                page: Column(
                  children: [
                    AppText.bodySmall(
                        text: item.offering.summary, context: context),
                  ],
                ));
          }),
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.showAllItems, required this.text});
  final VoidCallback showAllItems;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.p16, top: Spacing.p8),
      child: GestureDetector(
        onTap: showAllItems,
        child: Row(
          children: [
            AppText.bodySmall(
                text: text, context: context, color: theme.hintColor),
            Icon(Icons.chevron_right, color: theme.hintColor)
          ],
        ),
      ),
    );
  }
}

class SeeAllText extends StatelessWidget {
  const SeeAllText({super.key, required this.seeAll});
  final VoidCallback seeAll;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          height: 1,
        ),
        AppTextButton.primary(
          context: context,
          label: "See All".hardcoded,
          onTap: seeAll,
        ),
      ],
    );
  }
}
