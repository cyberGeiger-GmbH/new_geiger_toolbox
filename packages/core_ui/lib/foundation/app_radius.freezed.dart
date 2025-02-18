// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_radius.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppRadius {
  Radius get small => throw _privateConstructorUsedError;
  Radius get regular => throw _privateConstructorUsedError;
  Radius get big => throw _privateConstructorUsedError;

  /// Create a copy of AppRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppRadiusCopyWith<AppRadius> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRadiusCopyWith<$Res> {
  factory $AppRadiusCopyWith(AppRadius value, $Res Function(AppRadius) then) = _$AppRadiusCopyWithImpl<$Res, AppRadius>;
  @useResult
  $Res call({Radius small, Radius regular, Radius big});
}

/// @nodoc
class _$AppRadiusCopyWithImpl<$Res, $Val extends AppRadius> implements $AppRadiusCopyWith<$Res> {
  _$AppRadiusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? small = null, Object? regular = null, Object? big = null}) {
    return _then(
      _value.copyWith(
            small:
                null == small
                    ? _value.small
                    : small // ignore: cast_nullable_to_non_nullable
                        as Radius,
            regular:
                null == regular
                    ? _value.regular
                    : regular // ignore: cast_nullable_to_non_nullable
                        as Radius,
            big:
                null == big
                    ? _value.big
                    : big // ignore: cast_nullable_to_non_nullable
                        as Radius,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppRadiusImplCopyWith<$Res> implements $AppRadiusCopyWith<$Res> {
  factory _$$AppRadiusImplCopyWith(_$AppRadiusImpl value, $Res Function(_$AppRadiusImpl) then) =
      __$$AppRadiusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Radius small, Radius regular, Radius big});
}

/// @nodoc
class __$$AppRadiusImplCopyWithImpl<$Res> extends _$AppRadiusCopyWithImpl<$Res, _$AppRadiusImpl>
    implements _$$AppRadiusImplCopyWith<$Res> {
  __$$AppRadiusImplCopyWithImpl(_$AppRadiusImpl _value, $Res Function(_$AppRadiusImpl) _then) : super(_value, _then);

  /// Create a copy of AppRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? small = null, Object? regular = null, Object? big = null}) {
    return _then(
      _$AppRadiusImpl(
        small:
            null == small
                ? _value.small
                : small // ignore: cast_nullable_to_non_nullable
                    as Radius,
        regular:
            null == regular
                ? _value.regular
                : regular // ignore: cast_nullable_to_non_nullable
                    as Radius,
        big:
            null == big
                ? _value.big
                : big // ignore: cast_nullable_to_non_nullable
                    as Radius,
      ),
    );
  }
}

/// @nodoc

class _$AppRadiusImpl extends _AppRadius {
  const _$AppRadiusImpl({required this.small, required this.regular, required this.big}) : super._();

  @override
  final Radius small;
  @override
  final Radius regular;
  @override
  final Radius big;

  @override
  String toString() {
    return 'AppRadius(small: $small, regular: $regular, big: $big)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppRadiusImpl &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.regular, regular) || other.regular == regular) &&
            (identical(other.big, big) || other.big == big));
  }

  @override
  int get hashCode => Object.hash(runtimeType, small, regular, big);

  /// Create a copy of AppRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppRadiusImplCopyWith<_$AppRadiusImpl> get copyWith =>
      __$$AppRadiusImplCopyWithImpl<_$AppRadiusImpl>(this, _$identity);
}

abstract class _AppRadius extends AppRadius {
  const factory _AppRadius({required final Radius small, required final Radius regular, required final Radius big}) =
      _$AppRadiusImpl;
  const _AppRadius._() : super._();

  @override
  Radius get small;
  @override
  Radius get regular;
  @override
  Radius get big;

  /// Create a copy of AppRadius
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppRadiusImplCopyWith<_$AppRadiusImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppBorderRadius {
  AppRadius get radius => throw _privateConstructorUsedError;

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppBorderRadiusCopyWith<AppBorderRadius> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBorderRadiusCopyWith<$Res> {
  factory $AppBorderRadiusCopyWith(AppBorderRadius value, $Res Function(AppBorderRadius) then) =
      _$AppBorderRadiusCopyWithImpl<$Res, AppBorderRadius>;
  @useResult
  $Res call({AppRadius radius});

  $AppRadiusCopyWith<$Res> get radius;
}

/// @nodoc
class _$AppBorderRadiusCopyWithImpl<$Res, $Val extends AppBorderRadius> implements $AppBorderRadiusCopyWith<$Res> {
  _$AppBorderRadiusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? radius = null}) {
    return _then(
      _value.copyWith(
            radius:
                null == radius
                    ? _value.radius
                    : radius // ignore: cast_nullable_to_non_nullable
                        as AppRadius,
          )
          as $Val,
    );
  }

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppRadiusCopyWith<$Res> get radius {
    return $AppRadiusCopyWith<$Res>(_value.radius, (value) {
      return _then(_value.copyWith(radius: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppBorderRadiusImplCopyWith<$Res> implements $AppBorderRadiusCopyWith<$Res> {
  factory _$$AppBorderRadiusImplCopyWith(_$AppBorderRadiusImpl value, $Res Function(_$AppBorderRadiusImpl) then) =
      __$$AppBorderRadiusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppRadius radius});

  @override
  $AppRadiusCopyWith<$Res> get radius;
}

/// @nodoc
class __$$AppBorderRadiusImplCopyWithImpl<$Res> extends _$AppBorderRadiusCopyWithImpl<$Res, _$AppBorderRadiusImpl>
    implements _$$AppBorderRadiusImplCopyWith<$Res> {
  __$$AppBorderRadiusImplCopyWithImpl(_$AppBorderRadiusImpl _value, $Res Function(_$AppBorderRadiusImpl) _then)
    : super(_value, _then);

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? radius = null}) {
    return _then(
      _$AppBorderRadiusImpl(
        radius:
            null == radius
                ? _value.radius
                : radius // ignore: cast_nullable_to_non_nullable
                    as AppRadius,
      ),
    );
  }
}

/// @nodoc

class _$AppBorderRadiusImpl extends _AppBorderRadius {
  const _$AppBorderRadiusImpl({required this.radius}) : super._();

  @override
  final AppRadius radius;

  @override
  String toString() {
    return 'AppBorderRadius(radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppBorderRadiusImpl &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppBorderRadiusImplCopyWith<_$AppBorderRadiusImpl> get copyWith =>
      __$$AppBorderRadiusImplCopyWithImpl<_$AppBorderRadiusImpl>(this, _$identity);
}

abstract class _AppBorderRadius extends AppBorderRadius {
  const factory _AppBorderRadius({required final AppRadius radius}) = _$AppBorderRadiusImpl;
  const _AppBorderRadius._() : super._();

  @override
  AppRadius get radius;

  /// Create a copy of AppBorderRadius
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppBorderRadiusImplCopyWith<_$AppBorderRadiusImpl> get copyWith => throw _privateConstructorUsedError;
}
