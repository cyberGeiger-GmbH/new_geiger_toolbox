import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_offering_repository.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

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
          ? EmptyContent(
              message:
                  "Oops todos list is empty.\n Add recommended migitation from how to protect me list"
                      .hardcoded,
            )
          : ProtectionTileList(
              protectionTile: data.map((value) {
                return ProtectionTile.trailingOnly(title: value.offering.name);
              }).toList(),
            ),
    );
  }
}
