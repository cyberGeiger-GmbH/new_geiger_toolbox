import 'package:core_ui/molecules/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppButton.tertiary(label: "Get Started".hardcoded, context: context, onPressed: onPressed),
    );
  }
}
