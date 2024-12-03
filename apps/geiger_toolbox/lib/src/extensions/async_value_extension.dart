import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

import '../common_widgets/alert_dialogs.dart';

extension AsyncValueExtension on AsyncValue {
  void showAlertDialogOnError({required BuildContext context}) {
    if (!isLoading && hasError) {
      showExceptionAlertDialog(
          context: context, title: 'Error'.hardcoded, exception: error);
    }
  }

  void showSnackBarTodoMessage({required BuildContext context}) {
    if (!isLoading && !hasError) {
      showSnackBar(
          context: context,
          content: "Recommendation added successfully".hardcoded);
    }
  }
}
