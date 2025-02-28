import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class GeigerCard extends StatelessWidget {
  const GeigerCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    return Card(
      elevation: 0,
      color: appColors.onInverseSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
      margin: EdgeInsets.zero,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: Spacing.p16), child: child),
    );
  }
}
