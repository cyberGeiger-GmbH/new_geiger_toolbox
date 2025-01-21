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
  List<ScoreReason> get reasons => throw _privateConstructorUsedError;

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
  $Res call(
      {int id,
      int geigerScore,
      DateTime lastUpdate,
      List<ScoreReason> reasons});
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
    Object? reasons = null,
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
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<ScoreReason>,
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
  $Res call(
      {int id,
      int geigerScore,
      DateTime lastUpdate,
      List<ScoreReason> reasons});
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
    Object? reasons = null,
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
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<ScoreReason>,
    ));
  }
}

/// @nodoc

class _$GeigerScoreInfoImpl implements _GeigerScoreInfo {
  const _$GeigerScoreInfoImpl(
      {required this.id,
      required this.geigerScore,
      required this.lastUpdate,
      required final List<ScoreReason> reasons})
      : _reasons = reasons;

  @override
  final int id;
  @override
  final int geigerScore;
  @override
  final DateTime lastUpdate;
  final List<ScoreReason> _reasons;
  @override
  List<ScoreReason> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  String toString() {
    return 'GeigerScoreInfo(id: $id, geigerScore: $geigerScore, lastUpdate: $lastUpdate, reasons: $reasons)';
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
            const DeepCollectionEquality().equals(other._reasons, _reasons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, geigerScore, lastUpdate,
      const DeepCollectionEquality().hash(_reasons));

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
      required final List<ScoreReason> reasons}) = _$GeigerScoreInfoImpl;

  @override
  int get id;
  @override
  int get geigerScore;
  @override
  DateTime get lastUpdate;
  @override
  List<ScoreReason> get reasons;

  /// Create a copy of GeigerScoreInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeigerScoreInfoImplCopyWith<_$GeigerScoreInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScoreReason {
  int get scoreId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of ScoreReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreReasonCopyWith<ScoreReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreReasonCopyWith<$Res> {
  factory $ScoreReasonCopyWith(
          ScoreReason value, $Res Function(ScoreReason) then) =
      _$ScoreReasonCopyWithImpl<$Res, ScoreReason>;
  @useResult
  $Res call({int scoreId, String name});
}

/// @nodoc
class _$ScoreReasonCopyWithImpl<$Res, $Val extends ScoreReason>
    implements $ScoreReasonCopyWith<$Res> {
  _$ScoreReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      scoreId: null == scoreId
          ? _value.scoreId
          : scoreId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreReasonImplCopyWith<$Res>
    implements $ScoreReasonCopyWith<$Res> {
  factory _$$ScoreReasonImplCopyWith(
          _$ScoreReasonImpl value, $Res Function(_$ScoreReasonImpl) then) =
      __$$ScoreReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int scoreId, String name});
}

/// @nodoc
class __$$ScoreReasonImplCopyWithImpl<$Res>
    extends _$ScoreReasonCopyWithImpl<$Res, _$ScoreReasonImpl>
    implements _$$ScoreReasonImplCopyWith<$Res> {
  __$$ScoreReasonImplCopyWithImpl(
      _$ScoreReasonImpl _value, $Res Function(_$ScoreReasonImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreReason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scoreId = null,
    Object? name = null,
  }) {
    return _then(_$ScoreReasonImpl(
      scoreId: null == scoreId
          ? _value.scoreId
          : scoreId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScoreReasonImpl implements _ScoreReason {
  const _$ScoreReasonImpl({required this.scoreId, required this.name});

  @override
  final int scoreId;
  @override
  final String name;

  @override
  String toString() {
    return 'ScoreReason(scoreId: $scoreId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreReasonImpl &&
            (identical(other.scoreId, scoreId) || other.scoreId == scoreId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scoreId, name);

  /// Create a copy of ScoreReason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreReasonImplCopyWith<_$ScoreReasonImpl> get copyWith =>
      __$$ScoreReasonImplCopyWithImpl<_$ScoreReasonImpl>(this, _$identity);
}

abstract class _ScoreReason implements ScoreReason {
  const factory _ScoreReason(
      {required final int scoreId,
      required final String name}) = _$ScoreReasonImpl;

  @override
  int get scoreId;
  @override
  String get name;

  /// Create a copy of ScoreReason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreReasonImplCopyWith<_$ScoreReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
