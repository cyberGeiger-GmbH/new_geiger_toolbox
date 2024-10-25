// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_colors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppColors {
  Color get foreground => throw _privateConstructorUsedError;
  Color get background => throw _privateConstructorUsedError;

  /// Create a copy of AppColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppColorsCopyWith<AppColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppColorsCopyWith<$Res> {
  factory $AppColorsCopyWith(AppColors value, $Res Function(AppColors) then) =
      _$AppColorsCopyWithImpl<$Res, AppColors>;
  @useResult
  $Res call({Color foreground, Color background});
}

/// @nodoc
class _$AppColorsCopyWithImpl<$Res, $Val extends AppColors>
    implements $AppColorsCopyWith<$Res> {
  _$AppColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foreground = null,
    Object? background = null,
  }) {
    return _then(_value.copyWith(
      foreground: null == foreground
          ? _value.foreground
          : foreground // ignore: cast_nullable_to_non_nullable
              as Color,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppColorsImplCopyWith<$Res>
    implements $AppColorsCopyWith<$Res> {
  factory _$$AppColorsImplCopyWith(
          _$AppColorsImpl value, $Res Function(_$AppColorsImpl) then) =
      __$$AppColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Color foreground, Color background});
}

/// @nodoc
class __$$AppColorsImplCopyWithImpl<$Res>
    extends _$AppColorsCopyWithImpl<$Res, _$AppColorsImpl>
    implements _$$AppColorsImplCopyWith<$Res> {
  __$$AppColorsImplCopyWithImpl(
      _$AppColorsImpl _value, $Res Function(_$AppColorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foreground = null,
    Object? background = null,
  }) {
    return _then(_$AppColorsImpl(
      foreground: null == foreground
          ? _value.foreground
          : foreground // ignore: cast_nullable_to_non_nullable
              as Color,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$AppColorsImpl implements _AppColors {
  const _$AppColorsImpl({required this.foreground, required this.background});

  @override
  final Color foreground;
  @override
  final Color background;

  @override
  String toString() {
    return 'AppColors(foreground: $foreground, background: $background)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppColorsImpl &&
            (identical(other.foreground, foreground) ||
                other.foreground == foreground) &&
            (identical(other.background, background) ||
                other.background == background));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foreground, background);

  /// Create a copy of AppColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppColorsImplCopyWith<_$AppColorsImpl> get copyWith =>
      __$$AppColorsImplCopyWithImpl<_$AppColorsImpl>(this, _$identity);
}

abstract class _AppColors implements AppColors {
  const factory _AppColors(
      {required final Color foreground,
      required final Color background}) = _$AppColorsImpl;

  @override
  Color get foreground;
  @override
  Color get background;

  /// Create a copy of AppColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppColorsImplCopyWith<_$AppColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
