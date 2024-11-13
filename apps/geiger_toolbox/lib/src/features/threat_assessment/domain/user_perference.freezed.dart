// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_perference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserPerference {
  @HiveField(0)
  bool get termsAndConditions => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get initialScan => throw _privateConstructorUsedError;

  /// Create a copy of UserPerference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPerferenceCopyWith<UserPerference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPerferenceCopyWith<$Res> {
  factory $UserPerferenceCopyWith(
          UserPerference value, $Res Function(UserPerference) then) =
      _$UserPerferenceCopyWithImpl<$Res, UserPerference>;
  @useResult
  $Res call(
      {@HiveField(0) bool termsAndConditions, @HiveField(1) bool initialScan});
}

/// @nodoc
class _$UserPerferenceCopyWithImpl<$Res, $Val extends UserPerference>
    implements $UserPerferenceCopyWith<$Res> {
  _$UserPerferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPerference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = null,
    Object? initialScan = null,
  }) {
    return _then(_value.copyWith(
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      initialScan: null == initialScan
          ? _value.initialScan
          : initialScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPerferenceImplCopyWith<$Res>
    implements $UserPerferenceCopyWith<$Res> {
  factory _$$UserPerferenceImplCopyWith(_$UserPerferenceImpl value,
          $Res Function(_$UserPerferenceImpl) then) =
      __$$UserPerferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool termsAndConditions, @HiveField(1) bool initialScan});
}

/// @nodoc
class __$$UserPerferenceImplCopyWithImpl<$Res>
    extends _$UserPerferenceCopyWithImpl<$Res, _$UserPerferenceImpl>
    implements _$$UserPerferenceImplCopyWith<$Res> {
  __$$UserPerferenceImplCopyWithImpl(
      _$UserPerferenceImpl _value, $Res Function(_$UserPerferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPerference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsAndConditions = null,
    Object? initialScan = null,
  }) {
    return _then(_$UserPerferenceImpl(
      termsAndConditions: null == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as bool,
      initialScan: null == initialScan
          ? _value.initialScan
          : initialScan // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserPerferenceImpl implements _UserPerference {
  const _$UserPerferenceImpl(
      {@HiveField(0) this.termsAndConditions = false,
      @HiveField(1) this.initialScan = false});

  @override
  @JsonKey()
  @HiveField(0)
  final bool termsAndConditions;
  @override
  @JsonKey()
  @HiveField(1)
  final bool initialScan;

  @override
  String toString() {
    return 'UserPerference(termsAndConditions: $termsAndConditions, initialScan: $initialScan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPerferenceImpl &&
            (identical(other.termsAndConditions, termsAndConditions) ||
                other.termsAndConditions == termsAndConditions) &&
            (identical(other.initialScan, initialScan) ||
                other.initialScan == initialScan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, termsAndConditions, initialScan);

  /// Create a copy of UserPerference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPerferenceImplCopyWith<_$UserPerferenceImpl> get copyWith =>
      __$$UserPerferenceImplCopyWithImpl<_$UserPerferenceImpl>(
          this, _$identity);
}

abstract class _UserPerference implements UserPerference {
  const factory _UserPerference(
      {@HiveField(0) final bool termsAndConditions,
      @HiveField(1) final bool initialScan}) = _$UserPerferenceImpl;

  @override
  @HiveField(0)
  bool get termsAndConditions;
  @override
  @HiveField(1)
  bool get initialScan;

  /// Create a copy of UserPerference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPerferenceImplCopyWith<_$UserPerferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
