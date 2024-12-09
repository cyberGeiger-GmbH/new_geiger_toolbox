import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

extension TodoTaskExtension on TodoTask {
  void showSnackBarTodoMessage({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;
    showSnackBar(
        context: context,
        content: isCompleted == true
            ? "Recommendation added successfully".hardcoded
            : "Recommendation removed successfully",
        backgroundColor: isCompleted == true
            ? appColor.primaryContainer
            : appColor.errorContainer);
  }
}
