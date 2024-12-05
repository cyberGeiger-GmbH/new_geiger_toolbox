import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/recommendation_tile_list_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_controller.dart';

class RecommendationWidget extends ConsumerWidget {
  const RecommendationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeedIndex = ref.watch(newsFeedsControllerProvider);
    final newsFeedValue = ref.watch(watchNewsFeedsProvider);

    return AsyncValueWidget(
      value: newsFeedValue,
      data: (data) {
        final recommendations = data[newsFeedIndex].recommendations;

        return RecommendationTileListWidget(recommendations: recommendations);
      },
    );
  }
}
