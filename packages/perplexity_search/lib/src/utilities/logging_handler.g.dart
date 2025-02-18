// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingHandlerHash() => r'2c5e712dcaf6d6ff8afc149502dc02bd0d635e11';

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

/// See also [loggingHandler].
@ProviderFor(loggingHandler)
const loggingHandlerProvider = LoggingHandlerFamily();

/// See also [loggingHandler].
class LoggingHandlerFamily extends Family<Logger> {
  /// See also [loggingHandler].
  const LoggingHandlerFamily();

  /// See also [loggingHandler].
  LoggingHandlerProvider call(String source) {
    return LoggingHandlerProvider(source);
  }

  @override
  LoggingHandlerProvider getProviderOverride(covariant LoggingHandlerProvider provider) {
    return call(provider.source);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'loggingHandlerProvider';
}

/// See also [loggingHandler].
class LoggingHandlerProvider extends AutoDisposeProvider<Logger> {
  /// See also [loggingHandler].
  LoggingHandlerProvider(String source)
    : this._internal(
        (ref) => loggingHandler(ref as LoggingHandlerRef, source),
        from: loggingHandlerProvider,
        name: r'loggingHandlerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$loggingHandlerHash,
        dependencies: LoggingHandlerFamily._dependencies,
        allTransitiveDependencies: LoggingHandlerFamily._allTransitiveDependencies,
        source: source,
      );

  LoggingHandlerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
  }) : super.internal();

  final String source;

  @override
  Override overrideWith(Logger Function(LoggingHandlerRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: LoggingHandlerProvider._internal(
        (ref) => create(ref as LoggingHandlerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Logger> createElement() {
    return _LoggingHandlerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoggingHandlerProvider && other.source == source;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoggingHandlerRef on AutoDisposeProviderRef<Logger> {
  /// The parameter `source` of this provider.
  String get source;
}

class _LoggingHandlerProviderElement extends AutoDisposeProviderElement<Logger> with LoggingHandlerRef {
  _LoggingHandlerProviderElement(super.provider);

  @override
  String get source => (origin as LoggingHandlerProvider).source;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
