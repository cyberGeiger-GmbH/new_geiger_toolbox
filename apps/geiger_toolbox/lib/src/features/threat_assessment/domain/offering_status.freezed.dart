// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offering_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OfferingStatus {
  String get id => throw _privateConstructorUsedError;
  Offering get offering => throw _privateConstructorUsedError;
  bool? get added => throw _privateConstructorUsedError;

  /// Create a copy of OfferingStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferingStatusCopyWith<OfferingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferingStatusCopyWith<$Res> {
  factory $OfferingStatusCopyWith(
          OfferingStatus value, $Res Function(OfferingStatus) then) =
      _$OfferingStatusCopyWithImpl<$Res, OfferingStatus>;
  @useResult
  $Res call({String id, Offering offering, bool? added});

  $OfferingCopyWith<$Res> get offering;
}

/// @nodoc
class _$OfferingStatusCopyWithImpl<$Res, $Val extends OfferingStatus>
    implements $OfferingStatusCopyWith<$Res> {
  _$OfferingStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferingStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offering = null,
    Object? added = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offering: null == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as Offering,
      added: freezed == added
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of OfferingStatus
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
abstract class _$$OfferingStatusImplCopyWith<$Res>
    implements $OfferingStatusCopyWith<$Res> {
  factory _$$OfferingStatusImplCopyWith(_$OfferingStatusImpl value,
          $Res Function(_$OfferingStatusImpl) then) =
      __$$OfferingStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Offering offering, bool? added});

  @override
  $OfferingCopyWith<$Res> get offering;
}

/// @nodoc
class __$$OfferingStatusImplCopyWithImpl<$Res>
    extends _$OfferingStatusCopyWithImpl<$Res, _$OfferingStatusImpl>
    implements _$$OfferingStatusImplCopyWith<$Res> {
  __$$OfferingStatusImplCopyWithImpl(
      _$OfferingStatusImpl _value, $Res Function(_$OfferingStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferingStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? offering = null,
    Object? added = freezed,
  }) {
    return _then(_$OfferingStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      offering: null == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as Offering,
      added: freezed == added
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$OfferingStatusImpl implements _OfferingStatus {
  _$OfferingStatusImpl(
      {required this.id, required this.offering, this.added = false});

  @override
  final String id;
  @override
  final Offering offering;
  @override
  @JsonKey()
  final bool? added;

  @override
  String toString() {
    return 'OfferingStatus(id: $id, offering: $offering, added: $added)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferingStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.offering, offering) ||
                other.offering == offering) &&
            (identical(other.added, added) || other.added == added));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, offering, added);

  /// Create a copy of OfferingStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferingStatusImplCopyWith<_$OfferingStatusImpl> get copyWith =>
      __$$OfferingStatusImplCopyWithImpl<_$OfferingStatusImpl>(
          this, _$identity);
}

abstract class _OfferingStatus implements OfferingStatus {
  factory _OfferingStatus(
      {required final String id,
      required final Offering offering,
      final bool? added}) = _$OfferingStatusImpl;

  @override
  String get id;
  @override
  Offering get offering;
  @override
  bool? get added;

  /// Create a copy of OfferingStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferingStatusImplCopyWith<_$OfferingStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
