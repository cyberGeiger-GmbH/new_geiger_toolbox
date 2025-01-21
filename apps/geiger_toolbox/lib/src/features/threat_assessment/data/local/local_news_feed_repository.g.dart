// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_news_feed_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsFeedCacheRepositoryHash() =>
    r'5196053d44dc308c44eb943b7dfbe8749f186638';

/// See also [newsFeedCacheRepository].
@ProviderFor(newsFeedCacheRepository)
final newsFeedCacheRepositoryProvider =
    AutoDisposeProvider<LocalNewsFeedRepository>.internal(
  newsFeedCacheRepository,
  name: r'newsFeedCacheRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsFeedCacheRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewsFeedCacheRepositoryRef
    = AutoDisposeProviderRef<LocalNewsFeedRepository>;
String _$fetchNewsListHash() => r'ced51939e1dc54768cb35eea05e05d9e26e607e8';

/// See also [fetchNewsList].
@ProviderFor(fetchNewsList)
final fetchNewsListProvider = AutoDisposeFutureProvider<List<News>>.internal(
  fetchNewsList,
  name: r'fetchNewsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchNewsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchNewsListRef = AutoDisposeFutureProviderRef<List<News>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
