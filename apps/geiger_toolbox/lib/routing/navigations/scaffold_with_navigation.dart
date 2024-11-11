import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/organisms/navigations/scaffold_with_naviagion_rail.dart';
import 'package:core_ui/organisms/navigations/scaffold_with_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    
    //check device screen size
    return LayoutBuilder(builder: (context, constraint) {
      return constraint.isSmallDevice
          ? ScaffoldWithNavigationBar(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch)
          : ScaffoldWithNaviagionRail(
              body: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _goBranch);
    });
  }
}