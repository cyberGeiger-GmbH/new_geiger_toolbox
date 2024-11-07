import 'package:core_ui/molecules/custom_navigation_rail_destination.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
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
