import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/offering_status.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class InfoListWidget extends ConsumerWidget {
  const InfoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(watchTodosProvider);

    return AsyncValueWidget(
      value: todos,
      data: (data) => data.isEmpty
          ? const SizedBox.shrink()
          : ShortList(
              items: data,
              displayLimit: 3,
            ),
    );
  }
}

class ShortList extends StatelessWidget {
  const ShortList({
    super.key,
    required this.items,
    required this.displayLimit,
  });
  final List<OfferingStatus> items;
  final int displayLimit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Label(
            showAllTodos: () {
              showAllTodos(context);
            },
          ),
          ShowLimitedTodos(
            items: items,
            displayLimit: displayLimit,
          ),
          if (items.length > displayLimit)
            ShowAll(
              showAll: () {
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
                title: AppText.titleMedium(
                    text: item.offering.name, context: context),
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
  final List<OfferingStatus> items;
  final int displayLimit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0;
            i < (items.length > displayLimit ? displayLimit : items.length);
            i++) ...[
          AppButton.action(
            label: items[i].offering.name,
            context: context,
            onPressed: () {
              showWoltModalBottomSheet(context,
                  title: items[i].offering.name,
                  page: Column(
                    children: [
                      AppText.bodySmall(
                          text: items[i].offering.summary, context: context),
                    ],
                  ));
            },
          ),
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

class ShowAll extends StatelessWidget {
  const ShowAll({super.key, required this.showAll});
  final VoidCallback showAll;
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
          label: "See All",
          onTap: showAll,
        ),
      ],
    );
  }
}

class Label extends StatelessWidget {
  const Label({super.key, required this.showAllTodos});
  final VoidCallback showAllTodos;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: Spacing.p16, top: Spacing.p8),
      child: GestureDetector(
        onTap: showAllTodos,
        child: Row(
          children: [
            AppText.bodySmall(
                text: "Todos".hardcoded,
                context: context,
                color: theme.hintColor),
            Icon(Icons.chevron_right, color: theme.hintColor)
          ],
        ),
      ),
    );
  }
}
