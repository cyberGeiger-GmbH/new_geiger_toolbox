import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/utils/providers/hive_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_start_up.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartUp(Ref ref) async {
  ref.onDispose(() {
    //ensure we invalidate all the providers we depend on
    ref.invalidate(initHiveProvider);
  });
  //all asynchronous app initialization c
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  await ref.watch(initHiveProvider.future);
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
        loading: () => const AppStartUpLoadingWidget());
  }
}

class AppStartUpLoadingWidget extends StatelessWidget {
  const AppStartUpLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: CircularProgressIndicator()),
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ErrorMessage(errorMessage: message),
            Spacing.gapH16,
            CenteredTextButton.secondary(
              label: "Retry".hardCoded,
              context: context,
              onTap: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
