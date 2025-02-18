// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choices.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Choices _$ChoicesFromJson(Map<String, dynamic> json) {
  return _Choices.fromJson(json);
}

/// @nodoc
mixin _$Choices {
  List<String> get citations => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;

  /// Serializes this Choices to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Choices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChoicesCopyWith<Choices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoicesCopyWith<$Res> {
  factory $ChoicesCopyWith(Choices value, $Res Function(Choices) then) = _$ChoicesCopyWithImpl<$Res, Choices>;
  @useResult
  $Res call({List<String> citations, List<Choice> choices});
}

/// @nodoc
class _$ChoicesCopyWithImpl<$Res, $Val extends Choices> implements $ChoicesCopyWith<$Res> {
  _$ChoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Choices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? citations = null, Object? choices = null}) {
    return _then(
      _value.copyWith(
            citations:
                null == citations
                    ? _value.citations
                    : citations // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            choices:
                null == choices
                    ? _value.choices
                    : choices // ignore: cast_nullable_to_non_nullable
                        as List<Choice>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChoicesImplCopyWith<$Res> implements $ChoicesCopyWith<$Res> {
  factory _$$ChoicesImplCopyWith(_$ChoicesImpl value, $Res Function(_$ChoicesImpl) then) =
      __$$ChoicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> citations, List<Choice> choices});
}

/// @nodoc
class __$$ChoicesImplCopyWithImpl<$Res> extends _$ChoicesCopyWithImpl<$Res, _$ChoicesImpl>
    implements _$$ChoicesImplCopyWith<$Res> {
  __$$ChoicesImplCopyWithImpl(_$ChoicesImpl _value, $Res Function(_$ChoicesImpl) _then) : super(_value, _then);

  /// Create a copy of Choices
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? citations = null, Object? choices = null}) {
    return _then(
      _$ChoicesImpl(
        citations:
            null == citations
                ? _value._citations
                : citations // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        choices:
            null == choices
                ? _value._choices
                : choices // ignore: cast_nullable_to_non_nullable
                    as List<Choice>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoicesImpl implements _Choices {
  const _$ChoicesImpl({required final List<String> citations, required final List<Choice> choices})
    : _citations = citations,
      _choices = choices;

  factory _$ChoicesImpl.fromJson(Map<String, dynamic> json) => _$$ChoicesImplFromJson(json);

  final List<String> _citations;
  @override
  List<String> get citations {
    if (_citations is EqualUnmodifiableListView) return _citations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_citations);
  }

  final List<Choice> _choices;
  @override
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'Choices(citations: $citations, choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoicesImpl &&
            const DeepCollectionEquality().equals(other._citations, _citations) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_citations),
    const DeepCollectionEquality().hash(_choices),
  );

  /// Create a copy of Choices
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoicesImplCopyWith<_$ChoicesImpl> get copyWith => __$$ChoicesImplCopyWithImpl<_$ChoicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoicesImplToJson(this);
  }
}

abstract class _Choices implements Choices {
  const factory _Choices({required final List<String> citations, required final List<Choice> choices}) = _$ChoicesImpl;

  factory _Choices.fromJson(Map<String, dynamic> json) = _$ChoicesImpl.fromJson;

  @override
  List<String> get citations;
  @override
  List<Choice> get choices;

  /// Create a copy of Choices
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChoicesImplCopyWith<_$ChoicesImpl> get copyWith => throw _privateConstructorUsedError;
}
