// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoTask _$TodoTaskFromJson(Map<String, dynamic> json) {
  return _TodoTask.fromJson(json);
}

/// @nodoc
mixin _$TodoTask {
  Offering? get offering => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this TodoTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoTaskCopyWith<TodoTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoTaskCopyWith<$Res> {
  factory $TodoTaskCopyWith(TodoTask value, $Res Function(TodoTask) then) =
      _$TodoTaskCopyWithImpl<$Res, TodoTask>;
  @useResult
  $Res call({Offering? offering, bool? isCompleted});

  $OfferingCopyWith<$Res>? get offering;
}

/// @nodoc
class _$TodoTaskCopyWithImpl<$Res, $Val extends TodoTask>
    implements $TodoTaskCopyWith<$Res> {
  _$TodoTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offering = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      offering: freezed == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as Offering?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfferingCopyWith<$Res>? get offering {
    if (_value.offering == null) {
      return null;
    }

    return $OfferingCopyWith<$Res>(_value.offering!, (value) {
      return _then(_value.copyWith(offering: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodoTaskImplCopyWith<$Res>
    implements $TodoTaskCopyWith<$Res> {
  factory _$$TodoTaskImplCopyWith(
          _$TodoTaskImpl value, $Res Function(_$TodoTaskImpl) then) =
      __$$TodoTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Offering? offering, bool? isCompleted});

  @override
  $OfferingCopyWith<$Res>? get offering;
}

/// @nodoc
class __$$TodoTaskImplCopyWithImpl<$Res>
    extends _$TodoTaskCopyWithImpl<$Res, _$TodoTaskImpl>
    implements _$$TodoTaskImplCopyWith<$Res> {
  __$$TodoTaskImplCopyWithImpl(
      _$TodoTaskImpl _value, $Res Function(_$TodoTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offering = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$TodoTaskImpl(
      offering: freezed == offering
          ? _value.offering
          : offering // ignore: cast_nullable_to_non_nullable
              as Offering?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoTaskImpl implements _TodoTask {
  _$TodoTaskImpl({this.offering, this.isCompleted = false});

  factory _$TodoTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoTaskImplFromJson(json);

  @override
  final Offering? offering;
  @override
  @JsonKey()
  final bool? isCompleted;

  @override
  String toString() {
    return 'TodoTask(offering: $offering, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoTaskImpl &&
            (identical(other.offering, offering) ||
                other.offering == offering) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, offering, isCompleted);

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoTaskImplCopyWith<_$TodoTaskImpl> get copyWith =>
      __$$TodoTaskImplCopyWithImpl<_$TodoTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoTaskImplToJson(
      this,
    );
  }
}

abstract class _TodoTask implements TodoTask {
  factory _TodoTask({final Offering? offering, final bool? isCompleted}) =
      _$TodoTaskImpl;

  factory _TodoTask.fromJson(Map<String, dynamic> json) =
      _$TodoTaskImpl.fromJson;

  @override
  Offering? get offering;
  @override
  bool? get isCompleted;

  /// Create a copy of TodoTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoTaskImplCopyWith<_$TodoTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
