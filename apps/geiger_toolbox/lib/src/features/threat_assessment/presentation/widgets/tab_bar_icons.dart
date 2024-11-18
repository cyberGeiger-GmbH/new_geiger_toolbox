import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TabBarIcons extends StatelessWidget {
  const TabBarIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).appColors.appColor;
    return TabBar(
      indicatorColor: color.primary,
      labelColor: color.primary,
      tabs: const [
        Tab(icon: Icon(Icons.desktop_mac)),
        Tab(icon: Icon(Icons.list)),
        Tab(icon: Icon(Icons.devices)),
        Tab(icon: Icon(Icons.wifi)),
      ],
    );
  }
}
