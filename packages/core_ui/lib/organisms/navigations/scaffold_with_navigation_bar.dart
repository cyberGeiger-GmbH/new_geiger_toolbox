import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/custom_navigation_destination.dart';
import 'package:flutter/material.dart';

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
