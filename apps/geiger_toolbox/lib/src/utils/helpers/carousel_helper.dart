import 'package:carousel_slider_plus/carousel_options.dart';

class CarouselHelper {
  static CarouselOptions customCarouselOptions({
    required Function(int, CarouselPageChangedReason) onPageChanged,
    bool autoPlay = false,
    double height = 120,
    bool disableCenter = false,
  }) {
    return CarouselOptions(
      autoPlay: autoPlay,
      enlargeCenterPage: true,
      // ignore: no-magic-number
      enlargeFactor: 0.3,
      // ignore: no-magic-number
      height: height,
      //aspectRatio: 4.0,
      disableCenter: disableCenter,
      viewportFraction: 1,

      //auto callback
      onPageChanged: onPageChanged,
    );
  }
}
