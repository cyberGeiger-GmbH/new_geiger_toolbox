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
        .map((value) => AppButton.news(title: value, context: context))
        .toList();
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        controller: _controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 3.0,
          onPageChanged: (index, reason) {
            setState(() => _current = index);
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.asMap().entries.map((entry) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          );
        }).toList(),
      ),
    ]);
  }
}
