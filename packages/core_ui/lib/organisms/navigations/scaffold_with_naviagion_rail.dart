import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';

import '../../molecules/bars/custom_navigation_rail_destination.dart';

class ScaffoldWithNaviagionRail extends StatelessWidget {
  const ScaffoldWithNaviagionRail(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).appColors.appColor;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: appColor.surface,
            indicatorColor: appColor.onSecondary,
            labelType: NavigationRailLabelType.selected,
            destinations:
                CustomNavigationRailNavigation.getdestination(context),
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          const VerticalDivider(),
          Expanded(child: body),
        ],
      ),
    );
  }
}
