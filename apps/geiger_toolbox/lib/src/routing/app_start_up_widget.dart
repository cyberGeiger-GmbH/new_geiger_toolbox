// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/monitoring/mixpanel_analytics_client.dart';
import 'package:geiger_toolbox/src/utils/device_info.dart';
import 'package:geiger_toolbox/src/utils/package_info.dart';
import 'package:geiger_toolbox/src/utils/shared_preference.dart';
import 'package:geiger_toolbox/src/utils/uuid.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_start_up_widget.g.dart';

@riverpod
class AppStartUp extends _$AppStartUp {
  @override
  FutureOr<void> build() async {
    await _createUser();
    //Preload any other FutureProviders what will be used with requireValue
    await _preloadDependencies();

    // dispose dependency
    ref.onDispose(() {
      //ensure we invalidate all the providers we depend on
      ref.invalidate(packageInfoProvider);
      ref.invalidate(sharedPreferencesProvider);
      ref.invalidate(deviceTypeProvider);
      ref.invalidate(mixpanelAnalyticsClientProvider);
    });
  }

  Future<void> _preloadDependencies() async {
    await ref.read(packageInfoProvider.future);
    await ref.read(sharedPreferencesProvider.future);
    await ref.read(deviceTypeProvider.future);

    // * check if news feed is empty
    // await ref.read(isNewsTableEmptyProvider.future);

    // * Preload MixpanelAnalyticsClient, so we can make unawaited analytics calls
    await ref.read(mixpanelAnalyticsClientProvider.future);
  }

  // create user uuid in storage
  Future<void> _createUser() async {
    final userRepo = ref.read(userProfileRepositoryProvider);
    final uuid = ref.read(getUuidProvider);
    final log = ref.read(logHandlerProvider("Create user"));

    try {
      final existingUser = await userRepo.fetchUser();
      if (existingUser == null) {
        log.w("creating userID...");
        final user = User(userId: uuid, owner: false);
        await userRepo.createUserProfile(user: user);
        log.i("userID created");
      } else {
        log.w("userID id already exist");
      }
    } catch (e) {
      log.e(e);
    }
  }
}

class AppStartUpWidget extends ConsumerWidget {
  const AppStartUpWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. eagerly initialize appStartupProvider (and all the providers it depends on)
    final appStartupState = ref.watch(appStartUpProvider);

    return AsyncValueWidget(
      value: appStartupState,
      data: (_) => onLoaded(context),
      error: (e, s) => AppStartUpErrorWidget(message: e.toString(), onRetry: () => ref.invalidate(appStartUpProvider)),
      loadingWidget: const AppStartUpLoadingWidget(),
    );
  }
}

class AppStartUpLoadingWidget extends StatelessWidget {
  const AppStartUpLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveCenterWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [AppAssetImageData.geigerLogo().image, Spacing.gapH22, const CircularProgressIndicator()],
        ),
      ),
    );
  }
}

class AppStartUpErrorWidget extends StatelessWidget {
  const AppStartUpErrorWidget({super.key, required this.message, required this.onRetry});
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
            AppButton.secondary(label: "Retry".hardcoded, context: context, onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
