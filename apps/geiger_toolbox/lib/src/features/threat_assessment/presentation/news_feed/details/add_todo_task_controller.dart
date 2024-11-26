// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:geiger_toolbox/src/features/threat_assessment/applications/task_service.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_todo_task_controller.g.dart';

@riverpod
class AddTodoTaskCacheController extends _$AddTodoTaskCacheController {
  @override
  FutureOr<void> build() {}

  Future<void> addTodoToCache(TodoTask todo) async {
    state = const AsyncLoading<void>();
    final taskService = ref.read(taskServiceProvider);
    //store the todoTask in cache

    if (todo.isCompleted == false) {
      state = await AsyncValue.guard(() => taskService.setTodoTask(todo));
    } else {
      state = await AsyncValue.guard(() => taskService.removeTodoTask(todo));
    }
  }
}

@riverpod
//update the checkbox state
class AddTodoTaskController extends _$AddTodoTaskController {
  @override
  TodoTask build(TodoTask todo) {

    return todo;
  }

  void onChange(TodoTask todo) {
    state = todo;
  }
}
