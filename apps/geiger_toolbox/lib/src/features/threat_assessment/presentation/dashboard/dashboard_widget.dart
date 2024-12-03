import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/task_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';

class DashboardWidget extends ConsumerWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(taskStreamProvider);

    final appColors = Theme.of(context).appColors.appColor;
    return AsyncValueWidget(
      value: todos,
      data: (data) => data.items.isEmpty
          ? EmptyContent(
              message: "Please Press the Scan button",
              color: appColors.defaultColor,
            )
          : ProtectionTileList(
              protectionTile: data.toItemsList().map((value) {
                return ProtectionTile.trailingOnly(title: value.offering.name);
              }).toList(),
            ),
    );
  }
}

