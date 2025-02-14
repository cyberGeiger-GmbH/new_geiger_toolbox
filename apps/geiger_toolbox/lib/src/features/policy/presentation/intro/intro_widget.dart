import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/slide_indicator.dart';

import 'package:geiger_toolbox/src/features/policy/presentation/intro/intro_controller.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_screen.dart';

typedef PageChanged<T> = Function(int index, T value);

class IntroScreen extends ConsumerWidget {
  IntroScreen({super.key});
  final items = [
    IntroImage(
        svgImage: GeigerSvgImages.magnifyingGlass(
          height: 180,
        ),
        description: 'Detect Cybersecurity Threat'),
    IntroImage(
        svgImage: GeigerSvgImages.measure(
          height: 180,
        ),
        description: 'Accessment of Cybersecurity Threat Level'),
    IntroImage(
        svgImage: GeigerSvgImages.trickGood(
          height: 180,
        ),
        description: 'Plan your cybersecurity Strategy'),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(introControllerProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: CarouselWidget(
                slidingSpeed: 6,
                items: items,
                onPageChanged: (index, value) =>
                    ref.read(introControllerProvider.notifier).update(index),
              ),
            ),
            SlideIndicator(
              data: items,
              current: index,
            ),
            Spacing.gapH8,
            TermsAndConditionWidget(),
          ],
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  CarouselWidget(
      {super.key,
      required this.items,
      required this.onPageChanged,
      this.slidingSpeed});

  final List<IntroImage> items;
  final CarouselSliderController controller = CarouselSliderController();

  /// Sliding speed in seconds
  final int? slidingSpeed;
  final PageChanged<CarouselPageChangedReason> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenterWidget(
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          // aspectRatio: 16 / 9,
          height: MediaQuery.sizeOf(context).height *
              0.4, // Use 40% of screen height
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
  const IntroImage(
      {super.key, required this.svgImage, required this.description});
  final GeigerSvgImages svgImage;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, //
      children: [
        svgImage,
        Spacing.gapH22,
        Flexible(
          // Wrap with Flexible
          child: IntroContent(description: description),
        ),
      ],
    );
  }
}

class IntroContent extends StatelessWidget {
  const IntroContent({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return AppText.headlineLarge(
      text: description,
      context: context,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center,
    );
  }
}
