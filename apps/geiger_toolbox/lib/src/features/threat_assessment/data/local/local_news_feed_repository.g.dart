// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_news_feed_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localNewsFeedRepositoryHash() => r'4162c0b981a2281f442e59d89fe1148e97480087';

/// See also [localNewsFeedRepository].
@ProviderFor(localNewsFeedRepository)
final localNewsFeedRepositoryProvider = AutoDisposeProvider<LocalNewsFeedRepository>.internal(
  localNewsFeedRepository,
  name: r'localNewsFeedRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$localNewsFeedRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalNewsFeedRepositoryRef = AutoDisposeProviderRef<LocalNewsFeedRepository>;
String _$fetchNewsListHash() => r'c178446d262c011ffcad6504ba7b32afcfaf9447';

/// See also [fetchNewsList].
@ProviderFor(fetchNewsList)
final fetchNewsListProvider = AutoDisposeFutureProvider<List<News>>.internal(
  fetchNewsList,
  name: r'fetchNewsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$fetchNewsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchNewsListRef = AutoDisposeFutureProviderRef<List<News>>;
String _$isNewsTableEmptyHash() => r'dfe706c17a39e192ca9977928ae56b36325fcdd8';

/// See also [isNewsTableEmpty].
@ProviderFor(isNewsTableEmpty)
final isNewsTableEmptyProvider = FutureProvider<bool>.internal(
  isNewsTableEmpty,
  name: r'isNewsTableEmptyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$isNewsTableEmptyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsNewsTableEmptyRef = FutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
