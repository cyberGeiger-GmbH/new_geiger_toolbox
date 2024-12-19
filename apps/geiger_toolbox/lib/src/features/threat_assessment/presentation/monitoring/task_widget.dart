import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/task_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class TaskWidget extends ConsumerWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(taskStreamProvider);

    return AsyncValueWidget(
      value: todos,
      data: (data) => data.items.isEmpty
          ? EmptyContent(
              message:
                  "Oops todos list is empty.\n Add recommended migitation from how to protect me list"
                      .hardcoded,
            )
          : ProtectionTileList(
              protectionTile: data.toItemsList().map((value) {
                return ProtectionTile.trailingOnly(title: value.offering.name);
              }).toList(),
            ),
    );
  }
}
