// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserID _$UserIDFromJson(Map<String, dynamic> json) {
  return _UserID.fromJson(json);
}

/// @nodoc
mixin _$UserID {
  String get userID => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;

  /// Serializes this UserID to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserIDCopyWith<UserID> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIDCopyWith<$Res> {
  factory $UserIDCopyWith(UserID value, $Res Function(UserID) then) = _$UserIDCopyWithImpl<$Res, UserID>;
  @useResult
  $Res call({String userID, String? origin});
}

/// @nodoc
class _$UserIDCopyWithImpl<$Res, $Val extends UserID> implements $UserIDCopyWith<$Res> {
  _$UserIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userID = null, Object? origin = freezed}) {
    return _then(
      _value.copyWith(
            userID:
                null == userID
                    ? _value.userID
                    : userID // ignore: cast_nullable_to_non_nullable
                        as String,
            origin:
                freezed == origin
                    ? _value.origin
                    : origin // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserIDImplCopyWith<$Res> implements $UserIDCopyWith<$Res> {
  factory _$$UserIDImplCopyWith(_$UserIDImpl value, $Res Function(_$UserIDImpl) then) =
      __$$UserIDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID, String? origin});
}

/// @nodoc
class __$$UserIDImplCopyWithImpl<$Res> extends _$UserIDCopyWithImpl<$Res, _$UserIDImpl>
    implements _$$UserIDImplCopyWith<$Res> {
  __$$UserIDImplCopyWithImpl(_$UserIDImpl _value, $Res Function(_$UserIDImpl) _then) : super(_value, _then);

  /// Create a copy of UserID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userID = null, Object? origin = freezed}) {
    return _then(
      _$UserIDImpl(
        userID:
            null == userID
                ? _value.userID
                : userID // ignore: cast_nullable_to_non_nullable
                    as String,
        origin:
            freezed == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserIDImpl implements _UserID {
  const _$UserIDImpl({required this.userID, this.origin = "toolbox"});

  factory _$UserIDImpl.fromJson(Map<String, dynamic> json) => _$$UserIDImplFromJson(json);

  @override
  final String userID;
  @override
  @JsonKey()
  final String? origin;

  @override
  String toString() {
    return 'UserID(userID: $userID, origin: $origin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserIDImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.origin, origin) || other.origin == origin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userID, origin);

  /// Create a copy of UserID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserIDImplCopyWith<_$UserIDImpl> get copyWith => __$$UserIDImplCopyWithImpl<_$UserIDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserIDImplToJson(this);
  }
}

abstract class _UserID implements UserID {
  const factory _UserID({required final String userID, final String? origin}) = _$UserIDImpl;

  factory _UserID.fromJson(Map<String, dynamic> json) = _$UserIDImpl.fromJson;

  @override
  String get userID;
  @override
  String? get origin;

  /// Create a copy of UserID
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserIDImplCopyWith<_$UserIDImpl> get copyWith => throw _privateConstructorUsedError;
}
