import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({super.key, required this.imageUrl, this.imageWidth, this.imageHeight, this.boxfit});

  factory AppCachedNetworkImage.newsImage({required String imageUrl}) {
    return AppCachedNetworkImage(
      imageUrl: imageUrl,
      imageWidth: double.infinity,
      // ignore: no-magic-number
      imageHeight: 153.73,
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
      fit: boxfit,
      width: double.infinity,
      imageUrl: imageUrl,
      placeholder: (context, _) {
        return Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(width: imageWidth, height: imageHeight, color: Colors.black26),
        );
      },
      errorWidget:
          (context, url, error) => _PlaceholderWidget(key: key, imageWidth: imageWidth, imageHeight: imageHeight),
    );
  }
}

class _PlaceholderWidget extends StatelessWidget {
  const _PlaceholderWidget({super.key, required this.imageWidth, required this.imageHeight});

  final double? imageWidth;
  final double? imageHeight;

  @override
  Widget build(BuildContext context) {
    final hintColor = Theme.of(context).hintColor;
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Center(child: AppText.displaySmall(text: "Invald Image URL", context: context, color: hintColor)),
    );
  }
}
