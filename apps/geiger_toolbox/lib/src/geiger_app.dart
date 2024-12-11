// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:geiger_toolbox/src/routing/app_start_up_widget.dart';
import 'package:go_router/go_router.dart';

class GeigerApp extends ConsumerWidget {
  const GeigerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Geiger Toolbox',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      routerConfig: router,
      builder: (_, child) => AppStartUpWidget(onLoaded: (_) => child!),
    );
  }
}
