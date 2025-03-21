import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

const defaultDialogKey = Key('default-dialog-key');

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  VoidCallback? trigger,
}) async {
  return showDialog(
    context: context,
    // * Only make the dialog dismissible if there is a cancel button
    barrierDismissible: cancelActionText != null,
    // * AlertDialog.adaptive was added in Flutter 3.13
    builder:
        (context) => AlertDialog.adaptive(
          title: Text(title),
          content: content != null ? Text(content) : null,
          // * Use [TextButton] or [CupertinoDialogAction] depending on the platform
          actions:
              kIsWeb || defaultTargetPlatform == TargetPlatform.android
                  ? <Widget>[
                    if (cancelActionText != null)
                      TextButton(
                        child: Text(cancelActionText),
                        //context.pop fails during testing
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    TextButton(
                      key: defaultDialogKey,
                      onPressed: trigger ?? () => Navigator.of(context).pop(true),
                      child: Text(defaultActionText),
                    ),
                  ]
                  : <Widget>[
                    if (cancelActionText != null)
                      CupertinoDialogAction(
                        child: Text(cancelActionText),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    CupertinoDialogAction(
                      onPressed: trigger ?? () => Navigator.of(context).pop(true),
                      child: Text(defaultActionText),
                    ),
                  ],
        ),
  );
}

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  void Function()? onError,
  required dynamic exception,
}) => showAlertDialog(
  context: context,
  title: title,
  content: exception.toString(),
  defaultActionText: 'OK'.hardcoded,
  trigger: onError,
);

Future<void> showNotImplementedAlertDialog({required BuildContext context, String? title, String? content}) =>
    showAlertDialog(
      context: context,
      title: title ?? 'Not implemented'.hardcoded,
      content: content ?? "This feature is not quite ready yet.\n Thank you for your interest.".hardcoded,
    );
