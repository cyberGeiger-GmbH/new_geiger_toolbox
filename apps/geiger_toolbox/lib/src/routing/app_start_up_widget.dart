// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/background_with_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/package_info_provider.dart';
import 'package:geiger_toolbox/src/utils/shared_preference.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/sembast_data_store.dart';

part 'app_start_up_widget.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartUp(Ref ref) async {
  ref.onDispose(() {
    //ensure we invalidate all the providers we depend on
    ref.invalidate(sembastDataStoreProvider);
    ref.invalidate(packageInfoProvider);
  });
  //Preload any other FutureProviders what will be used with requireValue

//just to see the loading screen;
//todo remove in production
  await Future.delayed(Duration(seconds: 2));
  await ref.watch(sembastDataStoreProvider.future);
  await ref.watch(packageInfoProvider.future);
  await ref.watch(sharedPreferencesProvider.future);
}

class AppStartUpWidget extends ConsumerWidget {
  const AppStartUpWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartUpProvider);

    return appStartupState.when(
      data: (_) => onLoaded(context),
      error: (e, s) => AppStartUpErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartUpProvider),
      ),
      loading: () => const AppStartUpLoadingWidget(),
    );
  }
}

class AppStartUpLoadingWidget extends StatelessWidget {
  const AppStartUpLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(Spacing.p16),
        child: BackgroundWithImage(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssetImageData.geigerLogo().image,
            CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}

class AppStartUpErrorWidget extends StatelessWidget {
  const AppStartUpErrorWidget(
      {super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColors.surface,
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ErrorMessage(errorMessage: message),
            Spacing.gapH16,
            AppButton.secondary(
              label: "Retry".hardcoded,
              context: context,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
