import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Padding(
      padding: const EdgeInsets.all(Spacing.p12),
      child: EmptyContent(
        message: "Press the Geiger Scan Botton to get your protection score",
        color: appColors.defaultColor,
      ),
    );
  }
}
