// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsFeed {
  @HiveField(0)
  News get news => throw _privateConstructorUsedError;

  /// Create a copy of NewsFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsFeedCopyWith<NewsFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFeedCopyWith<$Res> {
  factory $NewsFeedCopyWith(NewsFeed value, $Res Function(NewsFeed) then) =
      _$NewsFeedCopyWithImpl<$Res, NewsFeed>;
  @useResult
  $Res call({@HiveField(0) News news});

  $NewsCopyWith<$Res> get news;
}

/// @nodoc
class _$NewsFeedCopyWithImpl<$Res, $Val extends NewsFeed>
    implements $NewsFeedCopyWith<$Res> {
  _$NewsFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsFeed
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
              as News,
    ) as $Val);
  }

  /// Create a copy of NewsFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsCopyWith<$Res> get news {
    return $NewsCopyWith<$Res>(_value.news, (value) {
      return _then(_value.copyWith(news: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsFeedImplCopyWith<$Res>
    implements $NewsFeedCopyWith<$Res> {
  factory _$$NewsFeedImplCopyWith(
          _$NewsFeedImpl value, $Res Function(_$NewsFeedImpl) then) =
      __$$NewsFeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) News news});

  @override
  $NewsCopyWith<$Res> get news;
}

/// @nodoc
class __$$NewsFeedImplCopyWithImpl<$Res>
    extends _$NewsFeedCopyWithImpl<$Res, _$NewsFeedImpl>
    implements _$$NewsFeedImplCopyWith<$Res> {
  __$$NewsFeedImplCopyWithImpl(
      _$NewsFeedImpl _value, $Res Function(_$NewsFeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$NewsFeedImpl(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as News,
    ));
  }
}

/// @nodoc

class _$NewsFeedImpl implements _NewsFeed {
  const _$NewsFeedImpl({@HiveField(0) required this.news});

  @override
  @HiveField(0)
  final News news;

  @override
  String toString() {
    return 'NewsFeed(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsFeedImpl &&
            (identical(other.news, news) || other.news == news));
  }

  @override
  int get hashCode => Object.hash(runtimeType, news);

  /// Create a copy of NewsFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsFeedImplCopyWith<_$NewsFeedImpl> get copyWith =>
      __$$NewsFeedImplCopyWithImpl<_$NewsFeedImpl>(this, _$identity);
}

abstract class _NewsFeed implements NewsFeed {
  const factory _NewsFeed({@HiveField(0) required final News news}) =
      _$NewsFeedImpl;

  @override
  @HiveField(0)
  News get news;

  /// Create a copy of NewsFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsFeedImplCopyWith<_$NewsFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
