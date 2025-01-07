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
String _$watchNewsFeedsHash() => r'5b5c91d43b8d3a714b6712ae8b5dae16665384d9';

/// See also [watchNewsFeeds].
@ProviderFor(watchNewsFeeds)
final watchNewsFeedsProvider = AutoDisposeStreamProvider<List<News>>.internal(
  watchNewsFeeds,
  name: r'watchNewsFeedsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchNewsFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchNewsFeedsRef = AutoDisposeStreamProviderRef<List<News>>;
String _$watchNewsFeedByTitleHash() =>
    r'1c2315e05b2c61d8304e75c28e2640d7b576a0dd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [watchNewsFeedByTitle].
@ProviderFor(watchNewsFeedByTitle)
const watchNewsFeedByTitleProvider = WatchNewsFeedByTitleFamily();

/// See also [watchNewsFeedByTitle].
class WatchNewsFeedByTitleFamily extends Family<AsyncValue<News?>> {
  /// See also [watchNewsFeedByTitle].
  const WatchNewsFeedByTitleFamily();

  /// See also [watchNewsFeedByTitle].
  WatchNewsFeedByTitleProvider call({
    required String newsTitle,
  }) {
    return WatchNewsFeedByTitleProvider(
      newsTitle: newsTitle,
    );
  }

  @override
  WatchNewsFeedByTitleProvider getProviderOverride(
    covariant WatchNewsFeedByTitleProvider provider,
  ) {
    return call(
      newsTitle: provider.newsTitle,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchNewsFeedByTitleProvider';
}

/// See also [watchNewsFeedByTitle].
class WatchNewsFeedByTitleProvider extends AutoDisposeStreamProvider<News?> {
  /// See also [watchNewsFeedByTitle].
  WatchNewsFeedByTitleProvider({
    required String newsTitle,
  }) : this._internal(
          (ref) => watchNewsFeedByTitle(
            ref as WatchNewsFeedByTitleRef,
            newsTitle: newsTitle,
          ),
          from: watchNewsFeedByTitleProvider,
          name: r'watchNewsFeedByTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchNewsFeedByTitleHash,
          dependencies: WatchNewsFeedByTitleFamily._dependencies,
          allTransitiveDependencies:
              WatchNewsFeedByTitleFamily._allTransitiveDependencies,
          newsTitle: newsTitle,
        );

  WatchNewsFeedByTitleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newsTitle,
  }) : super.internal();

  final String newsTitle;

  @override
  Override overrideWith(
    Stream<News?> Function(WatchNewsFeedByTitleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchNewsFeedByTitleProvider._internal(
        (ref) => create(ref as WatchNewsFeedByTitleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newsTitle: newsTitle,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<News?> createElement() {
    return _WatchNewsFeedByTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchNewsFeedByTitleProvider &&
        other.newsTitle == newsTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newsTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchNewsFeedByTitleRef on AutoDisposeStreamProviderRef<News?> {
  /// The parameter `newsTitle` of this provider.
  String get newsTitle;
}

class _WatchNewsFeedByTitleProviderElement
    extends AutoDisposeStreamProviderElement<News?>
    with WatchNewsFeedByTitleRef {
  _WatchNewsFeedByTitleProviderElement(super.provider);

  @override
  String get newsTitle => (origin as WatchNewsFeedByTitleProvider).newsTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
