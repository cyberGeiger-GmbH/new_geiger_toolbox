// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_asset_image_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppAssetImageData {
  Image get image => throw _privateConstructorUsedError;

  /// Create a copy of AppAssetImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppAssetImageDataCopyWith<AppAssetImageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppAssetImageDataCopyWith<$Res> {
  factory $AppAssetImageDataCopyWith(
          AppAssetImageData value, $Res Function(AppAssetImageData) then) =
      _$AppAssetImageDataCopyWithImpl<$Res, AppAssetImageData>;
  @useResult
  $Res call({Image image});
}

/// @nodoc
class _$AppAssetImageDataCopyWithImpl<$Res, $Val extends AppAssetImageData>
    implements $AppAssetImageDataCopyWith<$Res> {
  _$AppAssetImageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppAssetImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppAssetImageDataImplCopyWith<$Res>
    implements $AppAssetImageDataCopyWith<$Res> {
  factory _$$AppAssetImageDataImplCopyWith(_$AppAssetImageDataImpl value,
          $Res Function(_$AppAssetImageDataImpl) then) =
      __$$AppAssetImageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Image image});
}

/// @nodoc
class __$$AppAssetImageDataImplCopyWithImpl<$Res>
    extends _$AppAssetImageDataCopyWithImpl<$Res, _$AppAssetImageDataImpl>
    implements _$$AppAssetImageDataImplCopyWith<$Res> {
  __$$AppAssetImageDataImplCopyWithImpl(_$AppAssetImageDataImpl _value,
      $Res Function(_$AppAssetImageDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppAssetImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$AppAssetImageDataImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc

class _$AppAssetImageDataImpl implements _AppAssetImageData {
  _$AppAssetImageDataImpl({required this.image});

  @override
  final Image image;

  @override
  String toString() {
    return 'AppAssetImageData(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppAssetImageDataImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  /// Create a copy of AppAssetImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppAssetImageDataImplCopyWith<_$AppAssetImageDataImpl> get copyWith =>
      __$$AppAssetImageDataImplCopyWithImpl<_$AppAssetImageDataImpl>(
          this, _$identity);
}

abstract class _AppAssetImageData implements AppAssetImageData {
  factory _AppAssetImageData({required final Image image}) =
      _$AppAssetImageDataImpl;

  @override
  Image get image;

  /// Create a copy of AppAssetImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppAssetImageDataImplCopyWith<_$AppAssetImageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
