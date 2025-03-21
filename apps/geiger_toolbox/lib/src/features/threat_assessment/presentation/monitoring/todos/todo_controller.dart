import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<Status?> build() async {
    return null;
  }

  Future<void> makeAsDone({ required String id, required Status status, void Function()? onSuccess}) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    final newState = await AsyncValue.guard(() async {
      final result = await todoRepository.updateTodoStatus(
        id: id,
        status: status,
      );
      return result != 0 ? status : null;
    });
    if (state.hasError == false) {
      state = newState;
      onSuccess?.call();
    }
  }

  Future<void> planLater({required String id}) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final result = await todoRepository.updateTodoStatus(
        id: id,
        status: Status.planned
      );
      return result != 0 ? Status.planned : null;
    });
  }

  Future<void> removeTodo(TodoOffering todo, {void Function()? onSuccess}) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    final newState = await AsyncValue.guard(() async {
      final result = await todoRepository.updateTodoStatus(
        id: todo.id,
        status: todo.copyWith(status: Status.recommended).status,
      );
      return result != 0 ? Status.recommended : null;
    });
    if (state.hasError == false) {
      state = newState;
      onSuccess?.call();
    }
  }
}
