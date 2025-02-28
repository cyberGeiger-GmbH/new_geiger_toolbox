import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class SeeAllTextButton extends StatelessWidget {
  const SeeAllTextButton({super.key, required this.seeAll});
  final VoidCallback seeAll;
  @override
  Widget build(BuildContext context) {
    return AppTextButton.primary(context: context, label: "See All".hardcoded, onTap: seeAll);
  }
}