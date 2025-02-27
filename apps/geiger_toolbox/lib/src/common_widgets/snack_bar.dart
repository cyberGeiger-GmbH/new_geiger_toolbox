import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

void showSnackBar({required BuildContext context, required String content, Color? backgroundColor, int? duration}) {
  final appText = AppText.bodySmall(text: content, context: context, textAlign: TextAlign.start);
  final snackBar = SnackBar(
    content: appText,
    // action: SnackBarAction(
    //   label: "Dismiss".hardcoded,
    //   onPressed: () {
    //     context.pop();
    //   },
    // ),
    duration: Duration(seconds: duration ?? 4),
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
