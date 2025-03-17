import 'package:core_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageWidth = double.infinity,
    this.imageHeight,
    this.boxfit,
  });

  factory AppCachedNetworkImage.newsImage({required String imageUrl}) {
    return AppCachedNetworkImage(
      imageUrl: imageUrl,
      // ignore: no-magic-number
      imageHeight: 192,
      boxfit: BoxFit.fill,
    );
  }

  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      //height: imageHeight,
      fit: boxfit,
      width: imageWidth,
      imageUrl: imageUrl,

      placeholder: (context, _) {
        return Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(width: imageWidth, height: imageHeight, color: Colors.black26),
        );
      },
      errorWidget:
          (context, url, error) =>
              _PlaceholderWidget(key: key, imageWidth: imageWidth, imageHeight: imageHeight, boxfit: boxfit),
    );
  }
}

class _PlaceholderWidget extends StatelessWidget {
  const _PlaceholderWidget({super.key, required this.imageWidth, required this.imageHeight, this.boxfit});

  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? boxfit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(image: DecorationImage(image: Assets.images.defaultNewsImage.provider(), fit: boxfit)),
    );
  }
}
