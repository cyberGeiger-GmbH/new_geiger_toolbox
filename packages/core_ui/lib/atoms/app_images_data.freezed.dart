// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_images_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppImagesData {
  Image get name => throw _privateConstructorUsedError;

  /// Create a copy of AppImagesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppImagesDataCopyWith<AppImagesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppImagesDataCopyWith<$Res> {
  factory $AppImagesDataCopyWith(
          AppImagesData value, $Res Function(AppImagesData) then) =
      _$AppImagesDataCopyWithImpl<$Res, AppImagesData>;
  @useResult
  $Res call({Image name});
}

/// @nodoc
class _$AppImagesDataCopyWithImpl<$Res, $Val extends AppImagesData>
    implements $AppImagesDataCopyWith<$Res> {
  _$AppImagesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppImagesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Image,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppImagesDataImplCopyWith<$Res>
    implements $AppImagesDataCopyWith<$Res> {
  factory _$$AppImagesDataImplCopyWith(
          _$AppImagesDataImpl value, $Res Function(_$AppImagesDataImpl) then) =
      __$$AppImagesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Image name});
}

/// @nodoc
class __$$AppImagesDataImplCopyWithImpl<$Res>
    extends _$AppImagesDataCopyWithImpl<$Res, _$AppImagesDataImpl>
    implements _$$AppImagesDataImplCopyWith<$Res> {
  __$$AppImagesDataImplCopyWithImpl(
      _$AppImagesDataImpl _value, $Res Function(_$AppImagesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppImagesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$AppImagesDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc

class _$AppImagesDataImpl implements _AppImagesData {
  _$AppImagesDataImpl({required this.name});

  @override
  final Image name;

  @override
  String toString() {
    return 'AppImagesData(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppImagesDataImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of AppImagesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppImagesDataImplCopyWith<_$AppImagesDataImpl> get copyWith =>
      __$$AppImagesDataImplCopyWithImpl<_$AppImagesDataImpl>(this, _$identity);
}

abstract class _AppImagesData implements AppImagesData {
  factory _AppImagesData({required final Image name}) = _$AppImagesDataImpl;

  @override
  Image get name;

  /// Create a copy of AppImagesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppImagesDataImplCopyWith<_$AppImagesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
