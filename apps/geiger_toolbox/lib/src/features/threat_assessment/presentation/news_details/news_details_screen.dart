import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/main_screen.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/news_details_widget.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.newsTitle});
  final String newsTitle;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColors.surface,
      appBar: CustomAppBar(
        title: "News".hardcoded,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          //listen for errors
          if (getFlavor() == Flavor.dev || getFlavor() == Flavor.stg) {
            ref.listen(watchNewsFeedByTitleProvider(newsTitle: newsTitle),
                (_, nxt) => nxt.showAlertDialogOnError(context: context));
          }

          final newsFeed =
              ref.watch(watchNewsFeedByTitleProvider(newsTitle: newsTitle));

          return AsyncValueWidget(
            value: newsFeed,
            data: (data) {
              return data == null
                  ? EmptyPlaceholder(
                      message: "News not found".hardcoded,
                      label: "Go back".hardcoded,
                      onTap: () {
                        context.goNamed(AppRouter.main.name);
                      },
                    )
                  : NewsDetailsWidget(newsfeed: data);
            },
          );
        },
      ),
    );
  }
}
