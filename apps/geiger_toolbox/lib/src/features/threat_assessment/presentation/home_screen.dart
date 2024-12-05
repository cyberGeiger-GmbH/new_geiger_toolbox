import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/asset_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/dashboard_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_widget.dart';

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

    final appColors = Theme.of(context).appColors.appColor;

    return Scaffold(
      backgroundColor: appColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacing.gapH8,
              ScanWidget(),
              Spacing.gapH16,
              //todo: when state is still loading show [NewsFeedWidgetShimmer, AssetWidgetShimmer, DashboardShimmer]
              NewsFeedsWidget(),
              Spacing.gapH16,
              AssetWidget(),
              Spacing.gapH16,
              appFlavor == "dev" ? TodoRecommendation() : DashboardWidget(),
              Spacing.gapH12,
            ],
          ),
        ),
      ),
    );
  }
}

class TodoRecommendation extends StatelessWidget {
  const TodoRecommendation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText.bodyLarge(
      text: "dev mode... feature coming soon",
      context: context,
      color: Colors.black,
    );
  }
}
