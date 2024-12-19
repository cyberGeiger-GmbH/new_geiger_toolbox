import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_logger.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_task_cache_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/mutable_task.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'task_service.g.dart';

class TaskService {
  final Ref ref;
  TaskService(this.ref);

  Future<void> setTodoTask(TodoTask todo) async {
    try {
      final repo = ref.read(todoTaskCacheRespositoryProvider);
      final prevTodo = await repo.fetchTodoTask();

      final updated = prevTodo.addTodo(todo);
      debugPrint("task => $updated");
      //update cache
      await repo.setTask(updated);
    } catch (e, s) {
      ref.read(appLoggerProvider).logError(e, s);
    }
  }

  Future<void> removeTodoTask(TodoTask todo) async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();
    final update = prevTodo.removeTodoById(todo);
    //update cache
    await repo.setTask(update);
  }

  Future<void> deletedAllTask() async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();
    if (prevTodo.items.isNotEmpty) {
      await repo.deleteAllTodoTask();
    }
    // else{
    //   throw Exception("Data")
    // }
  }

  Future<Task> updateTodoIfalreadyCache(List<TodoTask> todoTask) async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();
    final update = prevTodo.updateTodosIfExists(todoTask);
    debugPrint("form newsFeed => $todoTask");

    debugPrint("protect list already in todo => $update");

    return update;
  }
}

@riverpod
TaskService taskService(Ref ref) {
  return TaskService(ref);
}

@Riverpod(keepAlive: true)
Stream<Task> taskStream(Ref ref) {
  final repoCache = ref.read(todoTaskCacheRespositoryProvider);

  return repoCache.watchTodoTask();
}

@riverpod
Future<Task> filterProtectList(Ref ref,
    {required List<TodoTask> todoTask}) async {
  final taskService = ref.read(taskServiceProvider);

  return await taskService.updateTodoIfalreadyCache(todoTask);
}
