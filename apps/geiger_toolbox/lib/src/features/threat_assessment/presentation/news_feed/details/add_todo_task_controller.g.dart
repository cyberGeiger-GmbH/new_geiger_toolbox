// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_task_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addTodoTaskCacheControllerHash() =>
    r'61e0e363950e25fb4eb90eb72bd1906d966c81f8';

/// See also [AddTodoTaskCacheController].
@ProviderFor(AddTodoTaskCacheController)
final addTodoTaskCacheControllerProvider =
    AutoDisposeAsyncNotifierProvider<AddTodoTaskCacheController, void>.internal(
  AddTodoTaskCacheController.new,
  name: r'addTodoTaskCacheControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTodoTaskCacheControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTodoTaskCacheController = AutoDisposeAsyncNotifier<void>;
String _$addTodoTaskControllerHash() =>
    r'086a8461db230e44df147ebb643f12dfbfbcaac9';

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

abstract class _$AddTodoTaskController
    extends BuildlessAutoDisposeNotifier<TodoTask> {
  late final TodoTask todo;

  TodoTask build(
    TodoTask todo,
  );
}

/// See also [AddTodoTaskController].
@ProviderFor(AddTodoTaskController)
const addTodoTaskControllerProvider = AddTodoTaskControllerFamily();

/// See also [AddTodoTaskController].
class AddTodoTaskControllerFamily extends Family<TodoTask> {
  /// See also [AddTodoTaskController].
  const AddTodoTaskControllerFamily();

  /// See also [AddTodoTaskController].
  AddTodoTaskControllerProvider call(
    TodoTask todo,
  ) {
    return AddTodoTaskControllerProvider(
      todo,
    );
  }

  @override
  AddTodoTaskControllerProvider getProviderOverride(
    covariant AddTodoTaskControllerProvider provider,
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
  String? get name => r'addTodoTaskControllerProvider';
}

/// See also [AddTodoTaskController].
class AddTodoTaskControllerProvider
    extends AutoDisposeNotifierProviderImpl<AddTodoTaskController, TodoTask> {
  /// See also [AddTodoTaskController].
  AddTodoTaskControllerProvider(
    TodoTask todo,
  ) : this._internal(
          () => AddTodoTaskController()..todo = todo,
          from: addTodoTaskControllerProvider,
          name: r'addTodoTaskControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addTodoTaskControllerHash,
          dependencies: AddTodoTaskControllerFamily._dependencies,
          allTransitiveDependencies:
              AddTodoTaskControllerFamily._allTransitiveDependencies,
          todo: todo,
        );

  AddTodoTaskControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todo,
  }) : super.internal();

  final TodoTask todo;

  @override
  TodoTask runNotifierBuild(
    covariant AddTodoTaskController notifier,
  ) {
    return notifier.build(
      todo,
    );
  }

  @override
  Override overrideWith(AddTodoTaskController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddTodoTaskControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<AddTodoTaskController, TodoTask>
      createElement() {
    return _AddTodoTaskControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddTodoTaskControllerProvider && other.todo == todo;
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
mixin AddTodoTaskControllerRef on AutoDisposeNotifierProviderRef<TodoTask> {
  /// The parameter `todo` of this provider.
  TodoTask get todo;
}

class _AddTodoTaskControllerProviderElement
    extends AutoDisposeNotifierProviderElement<AddTodoTaskController, TodoTask>
    with AddTodoTaskControllerRef {
  _AddTodoTaskControllerProviderElement(super.provider);

  @override
  TodoTask get todo => (origin as AddTodoTaskControllerProvider).todo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
