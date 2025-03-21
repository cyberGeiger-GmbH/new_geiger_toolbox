// ignore_for_file: no-magic-number

import 'package:core_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'geiger_images.freezed.dart';

@freezed
class GeigerImages with _$GeigerImages {
  GeigerImages._();

  factory GeigerImages({required Image image}) = _GeigerImages;

  factory GeigerImages.appIcon({double? size}) =>
      GeigerImages(image: Assets.images.appIcon.image(height: size, width: size));

  factory GeigerImages.logo() => GeigerImages(image: Assets.images.geigerLogo.image());

  factory GeigerImages.backgroundImage() => GeigerImages(image: Assets.images.circlesBg.image());
}
