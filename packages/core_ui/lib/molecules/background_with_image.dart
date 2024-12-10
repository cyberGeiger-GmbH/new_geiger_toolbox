import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:flutter/material.dart';

class BackgroundWithImage extends StatelessWidget {
  const BackgroundWithImage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AppAssetImageData.backgroundImage().image.image,
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
