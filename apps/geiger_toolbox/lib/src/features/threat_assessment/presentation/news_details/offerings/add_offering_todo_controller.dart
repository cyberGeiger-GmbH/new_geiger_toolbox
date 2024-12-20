// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/offering_status.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_offering_todo_controller.g.dart';

@riverpod
class AddOfferingTodoController extends _$AddOfferingTodoController {
  @override
  FutureOr<void> build() {}

  Future<void> addOrUpdate(
      {required OfferingId id, required bool added}) async {
    final repo = ref.read(todoOfferingRepoProvider);
    state = const AsyncLoading<void>();

    //store the todoTask in cache
    
    state = await AsyncValue.guard(
        () => repo.updateTodoOfferingStatus(id: id, isAdded: added));
  }
}

@riverpod
//update the checkbox state
class ToggleOfferController extends _$ToggleOfferController {
  @override
  OfferingStatus build(OfferingStatus value) {
    return value;
  }

  void onChange(OfferingStatus value) {
    state = value;
  }
}
