
import 'package:flutter/material.dart';

import '../../molecules/bars/custom_navigation_destination.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        backgroundColor: appColor.secondaryContainer,
        indicatorColor: appColor.onPrimary,
        elevation: 1,
        destinations: CustomNavigationDestination.getDestination(),
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }
}
