// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xapi_profile_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getResultHash() => r'2a8e711b1aa57b29e0793518318862e12f51cc70';

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

/// See also [getResult].
@ProviderFor(getResult)
const getResultProvider = GetResultFamily();

/// See also [getResult].
class GetResultFamily extends Family<AsyncValue<Profile>> {
  /// See also [getResult].
  const GetResultFamily();

  /// See also [getResult].
  GetResultProvider call({
    required bool goodScore,
    Verb? verb,
  }) {
    return GetResultProvider(
      goodScore: goodScore,
      verb: verb,
    );
  }

  @override
  GetResultProvider getProviderOverride(
    covariant GetResultProvider provider,
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
  String? get name => r'getResultProvider';
}

/// See also [getResult].
class GetResultProvider extends AutoDisposeFutureProvider<Profile> {
  /// See also [getResult].
  GetResultProvider({
    required bool goodScore,
    Verb? verb,
  }) : this._internal(
          (ref) => getResult(
            ref as GetResultRef,
            goodScore: goodScore,
            verb: verb,
          ),
          from: getResultProvider,
          name: r'getResultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getResultHash,
          dependencies: GetResultFamily._dependencies,
          allTransitiveDependencies: GetResultFamily._allTransitiveDependencies,
          goodScore: goodScore,
          verb: verb,
        );

  GetResultProvider._internal(
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
    FutureOr<Profile> Function(GetResultRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetResultProvider._internal(
        (ref) => create(ref as GetResultRef),
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
    return _GetResultProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetResultProvider &&
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
mixin GetResultRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `goodScore` of this provider.
  bool get goodScore;

  /// The parameter `verb` of this provider.
  Verb? get verb;
}

class _GetResultProviderElement
    extends AutoDisposeFutureProviderElement<Profile> with GetResultRef {
  _GetResultProviderElement(super.provider);

  @override
  bool get goodScore => (origin as GetResultProvider).goodScore;
  @override
  Verb? get verb => (origin as GetResultProvider).verb;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
