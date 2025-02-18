import 'package:flutter/material.dart';

import '../../molecules/bars/custom_navigation_rail_destination.dart';

class ScaffoldWithNaviagionRail extends StatelessWidget {
  const ScaffoldWithNaviagionRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColor.surface,
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: appColor.surface,
            indicatorColor: appColor.onSecondary,
            labelType: NavigationRailLabelType.selected,
            destinations: CustomNavigationRailDestination.getdestination(context),
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
