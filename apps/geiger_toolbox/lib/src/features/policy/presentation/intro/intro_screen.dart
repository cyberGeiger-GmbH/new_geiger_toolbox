import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/slide_indicator.dart';

import 'package:geiger_toolbox/src/features/policy/presentation/intro/intro_controller.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/helpers/carousel_helper.dart';

typedef PageChanged<T> = Function(int index, T value);

class IntroScreen extends ConsumerWidget {
  IntroScreen({super.key});
  final items = [
    IntroImage(svgImage: GeigerSvgImages.magnifyingGlass(), description: 'Accessed Your Cybersecurity'.hardcoded),
    IntroImage(svgImage: GeigerSvgImages.measure(), description: 'Know Your Cyber Threats'.hardcoded),
    IntroImage(svgImage: GeigerSvgImages.trickGood(), description: 'Improve Your Protection'.hardcoded),
  ];
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(introControllerProvider);
    final isLastSlide = index >= items.length - 1;

    return GeigerScaffold(
      appBar: GeigerAppBar(
        skip: AppTextButton.primary(
          label: isLastSlide ? "Back" : "Skip",
          context: context,
          onTap: () => _onSkipOrBack(slideLength: items.length, ref: ref),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CarouselWidget(
              controller: controller,
              slidingSpeed: 6,
              isAutoPlay: false,
              items: items,
              onPageChanged: (index, _) => ref.read(introControllerProvider.notifier).update(index),
            ),
          ),
          Spacing.gapH8,
          SlideIndicator(data: items, current: index),
          Spacing.gapH8,

          if (!isLastSlide)
            AppButton.tertiary(
              label: "next".hardcoded,
              context: context,
              onPressed: () => _onNext(ref: ref, slideLength: items.length),
            ),
          if (isLastSlide) TermsAndConditionWidget(),
        ],
      ),
    );
  }

  void _onNext({required int slideLength, required WidgetRef ref}) {
    final nextSlide = ref.read(introControllerProvider.notifier).nextSlide(slideLength: slideLength);
    if (nextSlide) {
      controller.nextPage();
    } else {
      //widget.onDone();
    }
  }

  void _onSkipOrBack({required int slideLength, required WidgetRef ref}) {
    final instance = ref.read(introControllerProvider.notifier);
    final isLastSlide = instance.isLastSlide(slideLength: slideLength);
    if (isLastSlide) {
      // If at last slide, go back to the first slide
      controller.animateToPage(0);
    } else {
      // Else, skip to last slide
      final lastSlide = instance.lastSlide(slideLength: slideLength);
      controller.animateToPage(lastSlide);
    }
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.items,
    required this.onPageChanged,
    this.slidingSpeed,
    required this.controller,
    this.isAutoPlay = true,
  });

  final List<IntroImage> items;
  final CarouselSliderController controller;
  final bool isAutoPlay;

  /// Sliding speed in seconds
  final int? slidingSpeed;
  final PageChanged<CarouselPageChangedReason> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return ResponsiveCenterWidget(
      child: CarouselSlider(
        items: items,
        options: CarouselHelper.customCarouselOptions(
          autoPlay: isAutoPlay,
          height: MediaQuery.sizeOf(context).height * 0.5, // Use 40% of screen height
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
