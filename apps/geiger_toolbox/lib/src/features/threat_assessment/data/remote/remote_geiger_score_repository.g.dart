// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_geiger_score_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getGeigerScoreHash() => r'53d9ecee72fde61bae99a42eacb3f8d4193b329d';

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

/// See also [getGeigerScore].
@ProviderFor(getGeigerScore)
const getGeigerScoreProvider = GetGeigerScoreFamily();

/// See also [getGeigerScore].
class GetGeigerScoreFamily extends Family<AsyncValue<GeigerScore?>> {
  /// See also [getGeigerScore].
  const GetGeigerScoreFamily();

  /// See also [getGeigerScore].
  GetGeigerScoreProvider call({
    required Profile userProfile,
  }) {
    return GetGeigerScoreProvider(
      userProfile: userProfile,
    );
  }

  @override
  GetGeigerScoreProvider getProviderOverride(
    covariant GetGeigerScoreProvider provider,
  ) {
    return call(
      userProfile: provider.userProfile,
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
  String? get name => r'getGeigerScoreProvider';
}

/// See also [getGeigerScore].
class GetGeigerScoreProvider extends AutoDisposeFutureProvider<GeigerScore?> {
  /// See also [getGeigerScore].
  GetGeigerScoreProvider({
    required Profile userProfile,
  }) : this._internal(
          (ref) => getGeigerScore(
            ref as GetGeigerScoreRef,
            userProfile: userProfile,
          ),
          from: getGeigerScoreProvider,
          name: r'getGeigerScoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGeigerScoreHash,
          dependencies: GetGeigerScoreFamily._dependencies,
          allTransitiveDependencies:
              GetGeigerScoreFamily._allTransitiveDependencies,
          userProfile: userProfile,
        );

  GetGeigerScoreProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userProfile,
  }) : super.internal();

  final Profile userProfile;

  @override
  Override overrideWith(
    FutureOr<GeigerScore?> Function(GetGeigerScoreRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGeigerScoreProvider._internal(
        (ref) => create(ref as GetGeigerScoreRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userProfile: userProfile,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GeigerScore?> createElement() {
    return _GetGeigerScoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGeigerScoreProvider && other.userProfile == userProfile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userProfile.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetGeigerScoreRef on AutoDisposeFutureProviderRef<GeigerScore?> {
  /// The parameter `userProfile` of this provider.
  Profile get userProfile;
}

class _GetGeigerScoreProviderElement
    extends AutoDisposeFutureProviderElement<GeigerScore?>
    with GetGeigerScoreRef {
  _GetGeigerScoreProviderElement(super.provider);

  @override
  Profile get userProfile => (origin as GetGeigerScoreProvider).userProfile;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
