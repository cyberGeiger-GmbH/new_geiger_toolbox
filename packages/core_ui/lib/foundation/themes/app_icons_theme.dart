library core_ui;

import 'package:core_ui/atoms/app_icons_data.dart';
import 'package:flutter/material.dart';

class AppIconsTheme extends IconThemeData {
  final AppIconsData appIcon;

  const AppIconsTheme._(this.appIcon);

  factory AppIconsTheme.main() => AppIconsTheme._(AppIconsData.regular());
}
