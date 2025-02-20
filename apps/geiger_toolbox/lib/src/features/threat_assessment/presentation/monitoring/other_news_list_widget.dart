import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/organisms/news_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:geiger_toolbox/src/utils/constants.dart';
import 'package:geiger_toolbox/src/utils/date_formater.dart';
import 'package:go_router/go_router.dart';

class PreviousNewsWidget extends ConsumerWidget {
  const PreviousNewsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsValue = ref.watch(watchOldNewsFeedsProvider);
    //only show previous news when the news available is > limitView
    final int limitView = 5;
    return AsyncValueWidget(
      value: newsValue,
      data:
          (value) =>
              value.isEmpty || value.length <= limitView
                  ? const SizedBox.shrink()
                  : OlderNewsList(limit: 4, items: value),
    );
  }
}

class OlderNewsList extends StatelessWidget {
  const OlderNewsList({super.key, required this.limit, required this.items});
  final int limit;
  final List<News> items;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Label(showAllItems: () {}, text: "Other News".hardcoded),
          ShowLimitedTodos(displayLimit: limit, items: items),
          if (items.length > limit) SeeAllText(seeAll: () {}),
        ],
      ),
    );
  }
}

class ShowLimitedTodos extends StatelessWidget {
  const ShowLimitedTodos({super.key, required this.items, required this.displayLimit});
  final List<News> items;
  final int displayLimit;
  @override
  Widget build(BuildContext context) {
    final limit = limitListLength(inputList: items, limit: displayLimit).length;
    return Column(
      children: [
        for (var i = 0; i < limit; i++) ...[
          OtherNews(
            lastUpdated: items[i].dateCreated,
            title: items[i].title,
            url: items[i].imageUrl,
            onPress: () {
              context.goNamed(
                AppRouter.newDetailsRouter.name,
                pathParameters: {AppRouter.newDetailsRouter.name: items[i].title.replaceSpacesWithHyphen},
              );
            },
          ),
          if (i < (items.length > displayLimit ? displayLimit - 1 : items.length - 1)) Divider(height: 1),
        ],
      ],
    );
  }
}

class OtherNews extends StatelessWidget {
  const OtherNews({super.key, required this.url, required this.title, required this.lastUpdated, this.onPress});
  final String url;
  final String title;
  final String lastUpdated;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(radius: 25, photoUrl: url),
      title: AppText.bodyMedium(text: title, context: context, textAlign: TextAlign.start),
      subtitle: Consumer(
        builder: (context, ref, child) {
          final format = ref.watch(formattedDateProvider(inputDate: lastUpdated));
          return HorizontalTitleContent(title: 'Last update'.hardcoded, source: format);
        },
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onPress,
      contentPadding: EdgeInsets.symmetric(horizontal: 10), // Adjust padding
    );
  }
}
