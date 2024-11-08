import 'package:core_ui/core_ui.dart';
import 'package:core_ui/foundation/themes/app_images_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = CoreRouter();
    return MaterialApp.router(
      title: 'Toolbox Styling',
      theme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light(),
          AppTextStyleTheme.main(),
          AppIconsTheme.main(),
          AppImagesTheme.main(),
        ],
      ),
      routerConfig: router.goRouter,
    );
  }
}
