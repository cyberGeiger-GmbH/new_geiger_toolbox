
import 'package:flutter/material.dart';

import '../../molecules/bars/custom_navigation_destination.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar(
      {super.key,
      required this.body,
      this.feedback,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final Widget body;
  final Widget? feedback;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: body,
      floatingActionButton: feedback,
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
