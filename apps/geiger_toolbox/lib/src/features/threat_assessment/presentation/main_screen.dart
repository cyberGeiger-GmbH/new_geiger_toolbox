// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/asset_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todo_list_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/welcome_widget.dart';

//home screen
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //show error when scan button throw as exceptions
    ref.listen(
      scanButtonControllerProvider,
      (_, nextState) {
        return nextState.showAlertDialogOnError(context: context);
      },
    );

    // final state = ref.watch(homeScreenControllerProvider);
    final newsFeedState = ref.watch(watchNewsFeedsProvider);

    return Scaffold(
      appBar: CustomAppBar(),
      body: ((newsFeedState.isLoading || newsFeedState.value != null) &&
              (newsFeedState.value != null && newsFeedState.value!.isEmpty))
          ? WelcomeWidget()
          : DataWidget(),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //todo: use custom scrollable, with silvers
    //
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing.gapH8,
          ScanButtonWidget(),
          Spacing.gapH16,
          //todo: when state is still loading show [NewsFeedWidgetShimmer, AssetWidgetShimmer, DashboardShimmer]
          NewsFeedsWidget(),
          Spacing.gapH16,
          AssetWidget(),
          Spacing.gapH16,
          // getFlavor() == Flavor.dev ? RecommendationWidget() :
          TodoListWidget(),
          Spacing.gapH12,
        ],
      ),
    );
  }
}
