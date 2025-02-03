// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geiger_score_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeigerScoreInfo {
  int get id => throw _privateConstructorUsedError;
  int get geigerScore => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeigerScoreInfoCopyWith<GeigerScoreInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeigerScoreInfoCopyWith<$Res> {
  factory $GeigerScoreInfoCopyWith(
          GeigerScoreInfo value, $Res Function(GeigerScoreInfo) then) =
      _$GeigerScoreInfoCopyWithImpl<$Res, GeigerScoreInfo>;
  @useResult
  $Res call({int id, int geigerScore, DateTime lastUpdate, String reason});
}

/// @nodoc
class _$GeigerScoreInfoCopyWithImpl<$Res, $Val extends GeigerScoreInfo>
    implements $GeigerScoreInfoCopyWith<$Res> {
  _$GeigerScoreInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? geigerScore = null,
    Object? lastUpdate = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeigerScoreInfoImplCopyWith<$Res>
    implements $GeigerScoreInfoCopyWith<$Res> {
  factory _$$GeigerScoreInfoImplCopyWith(_$GeigerScoreInfoImpl value,
          $Res Function(_$GeigerScoreInfoImpl) then) =
      __$$GeigerScoreInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int geigerScore, DateTime lastUpdate, String reason});
}

/// @nodoc
class __$$GeigerScoreInfoImplCopyWithImpl<$Res>
    extends _$GeigerScoreInfoCopyWithImpl<$Res, _$GeigerScoreInfoImpl>
    implements _$$GeigerScoreInfoImplCopyWith<$Res> {
  __$$GeigerScoreInfoImplCopyWithImpl(
      _$GeigerScoreInfoImpl _value, $Res Function(_$GeigerScoreInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? geigerScore = null,
    Object? lastUpdate = null,
    Object? reason = null,
  }) {
    return _then(_$GeigerScoreInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeigerScoreInfoImpl implements _GeigerScoreInfo {
  const _$GeigerScoreInfoImpl(
      {required this.id,
      required this.geigerScore,
      required this.lastUpdate,
      required this.reason});

  @override
  final int id;
  @override
  final int geigerScore;
  @override
  final DateTime lastUpdate;
  @override
  final String reason;

  @override
  String toString() {
    return 'GeigerScoreInfo(id: $id, geigerScore: $geigerScore, lastUpdate: $lastUpdate, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeigerScoreInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.geigerScore, geigerScore) ||
                other.geigerScore == geigerScore) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, geigerScore, lastUpdate, reason);

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeigerScoreInfoImplCopyWith<_$GeigerScoreInfoImpl> get copyWith =>
      __$$GeigerScoreInfoImplCopyWithImpl<_$GeigerScoreInfoImpl>(
          this, _$identity);
}

abstract class _GeigerScoreInfo implements GeigerScoreInfo {
  const factory _GeigerScoreInfo(
      {required final int id,
      required final int geigerScore,
      required final DateTime lastUpdate,
      required final String reason}) = _$GeigerScoreInfoImpl;

  @override
  int get id;
  @override
  int get geigerScore;
  @override
  DateTime get lastUpdate;
  @override
  String get reason;

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeigerScoreInfoImplCopyWith<_$GeigerScoreInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
