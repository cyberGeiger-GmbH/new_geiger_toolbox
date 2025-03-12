import 'package:core_ui/organisms/news_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/date_time_formatter.dart';

class LastUpdatedWidget extends ConsumerWidget {
  const LastUpdatedWidget({super.key, required this.lastUpdated});
  final DateTime lastUpdated;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final formattedDate = ref.watch(timeAgoProvider(timestamp: lastUpdated));
    return  MetaInfoContent(title:"Last Updated".hardcoded, source: formattedDate,);
  }
}
