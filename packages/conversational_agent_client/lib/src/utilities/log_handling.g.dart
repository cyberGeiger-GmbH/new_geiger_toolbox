// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_handling.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logHandlerHash() => r'7dfda107ea11d2b6b810b3f7199fc1477cfe73f9';

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

/// See also [logHandler].
@ProviderFor(logHandler)
const logHandlerProvider = LogHandlerFamily();

/// See also [logHandler].
class LogHandlerFamily extends Family<Logger> {
  /// See also [logHandler].
  const LogHandlerFamily();

  /// See also [logHandler].
  LogHandlerProvider call(String source, {String? packageName}) {
    return LogHandlerProvider(source, packageName: packageName);
  }

  @override
  LogHandlerProvider getProviderOverride(covariant LogHandlerProvider provider) {
    return call(provider.source, packageName: provider.packageName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'logHandlerProvider';
}

/// See also [logHandler].
class LogHandlerProvider extends AutoDisposeProvider<Logger> {
  /// See also [logHandler].
  LogHandlerProvider(String source, {String? packageName})
    : this._internal(
        (ref) => logHandler(ref as LogHandlerRef, source, packageName: packageName),
        from: logHandlerProvider,
        name: r'logHandlerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$logHandlerHash,
        dependencies: LogHandlerFamily._dependencies,
        allTransitiveDependencies: LogHandlerFamily._allTransitiveDependencies,
        source: source,
        packageName: packageName,
      );

  LogHandlerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
    required this.packageName,
  }) : super.internal();

  final String source;
  final String? packageName;

  @override
  Override overrideWith(Logger Function(LogHandlerRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: LogHandlerProvider._internal(
        (ref) => create(ref as LogHandlerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
        packageName: packageName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Logger> createElement() {
    return _LogHandlerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LogHandlerProvider && other.source == source && other.packageName == packageName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, packageName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LogHandlerRef on AutoDisposeProviderRef<Logger> {
  /// The parameter `source` of this provider.
  String get source;

  /// The parameter `packageName` of this provider.
  String? get packageName;
}

class _LogHandlerProviderElement extends AutoDisposeProviderElement<Logger> with LogHandlerRef {
  _LogHandlerProviderElement(super.provider);

  @override
  String get source => (origin as LogHandlerProvider).source;
  @override
  String? get packageName => (origin as LogHandlerProvider).packageName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
