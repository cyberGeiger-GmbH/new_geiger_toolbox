// ignore_for_file: avoid-non-null-assertion

import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_widget.dart';
import 'package:geiger_toolbox/src/routing/layout/main_layout.dart';
import 'package:geiger_toolbox/src/routing/layout/news_layout.dart';
import 'package:geiger_toolbox/src/routing/layout/todo_layout.dart';
import 'package:geiger_toolbox/src/routing/layout/top_layout.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/all_news_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';

import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

//home screen
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //show error when scan button throw as exceptions
    ref.listen(scanButtonControllerProvider, (_, nextState) {
      return nextState.showAlertDialogOnError(context: context);
    });

    // final state = ref.watch(homeScreenControllerProvider);
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: GeigerAppBar(
        mainScreen: true,
        userProfile: () {
          context.pushNamed(AppRouter.profileRouter.name);
        },
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: MainLayout(
          topLayout:
              (_, height, newsFeedIsEmpty) => TopContent(isNewsFeedEmpty: newsFeedIsEmpty, heightFraction: height),

          newsLayout:
              (_, height, newsFeedIsEmpty) => NewsLayout(isNewsFeedEmpty: newsFeedIsEmpty, heightFraction: height),

          todoLayout: (_, _, newsFeedIsEmpty) => TodoLayout(isNewsFeedEmpty: newsFeedIsEmpty),
        ),
      ),

      //  ResponsiveCenterScrollableWidget(
      //   padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p8),
      //   controller: scrollController,
      //   thumbVisibility: false,
      //   child: FeatureListView(
      //     scrollController: scrollController,
      //     onScanPressed: () {
      //       ref.read(scanButtonControllerProvider.notifier).scan();
      //     },
      //   ),
      // ),
    );
  }
}

// class FeatureListView extends ConsumerWidget {
//   const FeatureListView({super.key, this.scrollController, required this.onScanPressed});

//   final ScrollController? scrollController;
//   final VoidCallback onScanPressed;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final newsFeedValue = ref.watch(watchRecentNewsFeedsProvider);

//     return AsyncValueWidget(
//       value: newsFeedValue,
//       data:
//           (value) =>
//               value.isEmpty
//                   ? WelcomeScanIntroWidget(onScanPressed: onScanPressed)
//                   : SingleChildScrollView(
//                     controller: scrollController,

//                     child: FeatureList(onScanPressed: onScanPressed),
//                   ),
//     );
//   }
// }

@Deprecated("don't use")
class FeatureList extends StatelessWidget {
  const FeatureList({super.key, required this.onScanPressed});

  final VoidCallback onScanPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const GeigerScoreWidget(),
        Spacing.gapH12,
        ScanButtonWidget(onScanPressed: onScanPressed),
        Spacing.gapH12,
        NewsFeedsWidget(),
        Spacing.gapH12,
        //AssetWidget(),
        //**FEEDBACK: don't show the score message widget
        // const ScoreMessageWidget(),
        // Spacing.gapH12,
        // getFlavor() == Flavor.dev ? RecommendationWidget() :
        const TodoListWidget(),
        Spacing.gapH12,
        const AllNewsWidget(),
        Spacing.gapH12,
      ],
    );
  }
}
