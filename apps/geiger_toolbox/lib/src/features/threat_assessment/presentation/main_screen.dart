// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/score/score_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/score_message.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/other_news_list_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todo_list_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/welcome_widget.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

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
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: CustomAppBar(
        userProfile: () {
          context.pushNamed(AppRouter.createProfile.name);
        },
      ),
      body: ResponsiveCenterScrollableWidget(
        controller: scrollController,
        child: FeatureListView(
          onScanPressed: () {
            ref.read(scanButtonControllerProvider.notifier).scan();
          },
        ),
      ),
    );
  }
}

class FeatureListView extends ConsumerWidget {
  const FeatureListView(
      {super.key, this.scrollController, required this.onScanPressed});

  final ScrollController? scrollController;
  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeedValue = ref.watch(watchRecentNewsFeedsProvider);

    return AsyncValueWidget(
      value: newsFeedValue,
      data: (value) => value.isEmpty
          ? WelcomeScanIntroWidget(onScanPressed: onScanPressed)
          : SingleChildScrollView(
              controller: scrollController,
              child: FeatureList(onScanPressed: onScanPressed),
            ),
    );
  }
}

class FeatureList extends StatelessWidget {
  const FeatureList({
    super.key,
    required this.onScanPressed,
  });

  final VoidCallback onScanPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ScoreWidget(),
        Spacing.gapH12,
        ScanButtonWidget(onScanPressed: onScanPressed),
        Spacing.gapH12,
        NewsFeedsWidget(),
        Spacing.gapH12,
        //AssetWidget(),
        ScoreMessage(),
        Spacing.gapH12,
        // getFlavor() == Flavor.dev ? RecommendationWidget() :
        TodoListWidget(),
        Spacing.gapH12,
        PreviousNewsWidget()
      ],
    );
  }
}
