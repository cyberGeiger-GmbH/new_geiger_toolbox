import 'package:core_ui/organisms/show_bottom_sheet_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/all_news_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/news_item.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class ShowAllNewsWidget extends ConsumerWidget {
  const ShowAllNewsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsValue = ref.watch(watchOldNewsFeedsProvider);
    return AsyncValueWidget(
      value: newsValue,
      data:
          (value) =>
              value.isEmpty
                  ? const SizedBox.shrink()
                  : NewsContainer(
                    limit: 100,
                    items:
                        value
                            .map(
                              (news) => NewsItem(
                                lastUpdated: DateTime.parse(news.dateCreated),
                                title: news.title,
                                url: news.imageUrl,
                              ),
                            )
                            .toList(),
                    seeAll: () {},
                  ),
    );
  }
}

void showAlllNewsBottomSheet(BuildContext context) {
  showWoltModalBottomSheet(context, title: "All News".hardcoded, page: const ShowAllNewsWidget());
}
