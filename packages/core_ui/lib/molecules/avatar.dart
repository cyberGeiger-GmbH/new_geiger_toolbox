import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.photoUrl, required this.radius, this.borderColor, this.borderWidth});

  final String? photoUrl;
  final double radius;
  final Color? borderColor;
  final double? borderWidth;

  Decoration? _borderDecoration() {
    if (borderColor != null && borderWidth != null) {
      return BoxDecoration(
        shape: BoxShape.circle,
        // ignore: avoid-non-null-assertion
        border: Border.all(color: borderColor!, width: borderWidth!),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Container(
      decoration: _borderDecoration(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: appColor.surface,
        child:
            photoUrl == null || photoUrl!.isEmpty
                ? Icon(Icons.warning, size: radius, color: appColor.onSurface)
                : ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: photoUrl!,
                    fit: BoxFit.cover,
                    width: radius * 2,
                    height: radius * 2,
                    errorWidget: (context, url, error) => Icon(Icons.warning, size: radius, color: appColor.onSurface),
                  ),
                ),
      ),
    );
  }
}
