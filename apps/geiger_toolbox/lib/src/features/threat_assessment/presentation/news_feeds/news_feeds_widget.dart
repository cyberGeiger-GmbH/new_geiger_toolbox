import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/news_extension.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_controller.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class NewsFeedsWidget extends ConsumerStatefulWidget {
  const NewsFeedsWidget({super.key});

  @override
  ConsumerState<NewsFeedsWidget> createState() {
    return _NewsFeedsWidgetState();
  }
}

class _NewsFeedsWidgetState extends ConsumerState<NewsFeedsWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final newsFeedValue = ref.watch(watchNewsFeedsProvider);
    final state = ref.watch(scanControllerProvider);
    
    return AsyncValueWidget(
      value: newsFeedValue,
      data: (news) => Column(
        children: [
          CarouselSlider(
            items: news.toWidgetList(
              context: context,
              currentIndex: _current,
              onPressed: state.isLoading
                  ? null
                  : () {
                      final title = news[_current].title;
                      context.goNamed(
                        AppRouter.newsFeedDetails.name,
                        pathParameters: {
                          AppRouter.newsFeedDetails.name:
                              title.replaceSpacesWithHyphen
                        },
                      );
                    },
            ),
            controller: _controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              // ignore: no-magic-number
              enlargeFactor: 0.3,
              // ignore: no-magic-number
              height: 120,
              //aspectRatio: 4.0,
              disableCenter: true,
              //auto callback
              onPageChanged: (index, reason) {
                setState(() => _current = index);
              },
            ),
          ),
          Indicator(data: news, current: _current),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.data,
    required this.current,
  });

  final List<News> data;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.asMap().entries.map((entry) {
        return Dot(
          current: current,
          next: entry.key,
        );
      }).toList(),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.current,
    required this.next,
  });

  final int current;
  final int next;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Spacing.p12,
          height: Spacing.p12,
          margin: const EdgeInsets.symmetric(
              vertical: Spacing.p8, horizontal: Spacing.p4),
          decoration: botBoDecoration(context),
        ),
      ],
    );
  }

  BoxDecoration botBoDecoration(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: (Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black)
          // ignore: no-magic-number
          .withOpacity(current == next ? 0.9 : 0.4),
    );
  }
}
