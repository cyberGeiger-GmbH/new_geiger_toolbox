// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/mixin/notifier_mounted.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_offering_todo_controller.g.dart';

@riverpod
class AddOfferingTodoController extends _$AddOfferingTodoController with NotifierMounted {
  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
  }

  /// add single OfferingStatus
  Future<void> addTodo({required TodoOffering status}) async {
    final repo = ref.read(todoOfferingRepoProvider);
    state = const AsyncLoading<void>();

    //store the todoTask in cache
    state = await AsyncValue.guard(() => repo.addTodo(todo: status));

    // //reset toggle to false on error
    if (state.hasError == true) {
      debugPrint("error occurs");
      final toggle = ref.read(toggleOfferControllerProvider(status).notifier);
      toggle.onChange(status.copyWith(status: Status.recommended));
    }
  }

  // add has a list
  Future<void> addToActiveTodo({
    required List<TodoOffering> offeringsStatus,
    required void Function() onSuccess,
  }) async {
    final repo = ref.read(todoOfferingRepoProvider);
    state = const AsyncLoading<void>();

    if (mounted) {
      debugPrint("is already mounted $mounted");
      state = await AsyncValue.guard(() => repo.addListTodo(offerData: offeringsStatus));
      if (state.hasError == false) {
        onSuccess();
      }
    }
  }
}

//add todo to a List
@riverpod
class ToggleListOfferController extends _$ToggleListOfferController {
  @override
  List<TodoOffering> build() {
    return [];
  }

  // Toggle the `completed` state of an item

  void selectTodoItems(TodoOffering item) {
    // If the item is already in the state, remove it
    if (state.any((i) => i.id == item.id)) {
      state = state.where((i) => i.id != item.id).toList();
    } else {
      // Otherwise, add it
      state = [...state, item];
    }
    // debugPrint("todos items => $state");
  }
}

@riverpod
//update the checkbox state
class ToggleOfferController extends _$ToggleOfferController {
  @override
  TodoOffering build(TodoOffering value) {
    return value;
  }

  void onChange(TodoOffering value) {
    state = value;
  }
}
