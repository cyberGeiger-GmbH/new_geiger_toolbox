import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
part 'task.freezed.dart';
part 'task.g.dart';

typedef OfferID = String;

@freezed
class Task with _$Task {
  const Task._();

  factory Task({@Default({}) final Map<OfferID, TodoTask> items}) = _Task;
  factory Task.fromMap(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  String toJsonObject() => json.encode(toJson());
}

extension TaskItems on Task {
  List<TodoTask> toItemsList() {
    return items.entries
        .map(
          (entry) => TodoTask(
              offering: entry.value.offering,
              isCompleted: entry.value.isCompleted),
        )
        .toList();
  }
}
