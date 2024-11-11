import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/app_text.dart';
import 'package:flutter/material.dart';

/// Widget for showing error messages
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors.appColor;

    return AppText.titleLarge(
      text: errorMessage,
      context: context,
      color: appColor.error,
    );
  }
}
