// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:force_update_helper/force_update_helper.dart';
import 'package:geiger_toolbox/env/env.dart';
import 'package:geiger_toolbox/src/common_widgets/alert_dialogs.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:geiger_toolbox/src/routing/app_start_up_widget.dart';
import 'package:geiger_toolbox/src/utils/url_launcher_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

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
      builder: (context, child) => AppStartUpWidget(
          onLoaded: (_) => ForceUpdateWidget(
              navigatorKey: router.routerDelegate.navigatorKey,
              forceUpdateClient: ForceUpdateClient(
                // TODO: fetch from an API endpoint or via Firebase Remote Config
                fetchRequiredVersion: () => Future.value('1.0.1'),
                // TODO: Set APP_STORE_ID in the .env files
                iosAppStoreId: Env.appStoreId,
              ),
              allowCancel: false,
              showForceUpdateAlert: (context, bool allowCancel) =>
                  showAlertDialog(
                      context: context,
                      title: "App Update Required".hardcoded,
                      content:
                          "Please update to continue using the app.".hardcoded,
                      cancelActionText: allowCancel ? "Later".hardcoded : null,
                      defaultActionText: "Update Now".hardcoded),
              showStoreListing: (Uri storeUrl) async {
                ref.read(urlLauncherProvider).launch(storeUrl,
                    // * Open app store app directly (or fallback to browser)

                    mode: LaunchMode.externalApplication);
              },
              onException: (e, s) {
                ref.read(appLoggerProvider).logError(e, s);
              },
              child: child!)),
    );
  }
}
