// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_offering.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoOffering {
  String get id => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  DateTime get dateRecommendated => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  Offering get offering => throw _privateConstructorUsedError;

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoOfferingCopyWith<TodoOffering> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoOfferingCopyWith<$Res> {
  factory $TodoOfferingCopyWith(
    TodoOffering value,
    $Res Function(TodoOffering) then,
  ) = _$TodoOfferingCopyWithImpl<$Res, TodoOffering>;
  @useResult
  $Res call({
    String id,
    Status status,
    DateTime dateRecommendated,
    DateTime? lastUpdated,
    Offering offering,
  });

  $OfferingCopyWith<$Res> get offering;
}

/// @nodoc
class _$TodoOfferingCopyWithImpl<$Res, $Val extends TodoOffering>
    implements $TodoOfferingCopyWith<$Res> {
  _$TodoOfferingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? dateRecommendated = null,
    Object? lastUpdated = freezed,
    Object? offering = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as Status,
            dateRecommendated:
                null == dateRecommendated
                    ? _value.dateRecommendated
                    : dateRecommendated // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            lastUpdated:
                freezed == lastUpdated
                    ? _value.lastUpdated
                    : lastUpdated // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            offering:
                null == offering
                    ? _value.offering
                    : offering // ignore: cast_nullable_to_non_nullable
                        as Offering,
          )
          as $Val,
    );
  }

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferingCopyWith<$Res> get offering {
    return $OfferingCopyWith<$Res>(_value.offering, (value) {
      return _then(_value.copyWith(offering: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoOfferingImplCopyWith<$Res>
    implements $TodoOfferingCopyWith<$Res> {
  factory _$$TodoOfferingImplCopyWith(
    _$TodoOfferingImpl value,
    $Res Function(_$TodoOfferingImpl) then,
  ) = __$$TodoOfferingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Status status,
    DateTime dateRecommendated,
    DateTime? lastUpdated,
    Offering offering,
  });

  @override
  $OfferingCopyWith<$Res> get offering;
}

/// @nodoc
class __$$TodoOfferingImplCopyWithImpl<$Res>
    extends _$TodoOfferingCopyWithImpl<$Res, _$TodoOfferingImpl>
    implements _$$TodoOfferingImplCopyWith<$Res> {
  __$$TodoOfferingImplCopyWithImpl(
    _$TodoOfferingImpl _value,
    $Res Function(_$TodoOfferingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? dateRecommendated = null,
    Object? lastUpdated = freezed,
    Object? offering = null,
  }) {
    return _then(
      _$TodoOfferingImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as Status,
        dateRecommendated:
            null == dateRecommendated
                ? _value.dateRecommendated
                : dateRecommendated // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        lastUpdated:
            freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        offering:
            null == offering
                ? _value.offering
                : offering // ignore: cast_nullable_to_non_nullable
                    as Offering,
      ),
    );
  }
}

/// @nodoc

class _$TodoOfferingImpl implements _TodoOffering {
  const _$TodoOfferingImpl({
    required this.id,
    required this.status,
    required this.dateRecommendated,
    this.lastUpdated,
    required this.offering,
  });

  @override
  final String id;
  @override
  final Status status;
  @override
  final DateTime dateRecommendated;
  @override
  final DateTime? lastUpdated;
  @override
  final Offering offering;

  @override
  String toString() {
    return 'TodoOffering(id: $id, status: $status, dateRecommendated: $dateRecommendated, lastUpdated: $lastUpdated, offering: $offering)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoOfferingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dateRecommendated, dateRecommendated) ||
                other.dateRecommendated == dateRecommendated) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.offering, offering) ||
                other.offering == offering));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    dateRecommendated,
    lastUpdated,
    offering,
  );

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoOfferingImplCopyWith<_$TodoOfferingImpl> get copyWith =>
      __$$TodoOfferingImplCopyWithImpl<_$TodoOfferingImpl>(this, _$identity);
}

abstract class _TodoOffering implements TodoOffering {
  const factory _TodoOffering({
    required final String id,
    required final Status status,
    required final DateTime dateRecommendated,
    final DateTime? lastUpdated,
    required final Offering offering,
  }) = _$TodoOfferingImpl;

  @override
  String get id;
  @override
  Status get status;
  @override
  DateTime get dateRecommendated;
  @override
  DateTime? get lastUpdated;
  @override
  Offering get offering;

  /// Create a copy of TodoOffering
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoOfferingImplCopyWith<_$TodoOfferingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
