// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_offering_todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addOfferingTodoControllerHash() =>
    r'd5b753b5e289b61523103330197464d4e981c103';

/// See also [AddOfferingTodoController].
@ProviderFor(AddOfferingTodoController)
final addOfferingTodoControllerProvider =
    AutoDisposeAsyncNotifierProvider<AddOfferingTodoController, void>.internal(
  AddOfferingTodoController.new,
  name: r'addOfferingTodoControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addOfferingTodoControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddOfferingTodoController = AutoDisposeAsyncNotifier<void>;
String _$toggleOfferControllerHash() =>
    r'54936722e78cd93cc18c1405576c5cf492fa9d00';

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

abstract class _$ToggleOfferController
    extends BuildlessAutoDisposeNotifier<OfferingStatus> {
  late final OfferingStatus value;

  OfferingStatus build(
    OfferingStatus value,
  );
}

/// See also [ToggleOfferController].
@ProviderFor(ToggleOfferController)
const toggleOfferControllerProvider = ToggleOfferControllerFamily();

/// See also [ToggleOfferController].
class ToggleOfferControllerFamily extends Family<OfferingStatus> {
  /// See also [ToggleOfferController].
  const ToggleOfferControllerFamily();

  /// See also [ToggleOfferController].
  ToggleOfferControllerProvider call(
    OfferingStatus value,
  ) {
    return ToggleOfferControllerProvider(
      value,
    );
  }

  @override
  ToggleOfferControllerProvider getProviderOverride(
    covariant ToggleOfferControllerProvider provider,
  ) {
    return call(
      provider.value,
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
  String? get name => r'toggleOfferControllerProvider';
}

/// See also [ToggleOfferController].
class ToggleOfferControllerProvider extends AutoDisposeNotifierProviderImpl<
    ToggleOfferController, OfferingStatus> {
  /// See also [ToggleOfferController].
  ToggleOfferControllerProvider(
    OfferingStatus value,
  ) : this._internal(
          () => ToggleOfferController()..value = value,
          from: toggleOfferControllerProvider,
          name: r'toggleOfferControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$toggleOfferControllerHash,
          dependencies: ToggleOfferControllerFamily._dependencies,
          allTransitiveDependencies:
              ToggleOfferControllerFamily._allTransitiveDependencies,
          value: value,
        );

  ToggleOfferControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
  }) : super.internal();

  final OfferingStatus value;

  @override
  OfferingStatus runNotifierBuild(
    covariant ToggleOfferController notifier,
  ) {
    return notifier.build(
      value,
    );
  }

  @override
  Override overrideWith(ToggleOfferController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ToggleOfferControllerProvider._internal(
        () => create()..value = value,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ToggleOfferController, OfferingStatus>
      createElement() {
    return _ToggleOfferControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ToggleOfferControllerProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ToggleOfferControllerRef
    on AutoDisposeNotifierProviderRef<OfferingStatus> {
  /// The parameter `value` of this provider.
  OfferingStatus get value;
}

class _ToggleOfferControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ToggleOfferController,
        OfferingStatus> with ToggleOfferControllerRef {
  _ToggleOfferControllerProviderElement(super.provider);

  @override
  OfferingStatus get value => (origin as ToggleOfferControllerProvider).value;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
