import 'package:flutter/material.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination._({required this.icon, required this.label});

  factory CustomNavigationDestination.home() {
    return const CustomNavigationDestination._(icon: Icons.home, label: "home");
  }

  factory CustomNavigationDestination.people() {
    return const CustomNavigationDestination._(icon: Icons.people, label: "people");
  }

  factory CustomNavigationDestination.calendar() {
    return const CustomNavigationDestination._(icon: Icons.calendar_month, label: "calendar");
  }

  factory CustomNavigationDestination.chat() {
    return const CustomNavigationDestination._(icon: Icons.chat, label: "chat");
  }

  factory CustomNavigationDestination.setting() {
    return const CustomNavigationDestination._(icon: Icons.settings, label: "setting");
  }

  static List<CustomNavigationDestination> getDestination() {
    return [
      CustomNavigationDestination.home(),
      CustomNavigationDestination.people(),
      CustomNavigationDestination.calendar(),
      CustomNavigationDestination.chat(),
      CustomNavigationDestination.setting(),
    ];
  }

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(key: key, icon: Icon(icon), label: label);
  }
}
