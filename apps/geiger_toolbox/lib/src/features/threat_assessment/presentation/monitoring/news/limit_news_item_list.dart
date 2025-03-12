import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/see_all_text_button.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/news_item.dart';

import 'package:geiger_toolbox/src/utils/constants.dart';

class LimitNewsItemList extends StatelessWidget {
  const LimitNewsItemList({super.key, required this.items, required this.displayLimit, this.seeAll});
  final List<NewsItem> items;
  //* displayLimit is the number of items to display in the list 
  
  final int displayLimit;
  final VoidCallback? seeAll;

  @override
  Widget build(BuildContext context) {
    final limit = limitListLength(inputList: items, limit: displayLimit).length;
    return Column(
      children: [
        Column(
          children: [
            for (var i = 0; i < limit; i++) ...[items[i]],
          ],
        ),
        if (items.length > limit) SeeAllTextButton(seeAll: seeAll),
      ],
    );
  }
}
