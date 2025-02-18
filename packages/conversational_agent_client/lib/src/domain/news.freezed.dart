// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'news_category')
  String get newsCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_url')
  String get articleUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created')
  String get dateCreated => throw _privateConstructorUsedError;
  List<Recommendation> get recommendations => throw _privateConstructorUsedError;

  /// Serializes this News to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) = _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call({
    String id,
    String title,
    String summary,
    @JsonKey(name: 'news_category') String newsCategory,
    @JsonKey(name: 'article_url') String articleUrl,
    @JsonKey(name: 'image_url') String imageUrl,
    @JsonKey(name: 'date_created') String dateCreated,
    List<Recommendation> recommendations,
  });
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News> implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? newsCategory = null,
    Object? articleUrl = null,
    Object? imageUrl = null,
    Object? dateCreated = null,
    Object? recommendations = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            summary:
                null == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as String,
            newsCategory:
                null == newsCategory
                    ? _value.newsCategory
                    : newsCategory // ignore: cast_nullable_to_non_nullable
                        as String,
            articleUrl:
                null == articleUrl
                    ? _value.articleUrl
                    : articleUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            dateCreated:
                null == dateCreated
                    ? _value.dateCreated
                    : dateCreated // ignore: cast_nullable_to_non_nullable
                        as String,
            recommendations:
                null == recommendations
                    ? _value.recommendations
                    : recommendations // ignore: cast_nullable_to_non_nullable
                        as List<Recommendation>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(_$NewsImpl value, $Res Function(_$NewsImpl) then) = __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String summary,
    @JsonKey(name: 'news_category') String newsCategory,
    @JsonKey(name: 'article_url') String articleUrl,
    @JsonKey(name: 'image_url') String imageUrl,
    @JsonKey(name: 'date_created') String dateCreated,
    List<Recommendation> recommendations,
  });
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res> extends _$NewsCopyWithImpl<$Res, _$NewsImpl> implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then) : super(_value, _then);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? newsCategory = null,
    Object? articleUrl = null,
    Object? imageUrl = null,
    Object? dateCreated = null,
    Object? recommendations = null,
  }) {
    return _then(
      _$NewsImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        summary:
            null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as String,
        newsCategory:
            null == newsCategory
                ? _value.newsCategory
                : newsCategory // ignore: cast_nullable_to_non_nullable
                    as String,
        articleUrl:
            null == articleUrl
                ? _value.articleUrl
                : articleUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        dateCreated:
            null == dateCreated
                ? _value.dateCreated
                : dateCreated // ignore: cast_nullable_to_non_nullable
                    as String,
        recommendations:
            null == recommendations
                ? _value._recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                    as List<Recommendation>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl extends _News {
  const _$NewsImpl({
    required this.id,
    required this.title,
    required this.summary,
    @JsonKey(name: 'news_category') required this.newsCategory,
    @JsonKey(name: 'article_url') required this.articleUrl,
    @JsonKey(name: 'image_url') required this.imageUrl,
    @JsonKey(name: 'date_created') required this.dateCreated,
    required final List<Recommendation> recommendations,
  }) : _recommendations = recommendations,
       super._();

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) => _$$NewsImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  @JsonKey(name: 'news_category')
  final String newsCategory;
  @override
  @JsonKey(name: 'article_url')
  final String articleUrl;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  @JsonKey(name: 'date_created')
  final String dateCreated;
  final List<Recommendation> _recommendations;
  @override
  List<Recommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'News(id: $id, title: $title, summary: $summary, newsCategory: $newsCategory, articleUrl: $articleUrl, imageUrl: $imageUrl, dateCreated: $dateCreated, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.newsCategory, newsCategory) || other.newsCategory == newsCategory) &&
            (identical(other.articleUrl, articleUrl) || other.articleUrl == articleUrl) &&
            (identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl) &&
            (identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated) &&
            const DeepCollectionEquality().equals(other._recommendations, _recommendations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    summary,
    newsCategory,
    articleUrl,
    imageUrl,
    dateCreated,
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith => __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(this);
  }
}

abstract class _News extends News {
  const factory _News({
    required final String id,
    required final String title,
    required final String summary,
    @JsonKey(name: 'news_category') required final String newsCategory,
    @JsonKey(name: 'article_url') required final String articleUrl,
    @JsonKey(name: 'image_url') required final String imageUrl,
    @JsonKey(name: 'date_created') required final String dateCreated,
    required final List<Recommendation> recommendations,
  }) = _$NewsImpl;
  const _News._() : super._();

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  @JsonKey(name: 'news_category')
  String get newsCategory;
  @override
  @JsonKey(name: 'article_url')
  String get articleUrl;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'date_created')
  String get dateCreated;
  @override
  List<Recommendation> get recommendations;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith => throw _privateConstructorUsedError;
}
