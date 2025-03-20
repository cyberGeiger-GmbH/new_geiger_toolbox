import 'package:core_ui/organisms/show_bottom_sheet_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/all_news_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/news_item.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class _ShowAllNewsWidget extends ConsumerWidget {
  const _ShowAllNewsWidget();

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
                    limit: value.length,
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
                  ),
    );
  }
}

void showAlllNewsBottomSheet(BuildContext context) {
  showWoltModalBottomSheet(context, title: "All News".hardcoded, mainContent: const _ShowAllNewsWidget());
}
