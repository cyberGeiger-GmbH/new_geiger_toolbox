import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class GeigerApp extends ConsumerWidget {
  const GeigerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Geiger Toolbox',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        extensions: [
          AppColorsTheme.light(),
          AppTextStyleTheme.main(),
          AppIconsTheme.main(),
          AppImagesTheme.main(),
        ],
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
