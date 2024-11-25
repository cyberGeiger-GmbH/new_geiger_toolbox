import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

extension ValueMessageSnackBar on TodoTask {
  void showSnackBarTodoMessage({required BuildContext context}) {
    final appColor = Theme.of(context).appColors.appColor;
    showSnackBar(
        context: context,
        content: isCompleted!
            ? "Recommendation added successfully".hardcoded
            : "Recommendation removed successfully",
        backgroundColor:
            isCompleted! ? appColor.primaryContainer : appColor.errorContainer);
  }
}
