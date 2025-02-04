// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_offering_todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addOfferingTodoControllerHash() =>
    r'75fa394f897574b85b7987aa5d7e19dfb19de014';

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
String _$toggleListOfferControllerHash() =>
    r'037e85a19b33328d5d7114d09e5aaf0b77ba206b';

/// See also [ToggleListOfferController].
@ProviderFor(ToggleListOfferController)
final toggleListOfferControllerProvider = AutoDisposeNotifierProvider<
    ToggleListOfferController, List<TodoOffing>>.internal(
  ToggleListOfferController.new,
  name: r'toggleListOfferControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$toggleListOfferControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToggleListOfferController = AutoDisposeNotifier<List<TodoOffing>>;
String _$toggleOfferControllerHash() =>
    r'080b0290f47a57c1d70a53c82074523ae38c1bd6';

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
    extends BuildlessAutoDisposeNotifier<TodoOffing> {
  late final TodoOffing value;

  TodoOffing build(
    TodoOffing value,
  );
}

/// See also [ToggleOfferController].
@ProviderFor(ToggleOfferController)
const toggleOfferControllerProvider = ToggleOfferControllerFamily();

/// See also [ToggleOfferController].
class ToggleOfferControllerFamily extends Family<TodoOffing> {
  /// See also [ToggleOfferController].
  const ToggleOfferControllerFamily();

  /// See also [ToggleOfferController].
  ToggleOfferControllerProvider call(
    TodoOffing value,
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
class ToggleOfferControllerProvider
    extends AutoDisposeNotifierProviderImpl<ToggleOfferController, TodoOffing> {
  /// See also [ToggleOfferController].
  ToggleOfferControllerProvider(
    TodoOffing value,
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

  final TodoOffing value;

  @override
  TodoOffing runNotifierBuild(
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
  AutoDisposeNotifierProviderElement<ToggleOfferController, TodoOffing>
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
mixin ToggleOfferControllerRef on AutoDisposeNotifierProviderRef<TodoOffing> {
  /// The parameter `value` of this provider.
  TodoOffing get value;
}

class _ToggleOfferControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ToggleOfferController,
        TodoOffing> with ToggleOfferControllerRef {
  _ToggleOfferControllerProviderElement(super.provider);

  @override
  TodoOffing get value => (origin as ToggleOfferControllerProvider).value;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
