import 'package:core_ui/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_images_data.freezed.dart';

@freezed
class AppImagesData with _$AppImagesData {
  factory AppImagesData({required Image name}) = _AppImagesData;

  factory AppImagesData.geigerLogo() =>
      AppImagesData(name: Assets.images.geigerLogo.image());
}
