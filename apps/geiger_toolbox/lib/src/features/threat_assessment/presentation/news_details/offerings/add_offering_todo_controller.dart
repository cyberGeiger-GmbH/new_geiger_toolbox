// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_offering_todo_controller.g.dart';

@riverpod
class AddOfferingTodoController extends _$AddOfferingTodoController {
  @override
  FutureOr<void> build() {}

  /// add single OfferingStatus
  Future<void> addOrUpdate({required TodoOffing status}) async {
    final repo = ref.read(todoOfferingRepoProvider);
    state = const AsyncLoading<void>();

    //store the todoTask in cache
    state = await AsyncValue.guard(() => repo.addOrUpdateTodoOfferingStatus(
        id: status.id, isAdded: status.added ?? false));

// //reset toggle to false on error
    if (state.hasError == true) {
      debugPrint("error occurs");
      final toggle = ref.read(toggleOfferControllerProvider(status).notifier);
      toggle.onChange(status.copyWith(added: false));
    }
  }

// add has a list
  Future<void> addOrUpdateStatuses(
      {required List<TodoOffing> offeringsStatus}) async {
    final repo = ref.read(todoOfferingRepoProvider);
    state = const AsyncLoading<void>();

    //store the todoTask in cache
    state = await AsyncValue.guard(
        () => repo.addOrUpdateTodoOfferings(offerData: offeringsStatus));
  }
}

//add todo to a List
@riverpod
class ToggleListOfferController extends _$ToggleListOfferController {
  @override
  List<TodoOffing> build() {
    return [];
  }

  // Toggle the `completed` state of an item

  void selectTodoItems(TodoOffing item) {
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
  TodoOffing build(TodoOffing value) {
    return value;
  }

  void onChange(TodoOffing value) {
    state = value;
  }
}
