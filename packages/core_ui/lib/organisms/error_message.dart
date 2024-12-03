import 'package:core_ui/foundation/themes/theme_data_extended.dart';
import 'package:flutter/material.dart';

import '../molecules/texts/app_text.dart';

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
