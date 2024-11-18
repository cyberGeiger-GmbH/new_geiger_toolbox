import 'package:core_ui/core_ui.dart';

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
    final appColor = Theme.of(context).appColors.appColor;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: body,
      bottomNavigationBar: NavigationBar(
        backgroundColor: appColor.surface,
        indicatorColor: appColor.onSecondary,
        destinations: CustomNavigationDestination.getDestination(),
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
    );
  }
}
