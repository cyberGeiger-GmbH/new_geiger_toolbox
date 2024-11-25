import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_task_cache_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_todo_task_controller.g.dart';

@riverpod
class AddTodoTaskCacheController extends _$AddTodoTaskCacheController {
  @override
  FutureOr<void> build() {}

  Future<void> addTodoToCache(TodoTask todo) async {
    state = const AsyncLoading<void>();
    final todoRepo = ref.read(todoTaskCacheRespositoryProvider);
    //store the todoTask in cache
    state = await AsyncValue.guard(() => todoRepo.addTodoTask(todo));
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
