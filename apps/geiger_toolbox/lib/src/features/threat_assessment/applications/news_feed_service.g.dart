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
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
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
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
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
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchOldNewsFeedsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchOldNewsFeedsRef = AutoDisposeStreamProviderRef<List<News>>;
String _$fetchNewsFeedByIdHash() => r'ab8b8b2a534b57d0a172aa905f9bba7c3a975394';

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

/// See also [fetchNewsFeedById].
@ProviderFor(fetchNewsFeedById)
const fetchNewsFeedByIdProvider = FetchNewsFeedByIdFamily();

/// See also [fetchNewsFeedById].
class FetchNewsFeedByIdFamily extends Family<AsyncValue<News?>> {
  /// See also [fetchNewsFeedById].
  const FetchNewsFeedByIdFamily();

  /// See also [fetchNewsFeedById].
  FetchNewsFeedByIdProvider call({required String newsId}) {
    return FetchNewsFeedByIdProvider(newsId: newsId);
  }

  @override
  FetchNewsFeedByIdProvider getProviderOverride(
    covariant FetchNewsFeedByIdProvider provider,
  ) {
    return call(newsId: provider.newsId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchNewsFeedByIdProvider';
}

/// See also [fetchNewsFeedById].
class FetchNewsFeedByIdProvider extends AutoDisposeFutureProvider<News?> {
  /// See also [fetchNewsFeedById].
  FetchNewsFeedByIdProvider({required String newsId})
    : this._internal(
        (ref) => fetchNewsFeedById(ref as FetchNewsFeedByIdRef, newsId: newsId),
        from: fetchNewsFeedByIdProvider,
        name: r'fetchNewsFeedByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchNewsFeedByIdHash,
        dependencies: FetchNewsFeedByIdFamily._dependencies,
        allTransitiveDependencies:
            FetchNewsFeedByIdFamily._allTransitiveDependencies,
        newsId: newsId,
      );

  FetchNewsFeedByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newsId,
  }) : super.internal();

  final String newsId;

  @override
  Override overrideWith(
    FutureOr<News?> Function(FetchNewsFeedByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNewsFeedByIdProvider._internal(
        (ref) => create(ref as FetchNewsFeedByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newsId: newsId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<News?> createElement() {
    return _FetchNewsFeedByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNewsFeedByIdProvider && other.newsId == newsId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newsId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchNewsFeedByIdRef on AutoDisposeFutureProviderRef<News?> {
  /// The parameter `newsId` of this provider.
  String get newsId;
}

class _FetchNewsFeedByIdProviderElement
    extends AutoDisposeFutureProviderElement<News?>
    with FetchNewsFeedByIdRef {
  _FetchNewsFeedByIdProviderElement(super.provider);

  @override
  String get newsId => (origin as FetchNewsFeedByIdProvider).newsId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
