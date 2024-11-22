// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTodoControllerHash() => r'1f02f66c0f05a80b5a9c0faa251330bef494aa7a';

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

abstract class _$AddTodoController extends BuildlessAutoDisposeNotifier<Todo> {
  late final Todo todo;

  Todo build(
    Todo todo,
  );
}

/// See also [AddTodoController].
@ProviderFor(AddTodoController)
const addTodoControllerProvider = AddTodoControllerFamily();

/// See also [AddTodoController].
class AddTodoControllerFamily extends Family<Todo> {
  /// See also [AddTodoController].
  const AddTodoControllerFamily();

  /// See also [AddTodoController].
  AddTodoControllerProvider call(
    Todo todo,
  ) {
    return AddTodoControllerProvider(
      todo,
    );
  }

  @override
  AddTodoControllerProvider getProviderOverride(
    covariant AddTodoControllerProvider provider,
  ) {
    return call(
      provider.todo,
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
  String? get name => r'addTodoControllerProvider';
}

/// See also [AddTodoController].
class AddTodoControllerProvider
    extends AutoDisposeNotifierProviderImpl<AddTodoController, Todo> {
  /// See also [AddTodoController].
  AddTodoControllerProvider(
    Todo todo,
  ) : this._internal(
          () => AddTodoController()..todo = todo,
          from: addTodoControllerProvider,
          name: r'addTodoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addTodoControllerHash,
          dependencies: AddTodoControllerFamily._dependencies,
          allTransitiveDependencies:
              AddTodoControllerFamily._allTransitiveDependencies,
          todo: todo,
        );

  AddTodoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todo,
  }) : super.internal();

  final Todo todo;

  @override
  Todo runNotifierBuild(
    covariant AddTodoController notifier,
  ) {
    return notifier.build(
      todo,
    );
  }

  @override
  Override overrideWith(AddTodoController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddTodoControllerProvider._internal(
        () => create()..todo = todo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todo: todo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AddTodoController, Todo> createElement() {
    return _AddTodoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddTodoControllerProvider && other.todo == todo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddTodoControllerRef on AutoDisposeNotifierProviderRef<Todo> {
  /// The parameter `todo` of this provider.
  Todo get todo;
}

class _AddTodoControllerProviderElement
    extends AutoDisposeNotifierProviderElement<AddTodoController, Todo>
    with AddTodoControllerRef {
  _AddTodoControllerProviderElement(super.provider);

  @override
  Todo get todo => (origin as AddTodoControllerProvider).todo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
