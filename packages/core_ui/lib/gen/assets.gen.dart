/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app-icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/images/app-icon.png');

  /// File path: assets/images/circles-bg.png
  AssetGenImage get circlesBg => const AssetGenImage('assets/images/circles-bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [appIcon, circlesBg];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cG_magnifying_glass.svg
  String get cGMagnifyingGlass => 'packages/core_ui/assets/svg/cG_magnifying_glass.svg';

  /// File path: assets/svg/cG_measure.svg
  String get cGMeasure => 'packages/core_ui/assets/svg/cG_measure.svg';

  /// File path: assets/svg/cG_tick.svg
  String get cGTick => 'packages/core_ui/assets/svg/cG_tick.svg';

  /// File path: assets/svg/cG_trophy.svg
  String get cGTrophy => 'packages/core_ui/assets/svg/cG_trophy.svg';

  /// List of all assets
  List<String> get values => [cGMagnifyingGlass, cGMeasure, cGTick, cGTrophy];
}

class Assets {
  Assets._();

  static const String package = 'core_ui';

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  static const String package = 'core_ui';

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/core_ui/$_assetName';
}
