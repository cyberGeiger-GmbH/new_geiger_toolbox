import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class GeigerCard extends StatelessWidget {
  const GeigerCard({super.key, this.child, this.items, this.backgroundColor});

  final Widget? child;
  final List<Widget>? items;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    return items == null
        ? Card(
          elevation: 0,
          color: backgroundColor ?? appColors.onInverseSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
          margin: EdgeInsets.zero,
          child: child,
        )
        : Card(
          elevation: 0,
          color: appColors.onInverseSurface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
          margin: EdgeInsets.zero,
          child: Column(mainAxisSize: MainAxisSize.min, children: items!),
        );
  }
}
