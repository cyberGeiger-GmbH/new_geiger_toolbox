import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<void> build() async {}

  Future<void> makeAsDone(TodoOffering todo) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await todoRepository.updateTodoStatus(id: todo.id, status: todo.copyWith(status: Status.done).status);
    });
  }

  Future<void> planLater(TodoOffering todo) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await todoRepository.updateTodoStatus(id: todo.id, status: todo.copyWith(status: Status.planned).status);
    });
  }

  Future<void> removeTodo(TodoOffering todo) async {
    final todoRepository = ref.read(todoOfferingRepoProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await todoRepository.updateTodoStatus(id: todo.id, status: todo.copyWith(status: Status.recommended).status);
    });
  }
}
