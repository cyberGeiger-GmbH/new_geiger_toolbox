import 'package:flutter/material.dart';

import '../texts/app_text.dart';

class CustomNavigationRailDestination {
  //todo to user customIcon
  final IconData icon;
  final String label;

  const CustomNavigationRailDestination._({required this.icon, required this.label});

  factory CustomNavigationRailDestination.home() {
    return const CustomNavigationRailDestination._(icon: Icons.home, label: "home");
  }

  factory CustomNavigationRailDestination.people() {
    return const CustomNavigationRailDestination._(icon: Icons.people, label: "people");
  }

  factory CustomNavigationRailDestination.calendar() {
    return const CustomNavigationRailDestination._(icon: Icons.calendar_month, label: "calendar");
  }

  factory CustomNavigationRailDestination.chat() {
    return const CustomNavigationRailDestination._(icon: Icons.chat, label: "chat");
  }

  factory CustomNavigationRailDestination.setting() {
    return const CustomNavigationRailDestination._(icon: Icons.settings, label: "setting");
  }

  static List<NavigationRailDestination> getdestination(BuildContext context) {
    final home = CustomNavigationRailDestination.home();
    final people = CustomNavigationRailDestination.people();
    final calendar = CustomNavigationRailDestination.calendar();
    final chat = CustomNavigationRailDestination.chat();
    final setting = CustomNavigationRailDestination.setting();

    return [
      NavigationRailDestination(icon: Icon(home.icon), label: AppText.labelMedium(text: home.label, context: context)),
      NavigationRailDestination(
        icon: Icon(people.icon),
        label: AppText.labelMedium(text: people.label, context: context),
      ),
      NavigationRailDestination(
        icon: Icon(calendar.icon),
        label: AppText.labelMedium(text: calendar.label, context: context),
      ),
      NavigationRailDestination(icon: Icon(chat.icon), label: AppText.labelMedium(text: chat.label, context: context)),
      NavigationRailDestination(
        icon: Icon(setting.icon),
        label: AppText.labelMedium(text: setting.label, context: context),
      ),
    ];
  }
}
