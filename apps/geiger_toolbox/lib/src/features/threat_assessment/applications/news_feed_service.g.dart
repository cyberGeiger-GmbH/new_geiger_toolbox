// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsFeedServiceHash() => r'999d21b7a9d79321474d447a3c10ac902133446f';

/// See also [newsFeedService].
@ProviderFor(newsFeedService)
final newsFeedServiceProvider = AutoDisposeProvider<NewsFeedService>.internal(
  newsFeedService,
  name: r'newsFeedServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsFeedServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NewsFeedServiceRef = AutoDisposeProviderRef<NewsFeedService>;
String _$watchtNewsFeedHash() => r'0e349ff6a4761aa9162aaf17309a5e538eaf93a2';

/// See also [watchtNewsFeed].
@ProviderFor(watchtNewsFeed)
final watchtNewsFeedProvider = StreamProvider<List<News>>.internal(
  watchtNewsFeed,
  name: r'watchtNewsFeedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchtNewsFeedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchtNewsFeedRef = StreamProviderRef<List<News>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
