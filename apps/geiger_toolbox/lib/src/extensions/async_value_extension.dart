import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

import '../common_widgets/alert_dialogs.dart';

extension AsyncValueExtension on AsyncValue {
  void showAlertDialogOnError({required BuildContext context}) {
    if (!isLoading && hasError) {
      //show all error on dev
      if (getFlavor() == Flavor.dev) {
        showExceptionAlertDialog(context: context, title: 'Error'.hardcoded, exception: error);
      } else {
        //on show app exception error in stg | prod
        if (error is AppException) {
          final appException = error as AppException;
          showExceptionAlertDialog(context: context, title: 'Alert'.hardcoded, exception: appException.message);
        }
      }
    }
  }

  void successAlertSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(context: context, content: "Todos updated".hardcoded, backgroundColor: appColor.primary);
    }
  }

  void updateUserProfileSuccessSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(context: context, content: "User Profile Created!".hardcoded, backgroundColor: appColor.primary);
    }
  }

  void deleteUserProfileSuccessSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(context: context, content: "User Profile Deleted".hardcoded, backgroundColor: appColor.error);
    }
  }
}
