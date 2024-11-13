import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class CustomNavigationRailNavigation {
  const CustomNavigationRailNavigation._({required this.icon, required this.label});
  //todo to user customIcon
  final IconData icon;
  final String label;

  factory CustomNavigationRailNavigation.home() {
    return const CustomNavigationRailNavigation._(icon: Icons.home, label: "home");
  }

  factory CustomNavigationRailNavigation.people() {
    return const CustomNavigationRailNavigation._(icon: Icons.people, label: "people");
  }

  factory CustomNavigationRailNavigation.calendar() {
    return const CustomNavigationRailNavigation._(
        icon: Icons.calendar_month, label: "calendar");
  }

  factory CustomNavigationRailNavigation.chat() {
    return const CustomNavigationRailNavigation._(icon: Icons.chat, label: "chat");
  }

  factory CustomNavigationRailNavigation.setting() {
    return const CustomNavigationRailNavigation._(icon: Icons.settings, label: "setting");
  }

  static List<NavigationRailDestination> getdestination(BuildContext context) {
    final home = CustomNavigationRailNavigation.home();
    final people = CustomNavigationRailNavigation.people();
    final calendar = CustomNavigationRailNavigation.calendar();
    final chat = CustomNavigationRailNavigation.chat();
    final setting = CustomNavigationRailNavigation.setting();

    List<NavigationRailDestination> nav = [
      NavigationRailDestination(
        icon: Icon(home.icon),
        label: AppText.labelMedium(text: home.label, context: context),
      ),
      NavigationRailDestination(
        icon: Icon(people.icon),
        label: AppText.labelMedium(text: people.label, context: context),
      ),
      NavigationRailDestination(
        icon: Icon(calendar.icon),
        label: AppText.labelMedium(text: calendar.label, context: context),
      ),
      NavigationRailDestination(
        icon: Icon(chat.icon),
        label: AppText.labelMedium(text: chat.label, context: context),
      ),
      NavigationRailDestination(
        icon: Icon(setting.icon),
        label: AppText.labelMedium(text: setting.label, context: context),
      )
    ];
    return nav;
  }
}
