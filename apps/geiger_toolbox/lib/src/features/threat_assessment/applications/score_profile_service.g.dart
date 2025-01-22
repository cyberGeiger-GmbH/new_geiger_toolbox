// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_profile_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getScoreProfileHash() => r'ba4c580409763f0ca60a091240de8c04fd8404f1';

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

/// See also [getScoreProfile].
@ProviderFor(getScoreProfile)
const getScoreProfileProvider = GetScoreProfileFamily();

/// See also [getScoreProfile].
class GetScoreProfileFamily extends Family<AsyncValue<Profile>> {
  /// See also [getScoreProfile].
  const GetScoreProfileFamily();

  /// See also [getScoreProfile].
  GetScoreProfileProvider call({
    required bool goodScore,
  }) {
    return GetScoreProfileProvider(
      goodScore: goodScore,
    );
  }

  @override
  GetScoreProfileProvider getProviderOverride(
    covariant GetScoreProfileProvider provider,
  ) {
    return call(
      goodScore: provider.goodScore,
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
  String? get name => r'getScoreProfileProvider';
}

/// See also [getScoreProfile].
class GetScoreProfileProvider extends AutoDisposeFutureProvider<Profile> {
  /// See also [getScoreProfile].
  GetScoreProfileProvider({
    required bool goodScore,
  }) : this._internal(
          (ref) => getScoreProfile(
            ref as GetScoreProfileRef,
            goodScore: goodScore,
          ),
          from: getScoreProfileProvider,
          name: r'getScoreProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getScoreProfileHash,
          dependencies: GetScoreProfileFamily._dependencies,
          allTransitiveDependencies:
              GetScoreProfileFamily._allTransitiveDependencies,
          goodScore: goodScore,
        );

  GetScoreProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.goodScore,
  }) : super.internal();

  final bool goodScore;

  @override
  Override overrideWith(
    FutureOr<Profile> Function(GetScoreProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetScoreProfileProvider._internal(
        (ref) => create(ref as GetScoreProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        goodScore: goodScore,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _GetScoreProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetScoreProfileProvider && other.goodScore == goodScore;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goodScore.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetScoreProfileRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `goodScore` of this provider.
  bool get goodScore;
}

class _GetScoreProfileProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with GetScoreProfileRef {
  _GetScoreProfileProviderElement(super.provider);

  @override
  bool get goodScore => (origin as GetScoreProfileProvider).goodScore;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
