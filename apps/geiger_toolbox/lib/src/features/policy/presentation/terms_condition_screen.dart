import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TermsAndConditionScreen(
      acceptCondition: (value) {},
      getStarted: () {},
      allSizePadding: Spacing.p12,
      getStartedLabel: "Get Started".hardcoded,
    );
  }
}
