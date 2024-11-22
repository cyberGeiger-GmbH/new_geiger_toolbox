import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_task.freezed.dart';
part 'todo_task.g.dart';

@freezed
class TodoTask with _$TodoTask {
  factory TodoTask(
      {final Offering? offering,
      @Default(false) final bool? isCompleted}) = _TodoTask;

  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);
}
