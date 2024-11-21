import 'package:core_ui/foundation/themes/extension.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      this.imageWidth,
      this.imageHeight,
      this.boxfit});
  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? boxfit;

  factory AppCachedNetworkImage.newsImage({required String imageUrl}) {
    return AppCachedNetworkImage(
      imageUrl: imageUrl,
      imageWidth: double.infinity,
      imageHeight: 153.73,
      boxfit: BoxFit.fill,
    );
  }
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return CachedNetworkImage(
      fit: boxfit,
      width: double.infinity,
      imageUrl: imageUrl,
      placeholder: (context, _) {
        return Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(
              width: imageWidth,
              height: imageHeight,
              color: appColors.defaultColor),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
