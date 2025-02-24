import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/slide_indicator.dart';

import 'package:geiger_toolbox/src/features/policy/presentation/intro/intro_controller.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

typedef PageChanged<T> = Function(int index, T value);

class IntroScreen extends ConsumerWidget {
  IntroScreen({super.key});
  final items = [
    IntroImage(svgImage: GeigerSvgImages.magnifyingGlass(), description: 'Access Your Cybersecurity'.hardcoded),
    IntroImage(svgImage: GeigerSvgImages.measure(), description: 'Know Your Cyberthreat.'.hardcoded),
    IntroImage(svgImage: GeigerSvgImages.trickGood(), description: 'Improve Your Protection'.hardcoded),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(introControllerProvider);

    return GeigerScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselWidget(
              slidingSpeed: 6,
              isAutoPlay: false,
              items: items,
              onPageChanged: (index, value) => ref.read(introControllerProvider.notifier).update(index),
            ),
          ),
          Spacing.gapH8,
          SlideIndicator(data: items, current: index),
          Spacing.gapH8,
          TermsAndConditionWidget(),
          Spacing.gapH22,
        ],
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  CarouselWidget({
    super.key,
    required this.items,
    required this.onPageChanged,
    this.slidingSpeed,
    this.isAutoPlay = true,
  });

  final List<IntroImage> items;
  final CarouselSliderController controller = CarouselSliderController();
  final bool isAutoPlay;

  /// Sliding speed in seconds
  final int? slidingSpeed;
  final PageChanged<CarouselPageChangedReason> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenterWidget(
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          autoPlay: isAutoPlay,
          enlargeCenterPage: true,
          // aspectRatio: 16 / 9,
          height: MediaQuery.sizeOf(context).height * 0.5, // Use 40% of screen height
          viewportFraction: 1,
          autoPlayInterval: Duration(seconds: slidingSpeed ?? 3),
          onPageChanged: onPageChanged,
        ),
        controller: controller,
      ),
    );
  }
}

class IntroImage extends StatelessWidget {
  const IntroImage({super.key, required this.svgImage, required this.description});
  final GeigerSvgImages svgImage;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, //
      children: [
        svgImage,
        Spacing.gapH8,
        // Wrap with Flexible
        IntroContent(description: description),
      ],
    );
  }
}

class IntroContent extends StatelessWidget {
  const IntroContent({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return AppText.displayMedium(
      text: description,
      context: context,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center,
      color: Colors.black,
    );
  }
}
