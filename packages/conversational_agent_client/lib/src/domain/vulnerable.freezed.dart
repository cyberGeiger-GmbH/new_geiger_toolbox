// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vulnerable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vulnerable _$VulnerableFromJson(Map<String, dynamic> json) {
  return _Vulnerable.fromJson(json);
}

/// @nodoc
mixin _$Vulnerable {
  String get name => throw _privateConstructorUsedError;
  String get effect => throw _privateConstructorUsedError;

  /// Serializes this Vulnerable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vulnerable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VulnerableCopyWith<Vulnerable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VulnerableCopyWith<$Res> {
  factory $VulnerableCopyWith(
          Vulnerable value, $Res Function(Vulnerable) then) =
      _$VulnerableCopyWithImpl<$Res, Vulnerable>;
  @useResult
  $Res call({String name, String effect});
}

/// @nodoc
class _$VulnerableCopyWithImpl<$Res, $Val extends Vulnerable>
    implements $VulnerableCopyWith<$Res> {
  _$VulnerableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vulnerable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? effect = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VulnerableImplCopyWith<$Res>
    implements $VulnerableCopyWith<$Res> {
  factory _$$VulnerableImplCopyWith(
          _$VulnerableImpl value, $Res Function(_$VulnerableImpl) then) =
      __$$VulnerableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String effect});
}

/// @nodoc
class __$$VulnerableImplCopyWithImpl<$Res>
    extends _$VulnerableCopyWithImpl<$Res, _$VulnerableImpl>
    implements _$$VulnerableImplCopyWith<$Res> {
  __$$VulnerableImplCopyWithImpl(
      _$VulnerableImpl _value, $Res Function(_$VulnerableImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vulnerable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? effect = null,
  }) {
    return _then(_$VulnerableImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VulnerableImpl implements _Vulnerable {
  _$VulnerableImpl({required this.name, required this.effect});

  factory _$VulnerableImpl.fromJson(Map<String, dynamic> json) =>
      _$$VulnerableImplFromJson(json);

  @override
  final String name;
  @override
  final String effect;

  @override
  String toString() {
    return 'Vulnerable(name: $name, effect: $effect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VulnerableImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.effect, effect) || other.effect == effect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, effect);

  /// Create a copy of Vulnerable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VulnerableImplCopyWith<_$VulnerableImpl> get copyWith =>
      __$$VulnerableImplCopyWithImpl<_$VulnerableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VulnerableImplToJson(
      this,
    );
  }
}

abstract class _Vulnerable implements Vulnerable {
  factory _Vulnerable(
      {required final String name,
      required final String effect}) = _$VulnerableImpl;

  factory _Vulnerable.fromJson(Map<String, dynamic> json) =
      _$VulnerableImpl.fromJson;

  @override
  String get name;
  @override
  String get effect;

  /// Create a copy of Vulnerable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VulnerableImplCopyWith<_$VulnerableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
