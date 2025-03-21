// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geiger_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeigerImages {
  Image get image => throw _privateConstructorUsedError;

  /// Create a copy of GeigerImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeigerImagesCopyWith<GeigerImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeigerImagesCopyWith<$Res> {
  factory $GeigerImagesCopyWith(
          GeigerImages value, $Res Function(GeigerImages) then) =
      _$GeigerImagesCopyWithImpl<$Res, GeigerImages>;
  @useResult
  $Res call({Image image});
}

/// @nodoc
class _$GeigerImagesCopyWithImpl<$Res, $Val extends GeigerImages>
    implements $GeigerImagesCopyWith<$Res> {
  _$GeigerImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeigerImages
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
abstract class _$$GeigerImagesImplCopyWith<$Res>
    implements $GeigerImagesCopyWith<$Res> {
  factory _$$GeigerImagesImplCopyWith(
          _$GeigerImagesImpl value, $Res Function(_$GeigerImagesImpl) then) =
      __$$GeigerImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Image image});
}

/// @nodoc
class __$$GeigerImagesImplCopyWithImpl<$Res>
    extends _$GeigerImagesCopyWithImpl<$Res, _$GeigerImagesImpl>
    implements _$$GeigerImagesImplCopyWith<$Res> {
  __$$GeigerImagesImplCopyWithImpl(
      _$GeigerImagesImpl _value, $Res Function(_$GeigerImagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeigerImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$GeigerImagesImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc

class _$GeigerImagesImpl extends _GeigerImages {
  _$GeigerImagesImpl({required this.image}) : super._();

  @override
  final Image image;

  @override
  String toString() {
    return 'GeigerImages(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeigerImagesImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  /// Create a copy of GeigerImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeigerImagesImplCopyWith<_$GeigerImagesImpl> get copyWith =>
      __$$GeigerImagesImplCopyWithImpl<_$GeigerImagesImpl>(this, _$identity);
}

abstract class _GeigerImages extends GeigerImages {
  factory _GeigerImages({required final Image image}) = _$GeigerImagesImpl;
  _GeigerImages._() : super._();

  @override
  Image get image;

  /// Create a copy of GeigerImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeigerImagesImplCopyWith<_$GeigerImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
