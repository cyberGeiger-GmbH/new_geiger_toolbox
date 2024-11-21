import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/asset_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/dashboard/dashboard_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/home_screen_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scan_widget.dart';

//home screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      homeScreenControllerProvider,
      (_, nextState) => nextState.showAlertDialogOnError(context: context),
    );
    // final state = ref.watch(homeScreenControllerProvider);

    final appColors = Theme.of(context).appColors.appColor;
    return Scaffold(
      backgroundColor: appColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacing.gapH32,
          ScanWidget(),
          Spacing.gapH16,
          //todo: when state is still loading show [NewsFeedWidgetShimmer, AssetWidgetShimmer, DashboardShimmer]
          const NewsFeedsWidget(),
          Spacing.gapH16,
          AssetWidget(),
          Spacing.gapH16,
          DashboardWidget()
        ],
      ),
    );
  }
}
