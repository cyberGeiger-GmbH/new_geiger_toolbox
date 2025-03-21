import 'package:core_ui/atoms/geiger_images.dart';
import 'package:flutter/material.dart';

class BackgroundWithImage extends StatelessWidget {
  const BackgroundWithImage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: GeigerImages.backgroundImage().image.image, fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
