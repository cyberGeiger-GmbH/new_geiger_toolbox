import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/limit_news_item_list.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/news_item.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/show_all_news.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_item.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/helpers/helpers_functions.dart';

class AllNewsWidget extends ConsumerWidget {
  const AllNewsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsValue = ref.watch(watchOldNewsFeedsProvider);

    final int limitView = 5;

    //only show previous that is not currrently in the Carousel
    return AsyncValueWidget(
      value: newsValue,
      data:
          (value) =>
              value.isEmpty
                  ? const SizedBox.shrink()
                  : value.length <= limitView
                  ? const SizedBox.shrink()
                  : NewsContainer(
                    limit: 2,
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
                    seeAll: () => showAlllNewsBottomSheet(context),
                  ),
    );
  }
}

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.limit, required this.items, this.seeAll});
  final int limit;
  final List<NewsItem> items;
  final VoidCallback? seeAll;
  @override
  Widget build(BuildContext context) {
    return GeigerCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          seeAll != null ? ContainerLabel(showAllItems: seeAll, text: "Other News".hardcoded) : const SizedBox.shrink(),
          LimitNewsItemList(displayLimit: limit, items: items, seeAll: seeAll),
        ],
      ),
    );
  }
}
