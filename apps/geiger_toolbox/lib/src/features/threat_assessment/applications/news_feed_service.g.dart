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
String _$watchNewsFeedsHash() => r'af5ad6173f570010e97fe1443965207bd8309121';

/// See also [watchNewsFeeds].
@ProviderFor(watchNewsFeeds)
final watchNewsFeedsProvider = StreamProvider<List<News>>.internal(
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
typedef WatchNewsFeedsRef = StreamProviderRef<List<News>>;
String _$newsFeedStreamHash() => r'080b13c0727c91e26ecc6253f5e6f60a90387228';

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

/// See also [newsFeedStream].
@ProviderFor(newsFeedStream)
const newsFeedStreamProvider = NewsFeedStreamFamily();

/// See also [newsFeedStream].
class NewsFeedStreamFamily extends Family<AsyncValue<News?>> {
  /// See also [newsFeedStream].
  const NewsFeedStreamFamily();

  /// See also [newsFeedStream].
  NewsFeedStreamProvider call({
    required String newsTitle,
  }) {
    return NewsFeedStreamProvider(
      newsTitle: newsTitle,
    );
  }

  @override
  NewsFeedStreamProvider getProviderOverride(
    covariant NewsFeedStreamProvider provider,
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
  String? get name => r'newsFeedStreamProvider';
}

/// See also [newsFeedStream].
class NewsFeedStreamProvider extends AutoDisposeStreamProvider<News?> {
  /// See also [newsFeedStream].
  NewsFeedStreamProvider({
    required String newsTitle,
  }) : this._internal(
          (ref) => newsFeedStream(
            ref as NewsFeedStreamRef,
            newsTitle: newsTitle,
          ),
          from: newsFeedStreamProvider,
          name: r'newsFeedStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsFeedStreamHash,
          dependencies: NewsFeedStreamFamily._dependencies,
          allTransitiveDependencies:
              NewsFeedStreamFamily._allTransitiveDependencies,
          newsTitle: newsTitle,
        );

  NewsFeedStreamProvider._internal(
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
    Stream<News?> Function(NewsFeedStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsFeedStreamProvider._internal(
        (ref) => create(ref as NewsFeedStreamRef),
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
    return _NewsFeedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsFeedStreamProvider && other.newsTitle == newsTitle;
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
mixin NewsFeedStreamRef on AutoDisposeStreamProviderRef<News?> {
  /// The parameter `newsTitle` of this provider.
  String get newsTitle;
}

class _NewsFeedStreamProviderElement
    extends AutoDisposeStreamProviderElement<News?> with NewsFeedStreamRef {
  _NewsFeedStreamProviderElement(super.provider);

  @override
  String get newsTitle => (origin as NewsFeedStreamProvider).newsTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
