// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xapi_profile_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getXapiProfileHash() => r'd6788887eb9aab163e22fdf8e605def17a9e6f17';

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

/// See also [getXapiProfile].
@ProviderFor(getXapiProfile)
const getXapiProfileProvider = GetXapiProfileFamily();

/// See also [getXapiProfile].
class GetXapiProfileFamily extends Family<AsyncValue<Profile>> {
  /// See also [getXapiProfile].
  const GetXapiProfileFamily();

  /// See also [getXapiProfile].
  GetXapiProfileProvider call({
    required bool goodScore,
    Verb? verb,
  }) {
    return GetXapiProfileProvider(
      goodScore: goodScore,
      verb: verb,
    );
  }

  @override
  GetXapiProfileProvider getProviderOverride(
    covariant GetXapiProfileProvider provider,
  ) {
    return call(
      goodScore: provider.goodScore,
      verb: provider.verb,
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
  String? get name => r'getXapiProfileProvider';
}

/// See also [getXapiProfile].
class GetXapiProfileProvider extends AutoDisposeFutureProvider<Profile> {
  /// See also [getXapiProfile].
  GetXapiProfileProvider({
    required bool goodScore,
    Verb? verb,
  }) : this._internal(
          (ref) => getXapiProfile(
            ref as GetXapiProfileRef,
            goodScore: goodScore,
            verb: verb,
          ),
          from: getXapiProfileProvider,
          name: r'getXapiProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getXapiProfileHash,
          dependencies: GetXapiProfileFamily._dependencies,
          allTransitiveDependencies:
              GetXapiProfileFamily._allTransitiveDependencies,
          goodScore: goodScore,
          verb: verb,
        );

  GetXapiProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.goodScore,
    required this.verb,
  }) : super.internal();

  final bool goodScore;
  final Verb? verb;

  @override
  Override overrideWith(
    FutureOr<Profile> Function(GetXapiProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetXapiProfileProvider._internal(
        (ref) => create(ref as GetXapiProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        goodScore: goodScore,
        verb: verb,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _GetXapiProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetXapiProfileProvider &&
        other.goodScore == goodScore &&
        other.verb == verb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, goodScore.hashCode);
    hash = _SystemHash.combine(hash, verb.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetXapiProfileRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `goodScore` of this provider.
  bool get goodScore;

  /// The parameter `verb` of this provider.
  Verb? get verb;
}

class _GetXapiProfileProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with GetXapiProfileRef {
  _GetXapiProfileProviderElement(super.provider);

  @override
  bool get goodScore => (origin as GetXapiProfileProvider).goodScore;
  @override
  Verb? get verb => (origin as GetXapiProfileProvider).verb;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
