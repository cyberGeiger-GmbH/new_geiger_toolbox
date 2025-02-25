import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/slide_indicator.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/extensions/news_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_controller.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:geiger_toolbox/src/utils/constants.dart';
import 'package:geiger_toolbox/src/utils/helpers/carousel_helper.dart';
import 'package:go_router/go_router.dart';

class NewsFeedsWidget extends ConsumerWidget {
  NewsFeedsWidget({super.key, this.limitNewsFeedDisplay = 5});
  final int limitNewsFeedDisplay;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listen for errors
    if (getFlavor() == Flavor.dev || getFlavor() == Flavor.stg) {
      ref.listen(watchRecentNewsFeedsProvider, (_, nxt) => nxt.showAlertDialogOnError(context: context));
    }

    final newsFeedValue = ref.watch(watchRecentNewsFeedsProvider);
    final state = ref.watch(scanButtonControllerProvider);
    final index = ref.watch(newsFeedsControllerProvider);

    return AsyncValueWidget(
      value: newsFeedValue,
      data: (news) {
        if (news.isEmpty) {
          return const SizedBox.shrink();
        } else {
          final limitNews = limitListLength(inputList: news, limit: limitNewsFeedDisplay);

          return Column(
            children: [
              CarouselSlider(
                items: limitNews.toWidgetList(
                  context: context,
                  currentIndex: index,
                  onPressed:
                      state.isLoading
                          ? null
                          : () {
                            final title = news[index].title;
                            context.goNamed(
                              AppRouter.newDetailsRouter.name,
                              pathParameters: {AppRouter.newDetailsRouter.name: title},
                            );
                          },
                ),
                controller: _controller,
                options: CarouselHelper.customCarouselOptions(
                  //auto callback
                  onPageChanged: (index, reason) {
                    ref.read(newsFeedsControllerProvider.notifier).update(index);
                  },
                  disableCenter: true,
                ),
              ),
              SlideIndicator(data: limitNews, current: index),
            ],
          );
        }
      },
    );
  }
}


