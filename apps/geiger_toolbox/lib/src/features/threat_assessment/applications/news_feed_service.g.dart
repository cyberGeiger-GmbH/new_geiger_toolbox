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
String _$watchRecentNewsFeedsHash() =>
    r'6d4546e44d5bede6bf7db53a24a969980d2b362a';

/// See also [watchRecentNewsFeeds].
@ProviderFor(watchRecentNewsFeeds)
final watchRecentNewsFeedsProvider =
    AutoDisposeStreamProvider<List<News>>.internal(
  watchRecentNewsFeeds,
  name: r'watchRecentNewsFeedsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchRecentNewsFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchRecentNewsFeedsRef = AutoDisposeStreamProviderRef<List<News>>;
String _$watchOldNewsFeedsHash() => r'26136c7275956c2931ab9235a9e274b12545afa7';

/// See also [watchOldNewsFeeds].
@ProviderFor(watchOldNewsFeeds)
final watchOldNewsFeedsProvider =
    AutoDisposeStreamProvider<List<News>>.internal(
  watchOldNewsFeeds,
  name: r'watchOldNewsFeedsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchOldNewsFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchOldNewsFeedsRef = AutoDisposeStreamProviderRef<List<News>>;
String _$watchNewsFeedByTitleHash() =>
    r'0139414cdbf4078205724bb36bc977a596fdf926';

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

String _$fetchNewsFeedByTitleHash() =>
    r'9327a925062623ad64c197b1836766eb862e9b44';

/// See also [fetchNewsFeedByTitle].
@ProviderFor(fetchNewsFeedByTitle)
const fetchNewsFeedByTitleProvider = FetchNewsFeedByTitleFamily();

/// See also [fetchNewsFeedByTitle].
class FetchNewsFeedByTitleFamily extends Family<AsyncValue<News?>> {
  /// See also [fetchNewsFeedByTitle].
  const FetchNewsFeedByTitleFamily();

  /// See also [fetchNewsFeedByTitle].
  FetchNewsFeedByTitleProvider call({
    required String newsTitle,
  }) {
    return FetchNewsFeedByTitleProvider(
      newsTitle: newsTitle,
    );
  }

  @override
  FetchNewsFeedByTitleProvider getProviderOverride(
    covariant FetchNewsFeedByTitleProvider provider,
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
  String? get name => r'fetchNewsFeedByTitleProvider';
}

/// See also [fetchNewsFeedByTitle].
class FetchNewsFeedByTitleProvider extends AutoDisposeFutureProvider<News?> {
  /// See also [fetchNewsFeedByTitle].
  FetchNewsFeedByTitleProvider({
    required String newsTitle,
  }) : this._internal(
          (ref) => fetchNewsFeedByTitle(
            ref as FetchNewsFeedByTitleRef,
            newsTitle: newsTitle,
          ),
          from: fetchNewsFeedByTitleProvider,
          name: r'fetchNewsFeedByTitleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNewsFeedByTitleHash,
          dependencies: FetchNewsFeedByTitleFamily._dependencies,
          allTransitiveDependencies:
              FetchNewsFeedByTitleFamily._allTransitiveDependencies,
          newsTitle: newsTitle,
        );

  FetchNewsFeedByTitleProvider._internal(
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
    FutureOr<News?> Function(FetchNewsFeedByTitleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNewsFeedByTitleProvider._internal(
        (ref) => create(ref as FetchNewsFeedByTitleRef),
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
  AutoDisposeFutureProviderElement<News?> createElement() {
    return _FetchNewsFeedByTitleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNewsFeedByTitleProvider &&
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
mixin FetchNewsFeedByTitleRef on AutoDisposeFutureProviderRef<News?> {
  /// The parameter `newsTitle` of this provider.
  String get newsTitle;
}

class _FetchNewsFeedByTitleProviderElement
    extends AutoDisposeFutureProviderElement<News?>
    with FetchNewsFeedByTitleRef {
  _FetchNewsFeedByTitleProviderElement(super.provider);

  @override
  String get newsTitle => (origin as FetchNewsFeedByTitleProvider).newsTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
