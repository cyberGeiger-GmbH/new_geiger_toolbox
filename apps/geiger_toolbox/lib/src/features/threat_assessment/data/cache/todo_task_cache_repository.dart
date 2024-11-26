import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';
import 'package:geiger_toolbox/src/persistence/sembast_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'todo_task_cache_repository.g.dart';

class TodoCacheTaskRepository {
  TodoCacheTaskRepository(this.ref);
  final Ref ref;
  static const todoKey = 'todoObjectKey';

  Future<void> setTask(Task task) async {
    try {
      await _storeTodo(task);
    } catch (e) {
      throw AddTodoTaskRepositryException();
    }
  }

  Future<Task> fetchTodoTask() async {
    try {
      final dataStore = _sembastDataStore;
      final db = dataStore.db;
      final store = dataStore.store;
      final data = await store.record(todoKey).get(db) as String?;
      if (data != null) {
        return Task.fromJson(data);
      } else {
        return Task();
      }
    } catch (e) {
      throw FetchTodoTaskRepositryException();
    }
  }

  Stream<Task> watchTodoTask() {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    final record = store.record(todoKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        final task = Task.fromJson(snapshot.value as String);
        return task;
      } else {
        return Task();
      }
    });
  }

  Future<void> _storeTodo(Task task) async {
    final dataStore = _sembastDataStore;
    final db = dataStore.db;
    final store = dataStore.store;
    await store.record(todoKey).put(db, task.toJsonObject());
  }

  SembastDataStore get _sembastDataStore {
    return ref.read(sembastDataStoreProvider).requireValue;
  }
}

@Riverpod(keepAlive: true)
TodoCacheTaskRepository todoTaskCacheRespository(Ref ref) {
  return TodoCacheTaskRepository(ref);
}

