import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> data = ["nosa", "daniel", "mary", "ok"];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = data
        .asMap()
        .entries
        .map(
          (entry) => _current == entry.key
              ? AppButton.activeNews(
                  title: "${entry.value} - $_current",
                  context: context,
                  onPressed: () {
                    debugPrint("news item $_current");
                  },
                )
              : AppButton.news(
                  title: "${entry.value} - $_current", context: context),
        )
        .toList();
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        controller: _controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          //height: 130,
          aspectRatio: 3.0,
          disableCenter: true,
          //auto callback
          onPageChanged: (index, reason) {
            setState(() => _current = index);
          },
        ),
      ),
      Indicator(data: data, current: _current),
    ]);
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.data,
    required this.current,
  });

  final List<String> data;
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
          .withOpacity(current == next ? 0.9 : 0.4),
    );
  }
}
