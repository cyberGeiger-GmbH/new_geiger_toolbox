// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_offering_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoOfferingRepoHash() => r'6df371046684761e6371f911ab458e85e56085b7';

/// See also [todoOfferingRepo].
@ProviderFor(todoOfferingRepo)
final todoOfferingRepoProvider =
    AutoDisposeProvider<TodoOfferingRepository>.internal(
      todoOfferingRepo,
      name: r'todoOfferingRepoProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$todoOfferingRepoHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodoOfferingRepoRef = AutoDisposeProviderRef<TodoOfferingRepository>;
String _$fetchOfferStatusHash() => r'0d657fdfc87eac952d8e19319bf8a8cf46cac4ac';

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

/// See also [fetchOfferStatus].
@ProviderFor(fetchOfferStatus)
const fetchOfferStatusProvider = FetchOfferStatusFamily();

/// See also [fetchOfferStatus].
class FetchOfferStatusFamily extends Family<AsyncValue<List<TodoOffering>>> {
  /// See also [fetchOfferStatus].
  const FetchOfferStatusFamily();

  /// See also [fetchOfferStatus].
  FetchOfferStatusProvider call({required String id}) {
    return FetchOfferStatusProvider(id: id);
  }

  @override
  FetchOfferStatusProvider getProviderOverride(
    covariant FetchOfferStatusProvider provider,
  ) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchOfferStatusProvider';
}

/// See also [fetchOfferStatus].
class FetchOfferStatusProvider
    extends AutoDisposeFutureProvider<List<TodoOffering>> {
  /// See also [fetchOfferStatus].
  FetchOfferStatusProvider({required String id})
    : this._internal(
        (ref) => fetchOfferStatus(ref as FetchOfferStatusRef, id: id),
        from: fetchOfferStatusProvider,
        name: r'fetchOfferStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fetchOfferStatusHash,
        dependencies: FetchOfferStatusFamily._dependencies,
        allTransitiveDependencies:
            FetchOfferStatusFamily._allTransitiveDependencies,
        id: id,
      );

  FetchOfferStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<TodoOffering>> Function(FetchOfferStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchOfferStatusProvider._internal(
        (ref) => create(ref as FetchOfferStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TodoOffering>> createElement() {
    return _FetchOfferStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchOfferStatusProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchOfferStatusRef on AutoDisposeFutureProviderRef<List<TodoOffering>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FetchOfferStatusProviderElement
    extends AutoDisposeFutureProviderElement<List<TodoOffering>>
    with FetchOfferStatusRef {
  _FetchOfferStatusProviderElement(super.provider);

  @override
  String get id => (origin as FetchOfferStatusProvider).id;
}

String _$watchTodosHash() => r'41fc23ec32faa9e3828455c903c47300b4ce3442';

/// See also [watchTodos].
@ProviderFor(watchTodos)
final watchTodosProvider =
    AutoDisposeStreamProvider<List<TodoOfferingCategory>>.internal(
      watchTodos,
      name: r'watchTodosProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchTodosHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchTodosRef =
    AutoDisposeStreamProviderRef<List<TodoOfferingCategory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
