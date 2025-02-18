// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Text _$TextFromJson(Map<String, dynamic> json) {
  return _Text.fromJson(json);
}

/// @nodoc
mixin _$Text {
  Value get value => throw _privateConstructorUsedError;

  /// Serializes this Text to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextCopyWith<Text> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextCopyWith<$Res> {
  factory $TextCopyWith(Text value, $Res Function(Text) then) = _$TextCopyWithImpl<$Res, Text>;
  @useResult
  $Res call({Value value});

  $ValueCopyWith<$Res> get value;
}

/// @nodoc
class _$TextCopyWithImpl<$Res, $Val extends Text> implements $TextCopyWith<$Res> {
  _$TextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _value.copyWith(
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as Value,
          )
          as $Val,
    );
  }

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValueCopyWith<$Res> get value {
    return $ValueCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TextImplCopyWith<$Res> implements $TextCopyWith<$Res> {
  factory _$$TextImplCopyWith(_$TextImpl value, $Res Function(_$TextImpl) then) = __$$TextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Value value});

  @override
  $ValueCopyWith<$Res> get value;
}

/// @nodoc
class __$$TextImplCopyWithImpl<$Res> extends _$TextCopyWithImpl<$Res, _$TextImpl> implements _$$TextImplCopyWith<$Res> {
  __$$TextImplCopyWithImpl(_$TextImpl _value, $Res Function(_$TextImpl) _then) : super(_value, _then);

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$TextImpl(
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as Value,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TextImpl implements _Text {
  const _$TextImpl({required this.value});

  factory _$TextImpl.fromJson(Map<String, dynamic> json) => _$$TextImplFromJson(json);

  @override
  final Value value;

  @override
  String toString() {
    return 'Text(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextImplCopyWith<_$TextImpl> get copyWith => __$$TextImplCopyWithImpl<_$TextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextImplToJson(this);
  }
}

abstract class _Text implements Text {
  const factory _Text({required final Value value}) = _$TextImpl;

  factory _Text.fromJson(Map<String, dynamic> json) = _$TextImpl.fromJson;

  @override
  Value get value;

  /// Create a copy of Text
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextImplCopyWith<_$TextImpl> get copyWith => throw _privateConstructorUsedError;
}
