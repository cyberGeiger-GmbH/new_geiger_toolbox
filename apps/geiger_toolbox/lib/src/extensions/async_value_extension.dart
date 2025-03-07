import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

import '../common_widgets/alert_dialogs.dart';

extension AsyncValueExtension on AsyncValue {
  void showAlertDialogOnError({required BuildContext context, void Function()? onError}) {
    if (!isLoading && hasError) {
      //show all error on dev
      if (getFlavor() == Flavor.dev) {
        showExceptionAlertDialog(context: context, title: 'Error'.hardcoded, exception: error, onError: onError);
      } else {
        //on show app exception error in stg | prod
        if (error is AppException) {
          final appException = error as AppException;
          showExceptionAlertDialog(
            context: context,
            title: 'Alert'.hardcoded,
            exception: appException.message,
            onError: onError,
          );
        }
      }
    }
  }

  void successAlertSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(
        context: context,
        content: "Todos updated".hardcoded,
        backgroundColor: appColor.primaryContainer,
        textColor: appColor.onPrimaryContainer,
      );
    }
  }

  void todoUpdateStatusSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError && value != null) {
      if (value == Status.done) {
        showSnackBar(
          context: context,
          content: "Todo Completed".hardcoded,
          backgroundColor: appColor.primaryContainer,
          duration: 2,
          textColor: appColor.onPrimaryContainer,
        );
      } else if (value == Status.planned) {
        showSnackBar(
          context: context,
          content: "Todo Not Completed".hardcoded,
          backgroundColor: appColor.secondaryContainer,
          duration: 2,
          textColor: appColor.onSecondaryContainer,
        );
      } else if (value == Status.recommended) {
        showSnackBar(
          context: context,
          content: "Todo Removed".hardcoded,
          backgroundColor: appColor.errorContainer,
          duration: 2,
          textColor: appColor.onErrorContainer,
        );
      }
    }
  }

  void updateUserProfileSuccessSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(
        context: context,
        content: "User Profile Created!".hardcoded,
        backgroundColor: appColor.primaryContainer,
        textColor: appColor.onPrimaryContainer,
      );
    }
  }

  void deleteUserProfileSuccessSnackBar({required BuildContext context}) {
    final appColor = Theme.of(context).colorScheme;

    if (!isLoading && !hasError) {
      showSnackBar(
        context: context,
        content: "User Profile Deleted".hardcoded,
        backgroundColor: appColor.errorContainer,
        textColor: appColor.onErrorContainer,
      );
    }
  }
}
