// ignore_for_file: no-magic-number

import 'package:core_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_asset_image_data.freezed.dart';

@freezed
class AppAssetImageData with _$AppAssetImageData {
  AppAssetImageData._();

  factory AppAssetImageData({required Image image}) = _AppAssetImageData;

  factory AppAssetImageData.geigerLogo({double? size}) =>
      AppAssetImageData(image: Assets.images.appIcon.image(height: size, width: size));

  factory AppAssetImageData.logoIcon() => AppAssetImageData(image: Assets.images.appIcon.image(height: 40, width: 40));

  factory AppAssetImageData.backgroundImage() => AppAssetImageData(image: Assets.images.circlesBg.image());

 
}
