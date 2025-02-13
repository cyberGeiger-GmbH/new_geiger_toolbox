import 'package:core_ui/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

enum IconName {
  cGmagnifyingGlass1,
  cGmeasure1,
  cGtick1,
}

class GeigerSvgImages extends StatelessWidget {
  const GeigerSvgImages._(
      {super.key, this.height, this.width, required this.name});

  final double? width;
  final double? height;
  final String name;

  factory GeigerSvgImages.magnifyingGlass(
          {Key? key, double? width, double? height}) =>
      GeigerSvgImages._(
          key: key,
          width: width,
          height: height,
          name: Assets.svg.cGMagnifyingGlass);

  factory GeigerSvgImages.measure({Key? key, double? width, double? height}) =>
      GeigerSvgImages._(
          key: key, width: width, height: height, name: Assets.svg.cGMeasure);

  factory GeigerSvgImages.trickGood(
          {Key? key, double? width, double? height}) =>
      GeigerSvgImages._(
          key: key, width: width, height: height, name: Assets.svg.cGTick);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(name,
        width: width , // Adjust as needed
        height: height);
  }
}
