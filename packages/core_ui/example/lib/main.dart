import 'package:core_ui/foundation/themes/app_theme_data.dart';
import 'package:core_ui/pages/design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Toolbox Styling',
  //     theme: ThemeData(extensions: [
  //       AppColorsTheme.light(),
  //       AppTextStyleTheme.main(),
  //       AppIconsTheme.main(),
  //       AppImagesTheme.main(),
  //     ], useMaterial3: true),
  //     home: const DesignSystem(),
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolbox Styling',
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      home: const DesignSystem(),
    );
  }
}
