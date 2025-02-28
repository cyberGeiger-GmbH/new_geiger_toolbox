import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/limit_news_item_list.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/news_item.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/helpers/helpers_functions.dart';

class PreviousNewsWidget extends ConsumerWidget {
  const PreviousNewsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsValue = ref.watch(watchOldNewsFeedsProvider);

    final int limitView = 6;

    //only show previous that is not currrently in the Carousel
    return AsyncValueWidget(
      value: newsValue,
      data:
          (value) =>
              value.isEmpty
                  ? const SizedBox.shrink()
                  : NewsContainer(
                    limit: 8,
                    items:
                        value
                            .map(
                              (news) => NewsItem(
                                lastUpdated: DateTime.parse(news.dateCreated),
                                title: news.title,
                                url: news.imageUrl,
                                onPress: () => navigateToNewsDetails(newsId: news.id, context: context),
                              ),
                            )
                            .toList(),
                    seeAll: () {},
                  ),
    );
  }
}


class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.limit, required this.items, required this.seeAll});
  final int limit;
  final List<NewsItem> items;
  final VoidCallback seeAll;
  @override
  Widget build(BuildContext context) {
    return GeigerCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContainerLabel(showAllItems: seeAll, text: "Other News".hardcoded),
          LimitNewsItemList(displayLimit: limit, items: items, seeAll: seeAll),
        ],
      ),
    );
  }
}
