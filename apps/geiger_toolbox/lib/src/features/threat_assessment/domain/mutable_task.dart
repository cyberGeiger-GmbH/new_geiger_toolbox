import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/domain/task.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';

extension MutableTask on Task {
  /// add an new todo to Task by *overriding* the todoTask isCompleted attribute if it already exist
  Task addTodo(TodoTask todo) {
    final key = _getOfferid(todo);
    final copy = Map<OfferID, TodoTask>.from(items);
    copy[key] = todo;
    return Task(items: copy);
  }

  // add a List<TodoTask> to the [Task] by **updating** the todoTask if it already exists
  Task addTodos(List<TodoTask> todos) {
    final copy = Map<OfferID, TodoTask>.from(items);
    for (var todo in todos) {
      final key = _getOfferid(todo);
      copy[key] = todo;
    }
    return Task(items: copy);
  }

  Task removeTodoById(TodoTask todo) {
    final key = _getOfferid(todo);
    final copy = Map<OfferID, TodoTask>.from(items);
    copy.remove(key);
    return Task(items: copy);
  }

  Task updateTodoIfExists(TodoTask todo) {
    final key = _getOfferid(todo);
    if (items.containsKey(key)) {
      final copy = Map<OfferID, TodoTask>.from(items);
      copy[key] = todo;
      return Task(items: copy);
    } else {
      return this;
    }
  }

  Task updateTodosIfExists(List<Recommendation> recommendations) {
    final copy = <OfferID, TodoTask>{};

    for (var reco in recommendations) {
      for (var protect in reco.offerings) {
        String key = protect.name.toLowerCase().replaceSpacesWithHyphen;

        if (items.containsKey(key)) {
          copy[reco.name] = TodoTask(
              offering: Offering(name: protect.name, summary: protect.summary),
              isCompleted: true);
        } else {
          copy[reco.name] = TodoTask(
              offering: Offering(name: protect.name, summary: protect.summary),
              isCompleted: false);
        }
      }
    }
    return Task(items: copy);
  }

  Task clear() {
    return Task();
  }

  String _getOfferid(TodoTask todo) =>
      todo.offering.name.toLowerCase().replaceSpacesWithHyphen;
}
