// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsObject _$NewsObjectFromJson(Map<String, dynamic> json) {
  return _NewsObject.fromJson(json);
}

/// @nodoc
mixin _$NewsObject {
  List<News> get news => throw _privateConstructorUsedError;

  /// Serializes this NewsObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsObjectCopyWith<NewsObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsObjectCopyWith<$Res> {
  factory $NewsObjectCopyWith(
          NewsObject value, $Res Function(NewsObject) then) =
      _$NewsObjectCopyWithImpl<$Res, NewsObject>;
  @useResult
  $Res call({List<News> news});
}

/// @nodoc
class _$NewsObjectCopyWithImpl<$Res, $Val extends NewsObject>
    implements $NewsObjectCopyWith<$Res> {
  _$NewsObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsObjectImplCopyWith<$Res>
    implements $NewsObjectCopyWith<$Res> {
  factory _$$NewsObjectImplCopyWith(
          _$NewsObjectImpl value, $Res Function(_$NewsObjectImpl) then) =
      __$$NewsObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<News> news});
}

/// @nodoc
class __$$NewsObjectImplCopyWithImpl<$Res>
    extends _$NewsObjectCopyWithImpl<$Res, _$NewsObjectImpl>
    implements _$$NewsObjectImplCopyWith<$Res> {
  __$$NewsObjectImplCopyWithImpl(
      _$NewsObjectImpl _value, $Res Function(_$NewsObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$NewsObjectImpl(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsObjectImpl extends _NewsObject {
  _$NewsObjectImpl({required final List<News> news})
      : _news = news,
        super._();

  factory _$NewsObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsObjectImplFromJson(json);

  final List<News> _news;
  @override
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsObject(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsObjectImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  /// Create a copy of NewsObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsObjectImplCopyWith<_$NewsObjectImpl> get copyWith =>
      __$$NewsObjectImplCopyWithImpl<_$NewsObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsObjectImplToJson(
      this,
    );
  }
}

abstract class _NewsObject extends NewsObject {
  factory _NewsObject({required final List<News> news}) = _$NewsObjectImpl;
  _NewsObject._() : super._();

  factory _NewsObject.fromJson(Map<String, dynamic> json) =
      _$NewsObjectImpl.fromJson;

  @override
  List<News> get news;

  /// Create a copy of NewsObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsObjectImplCopyWith<_$NewsObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
