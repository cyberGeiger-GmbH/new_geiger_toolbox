import 'dart:io';

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todo_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/constants.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(watchTodosProvider);

    return AsyncValueWidget(
      value: todos,
      data: (data) => data.isEmpty ? const SizedBox.shrink() : ShortTodoList(items: data, displayLimit: 3),
    );
  }
}

class ShortTodoList extends StatelessWidget {
  const ShortTodoList({super.key, required this.items, required this.displayLimit});
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
          ShowLimitedTodos(items: items, displayLimit: displayLimit),
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
        children:
            ListTile.divideTiles(
              context: context,
              tiles: (items.map(
                (item) => Card(
                  child: ListTile(
                    title: AppText.bodyMedium(text: item.offering.name, context: context, textAlign: TextAlign.start),
                    subtitle: AppText.bodySmall(text: item.offering.summary, context: context),
                  ),
                ),
              )),
            ).toList(),
      ),
    );
  }
}

class ShowLimitedTodos extends ConsumerWidget {
  const ShowLimitedTodos({super.key, required this.items, required this.displayLimit});
  final List<TodoOffering> items;
  final int displayLimit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limit = limitListLength(inputList: items, limit: displayLimit).length;
    return Column(
      children: [
        for (var i = 0; i < limit; i++) ...[
          DismissibleTodo(
            item: items[i],
            onDismissed: (direction) async {
              final item = items[i];
              if (direction == DismissDirection.startToEnd) {
                ref.read(todoControllerProvider.notifier).makeAsDone(item);
                return false;
              } else {
                ref.read(todoControllerProvider.notifier).planLater(item);
                return true;
              }
            },
            child: TodoListTile(
              item: items[i],
              onChanged: () {
                if (items[i].status == Status.done) {
                  final value = items[i].copyWith(status: Status.planned);
                  ref.read(todoControllerProvider.notifier).planLater(value);
                } else {
                  final value = items[i].copyWith(status: Status.done);
                  ref.read(todoControllerProvider.notifier).makeAsDone(value);
                }
              },
              showDetails: () {
                showWoltModalBottomSheet(
                  context,
                  title: items[i].offering.name,
                  forceMaxHeight: false,
                  page: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.3, // Use 40% of screen height
                        child: Padding(
                          padding: const EdgeInsets.all(Spacing.p16),
                          child: AppText.bodySmall(text: items[i].offering.summary, context: context),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // child: TodoListTileCard(item: items[i]),
          ),
          if (i < (items.length > displayLimit ? displayLimit - 1 : items.length - 1)) Divider(height: 1),
        ],
      ],
    );
  }
}

typedef DismissibleCallback<T> = Future<bool?> Function(T value);

class DismissibleTodo extends StatelessWidget {
  const DismissibleTodo({super.key, required this.item, required this.child, required this.onDismissed});

  final TodoOffering item;
  final Widget child;
  final DismissibleCallback<DismissDirection> onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: onDismissed,
      child: child,
    );
  }
}

class TodoListTile extends StatelessWidget {
  final TodoOffering item;
  final VoidCallback onChanged;
  final VoidCallback showDetails;

  const TodoListTile({super.key, required this.item, required this.onChanged, required this.showDetails});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ListTile(
        onTap: () => showDetails(),
        leading:
            Platform.isIOS
                ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    item.status == Status.done ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.circle,
                    color: item.status == Status.done ? Colors.blue : Colors.grey,
                    size: 28,
                  ),
                  onPressed: () => onChanged(),
                )
                : IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    item.status == Status.done ? Icons.check_circle : Icons.circle,
                    color: item.status == Status.done ? Colors.blue : Colors.grey,
                    size: 28,
                  ),
                  onPressed: () => onChanged(),
                ),
        title: AppText.bodyMedium(
          text: item.offering.name,
          color: item.status == Status.done ? Colors.grey : Colors.black,
          context: context,
          textAlign: TextAlign.start,
          textRemoved: item.status == Status.done,
        ),
        trailing: Icon(Icons.chevron_right),
      ),
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
            AppText.bodySmall(text: text, context: context, color: theme.hintColor),
            Icon(Icons.chevron_right, color: theme.hintColor),
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
        Divider(height: 1),
        AppTextButton.primary(context: context, label: "See All".hardcoded, onTap: seeAll),
      ],
    );
  }
}
