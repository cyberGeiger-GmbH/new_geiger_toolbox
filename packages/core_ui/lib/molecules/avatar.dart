import 'package:core_ui/foundation/themes/theme_data_extended.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key,
      this.photoUrl,
      required this.radius,
      this.borderColor,
      this.borderWidth});

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
    final appColor = Theme.of(context).appColors.appColor;

    return Container(
      decoration: _borderDecoration(),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: appColor.surface,
        backgroundImage: photoUrl != null ? NetworkImage(photoUrl??"") : null,
        child: photoUrl != null ? null : const Icon(Icons.camera_alt),
      ),
    );
  }
}
