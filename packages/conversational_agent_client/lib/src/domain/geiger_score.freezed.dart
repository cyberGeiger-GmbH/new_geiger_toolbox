// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geiger_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeigerScore _$GeigerScoreFromJson(Map<String, dynamic> json) {
  return _GeigerScore.fromJson(json);
}

/// @nodoc
mixin _$GeigerScore {
  int get geigerScore => throw _privateConstructorUsedError;
  List<String> get reasons => throw _privateConstructorUsedError;

  /// Serializes this GeigerScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeigerScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeigerScoreCopyWith<GeigerScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeigerScoreCopyWith<$Res> {
  factory $GeigerScoreCopyWith(
          GeigerScore value, $Res Function(GeigerScore) then) =
      _$GeigerScoreCopyWithImpl<$Res, GeigerScore>;
  @useResult
  $Res call({int geigerScore, List<String> reasons});
}

/// @nodoc
class _$GeigerScoreCopyWithImpl<$Res, $Val extends GeigerScore>
    implements $GeigerScoreCopyWith<$Res> {
  _$GeigerScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeigerScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geigerScore = null,
    Object? reasons = null,
  }) {
    return _then(_value.copyWith(
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as int,
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeigerScoreImplCopyWith<$Res>
    implements $GeigerScoreCopyWith<$Res> {
  factory _$$GeigerScoreImplCopyWith(
          _$GeigerScoreImpl value, $Res Function(_$GeigerScoreImpl) then) =
      __$$GeigerScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int geigerScore, List<String> reasons});
}

/// @nodoc
class __$$GeigerScoreImplCopyWithImpl<$Res>
    extends _$GeigerScoreCopyWithImpl<$Res, _$GeigerScoreImpl>
    implements _$$GeigerScoreImplCopyWith<$Res> {
  __$$GeigerScoreImplCopyWithImpl(
      _$GeigerScoreImpl _value, $Res Function(_$GeigerScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeigerScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geigerScore = null,
    Object? reasons = null,
  }) {
    return _then(_$GeigerScoreImpl(
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as int,
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeigerScoreImpl implements _GeigerScore {
  const _$GeigerScoreImpl(
      {required this.geigerScore, required final List<String> reasons})
      : _reasons = reasons;

  factory _$GeigerScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeigerScoreImplFromJson(json);

  @override
  final int geigerScore;
  final List<String> _reasons;
  @override
  List<String> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  String toString() {
    return 'GeigerScore(geigerScore: $geigerScore, reasons: $reasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeigerScoreImpl &&
            (identical(other.geigerScore, geigerScore) ||
                other.geigerScore == geigerScore) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, geigerScore, const DeepCollectionEquality().hash(_reasons));

  /// Create a copy of GeigerScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeigerScoreImplCopyWith<_$GeigerScoreImpl> get copyWith =>
      __$$GeigerScoreImplCopyWithImpl<_$GeigerScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeigerScoreImplToJson(
      this,
    );
  }
}

abstract class _GeigerScore implements GeigerScore {
  const factory _GeigerScore(
      {required final int geigerScore,
      required final List<String> reasons}) = _$GeigerScoreImpl;

  factory _GeigerScore.fromJson(Map<String, dynamic> json) =
      _$GeigerScoreImpl.fromJson;

  @override
  int get geigerScore;
  @override
  List<String> get reasons;

  /// Create a copy of GeigerScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeigerScoreImplCopyWith<_$GeigerScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
