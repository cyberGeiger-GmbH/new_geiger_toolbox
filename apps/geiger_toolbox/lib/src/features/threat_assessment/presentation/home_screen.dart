import 'package:core_ui/core_ui.dart';
import 'package:feedback_sentry/feedback_sentry.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/asset_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/dashboard_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/recommendation_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

//home screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //show error when scan button throw as exceptions
    ref.listen(
      scanControllerProvider,
      (_, nextState) => nextState.showAlertDialogOnError(context: context),
    );

    // final state = ref.watch(homeScreenControllerProvider);

    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColors.surface,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (appFlavor == "dev" || appFlavor == 'stg') SendFeedback(),
              Spacing.gapH8,
              ScanWidget(),
              Spacing.gapH16,
              //todo: when state is still loading show [NewsFeedWidgetShimmer, AssetWidgetShimmer, DashboardShimmer]
              NewsFeedsWidget(),
              Spacing.gapH16,
              AssetWidget(),
              Spacing.gapH16,
              appFlavor == "dev" ? RecommendationWidget() : DashboardWidget(),
              Spacing.gapH12,
            ],
          ),
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
