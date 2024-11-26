import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';


import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/add_todo_task_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feed/details/news_feed_details.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';


class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key, required this.newsTitle});
  final String newsTitle;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Scaffold(
      backgroundColor: appColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "News".hardcoded,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          //listen to error message when adding recommendation to task to be done
          ref.listen(
              addTodoTaskCacheControllerProvider,
              (_, nxtState) =>
                  nxtState.showAlertDialogOnError(context: context));

          final newsFeed =
              ref.watch(newsFeedStreamProvider(newsTitle: newsTitle));

          return AsyncValueWidget(
            value: newsFeed,
            data: (data) {
              return data == null
                  ? EmptyPlaceholder(
                      message: "New not found".hardcoded,
                      label: "Go back".hardcoded,
                      onTap: () {
                        context.goNamed(AppRouter.home.name);
                      },
                    )
                  : NewsFeedDetails(newsfeed: data);
            },
          );
        },
      ),
    );
  }
}
