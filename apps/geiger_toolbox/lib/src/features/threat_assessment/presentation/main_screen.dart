// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';
import 'package:feedback_sentry/feedback_sentry.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/asset_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/dashboard_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/recommendation_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/welcome_widget.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

//home screen
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //show error when scan button throw as exceptions
    ref.listen(
      scanButtonControllerProvider,
      (_, nextState) => nextState.showAlertDialogOnError(context: context),
    );

    // final state = ref.watch(homeScreenControllerProvider);
    final newsFeedState = ref.watch(watchNewsFeedsProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: (newsFeedState.hasValue &&
              newsFeedState.value != null &&
              newsFeedState.value!.isEmpty)
          ? WelcomeWidget()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (appFlavor == "dev" || appFlavor == 'stg') SendFeedback(),
                  Spacing.gapH8,
                  ScanButtonWidget(),
                  Spacing.gapH16,
                  //todo: when state is still loading show [NewsFeedWidgetShimmer, AssetWidgetShimmer, DashboardShimmer]
                  NewsFeedsWidget(),
                  Spacing.gapH16,
                  AssetWidget(),
                  Spacing.gapH16,
                  appFlavor == "dev"
                      ? RecommendationWidget()
                      : DashboardWidget(),
                  Spacing.gapH12,
                ],
              ),
            ),
    );
  }
}

class SendFeedback extends StatelessWidget {
  const SendFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Send feedback'.hardcoded),
      onPressed: () {
        BetterFeedback.of(context).showAndUploadToSentry();
      },
    );
  }
}
