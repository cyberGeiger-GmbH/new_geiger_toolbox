import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/cache/todo_task_cache_repository.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/mutable_task.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'task_service.g.dart';

class TaskService {
  TaskService(this.ref);
  final Ref ref;

  Future<void> setTodoTask(TodoTask todo) async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();

    final updated = prevTodo.addTodo(todo);
    debugPrint("task => $updated");
    //update cache
    await repo.setTask(updated);
  }

  Future<void> removeTodoTask(TodoTask todo) async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();
    final update = prevTodo.removeTodoById(todo);
    //update cache
    await repo.setTask(update);
  }

  Future<Task> updateTodoIfalreadyCache(
      List<Recommendation> recommendations) async {
    final repo = ref.read(todoTaskCacheRespositoryProvider);
    final prevTodo = await repo.fetchTodoTask();
    final update = prevTodo.updateTodosIfExists(recommendations);
    debugPrint("protect list => $update");
    debugPrint("recommendation => $recommendations");
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
    {required List<Recommendation> recommendations}) async {
  final taskService = ref.read(taskServiceProvider);
  return await taskService.updateTodoIfalreadyCache(recommendations);
}
