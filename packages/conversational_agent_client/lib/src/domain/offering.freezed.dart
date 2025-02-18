// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offering.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Offering _$OfferingFromJson(Map<String, dynamic> json) {
  return _Offering.fromJson(json);
}

/// @nodoc
mixin _$Offering {
  String get name => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this Offering to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Offering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferingCopyWith<Offering> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferingCopyWith<$Res> {
  factory $OfferingCopyWith(Offering value, $Res Function(Offering) then) = _$OfferingCopyWithImpl<$Res, Offering>;
  @useResult
  $Res call({String name, String summary});
}

/// @nodoc
class _$OfferingCopyWithImpl<$Res, $Val extends Offering> implements $OfferingCopyWith<$Res> {
  _$OfferingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Offering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? summary = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            summary:
                null == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfferingImplCopyWith<$Res> implements $OfferingCopyWith<$Res> {
  factory _$$OfferingImplCopyWith(_$OfferingImpl value, $Res Function(_$OfferingImpl) then) =
      __$$OfferingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String summary});
}

/// @nodoc
class __$$OfferingImplCopyWithImpl<$Res> extends _$OfferingCopyWithImpl<$Res, _$OfferingImpl>
    implements _$$OfferingImplCopyWith<$Res> {
  __$$OfferingImplCopyWithImpl(_$OfferingImpl _value, $Res Function(_$OfferingImpl) _then) : super(_value, _then);

  /// Create a copy of Offering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? summary = null}) {
    return _then(
      _$OfferingImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        summary:
            null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferingImpl implements _Offering {
  _$OfferingImpl({required this.name, required this.summary});

  factory _$OfferingImpl.fromJson(Map<String, dynamic> json) => _$$OfferingImplFromJson(json);

  @override
  final String name;
  @override
  final String summary;

  @override
  String toString() {
    return 'Offering(name: $name, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, summary);

  /// Create a copy of Offering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferingImplCopyWith<_$OfferingImpl> get copyWith =>
      __$$OfferingImplCopyWithImpl<_$OfferingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferingImplToJson(this);
  }
}

abstract class _Offering implements Offering {
  factory _Offering({required final String name, required final String summary}) = _$OfferingImpl;

  factory _Offering.fromJson(Map<String, dynamic> json) = _$OfferingImpl.fromJson;

  @override
  String get name;
  @override
  String get summary;

  /// Create a copy of Offering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferingImplCopyWith<_$OfferingImpl> get copyWith => throw _privateConstructorUsedError;
}
