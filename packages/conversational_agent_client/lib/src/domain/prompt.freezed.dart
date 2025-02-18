// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Prompt _$PromptFromJson(Map<String, dynamic> json) {
  return _Prompt.fromJson(json);
}

/// @nodoc
mixin _$Prompt {
  String get userID => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get userMessage => throw _privateConstructorUsedError;
  String? get assistantName => throw _privateConstructorUsedError;

  /// Serializes this Prompt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptCopyWith<Prompt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptCopyWith<$Res> {
  factory $PromptCopyWith(Prompt value, $Res Function(Prompt) then) = _$PromptCopyWithImpl<$Res, Prompt>;
  @useResult
  $Res call({String userID, String origin, String userMessage, String? assistantName});
}

/// @nodoc
class _$PromptCopyWithImpl<$Res, $Val extends Prompt> implements $PromptCopyWith<$Res> {
  _$PromptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? origin = null,
    Object? userMessage = null,
    Object? assistantName = freezed,
  }) {
    return _then(
      _value.copyWith(
            userID:
                null == userID
                    ? _value.userID
                    : userID // ignore: cast_nullable_to_non_nullable
                        as String,
            origin:
                null == origin
                    ? _value.origin
                    : origin // ignore: cast_nullable_to_non_nullable
                        as String,
            userMessage:
                null == userMessage
                    ? _value.userMessage
                    : userMessage // ignore: cast_nullable_to_non_nullable
                        as String,
            assistantName:
                freezed == assistantName
                    ? _value.assistantName
                    : assistantName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromptImplCopyWith<$Res> implements $PromptCopyWith<$Res> {
  factory _$$PromptImplCopyWith(_$PromptImpl value, $Res Function(_$PromptImpl) then) =
      __$$PromptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID, String origin, String userMessage, String? assistantName});
}

/// @nodoc
class __$$PromptImplCopyWithImpl<$Res> extends _$PromptCopyWithImpl<$Res, _$PromptImpl>
    implements _$$PromptImplCopyWith<$Res> {
  __$$PromptImplCopyWithImpl(_$PromptImpl _value, $Res Function(_$PromptImpl) _then) : super(_value, _then);

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? origin = null,
    Object? userMessage = null,
    Object? assistantName = freezed,
  }) {
    return _then(
      _$PromptImpl(
        userID:
            null == userID
                ? _value.userID
                : userID // ignore: cast_nullable_to_non_nullable
                    as String,
        origin:
            null == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                    as String,
        userMessage:
            null == userMessage
                ? _value.userMessage
                : userMessage // ignore: cast_nullable_to_non_nullable
                    as String,
        assistantName:
            freezed == assistantName
                ? _value.assistantName
                : assistantName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptImpl implements _Prompt {
  const _$PromptImpl({
    required this.userID,
    required this.origin,
    required this.userMessage,
    this.assistantName = "toolbox_Microskill",
  });

  factory _$PromptImpl.fromJson(Map<String, dynamic> json) => _$$PromptImplFromJson(json);

  @override
  final String userID;
  @override
  final String origin;
  @override
  final String userMessage;
  @override
  @JsonKey()
  final String? assistantName;

  @override
  String toString() {
    return 'Prompt(userID: $userID, origin: $origin, userMessage: $userMessage, assistantName: $assistantName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.userMessage, userMessage) || other.userMessage == userMessage) &&
            (identical(other.assistantName, assistantName) || other.assistantName == assistantName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userID, origin, userMessage, assistantName);

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith => __$$PromptImplCopyWithImpl<_$PromptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptImplToJson(this);
  }
}

abstract class _Prompt implements Prompt {
  const factory _Prompt({
    required final String userID,
    required final String origin,
    required final String userMessage,
    final String? assistantName,
  }) = _$PromptImpl;

  factory _Prompt.fromJson(Map<String, dynamic> json) = _$PromptImpl.fromJson;

  @override
  String get userID;
  @override
  String get origin;
  @override
  String get userMessage;
  @override
  String? get assistantName;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith => throw _privateConstructorUsedError;
}
