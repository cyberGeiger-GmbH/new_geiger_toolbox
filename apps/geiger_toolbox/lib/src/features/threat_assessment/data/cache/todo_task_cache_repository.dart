import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:geiger_toolbox/src/persistence/sembast_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'todo_task_cache_repository.g.dart';

class TodoCacheTaskRepository {
  TodoCacheTaskRepository(this.ref);
  final Ref ref;
  static const todoKey = 'todoObjectKey';

  Future<void> addTodoTask(TodoTask task) async {
    try {
      await _storeTodo(task);
    } catch (e) {
      throw AddTodoTaskRepositryException();
    }
  }

  Stream<TodoTask> watchTodoTask() {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    final record = store.record(todoKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        final task = TodoTask.fromJson(json.decode(snapshot.value as String));
        return task;
      } else {
        return TodoTask();
      }
    });
  }

  Future<void> _storeTodo(TodoTask task) async {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    // debugPrint(
    //     "data => ${task.offering!.name}, iscompeleted => ${task.isCompleted}");
    await store.record(todoKey).put(db, json.encode(task.toJson()));
  }

  SembastDataStore get _sembastDataStore {
    return ref.read(sembastDataStoreProvider).requireValue;
  }
}

@Riverpod(keepAlive: true)
TodoCacheTaskRepository todoTaskCacheRespository(Ref ref) {
  return TodoCacheTaskRepository(ref);
}

@riverpod
Stream<TodoTask> watchTodoTask(Ref ref) {
  final cacheRepo = ref.read(todoTaskCacheRespositoryProvider);
  return cacheRepo.watchTodoTask();
}
