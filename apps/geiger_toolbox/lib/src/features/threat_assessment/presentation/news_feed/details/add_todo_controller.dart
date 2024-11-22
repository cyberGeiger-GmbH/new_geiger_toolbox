import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_todo_controller.g.dart';

@riverpod
class AddTodoController extends _$AddTodoController {
  @override
  TodoTask build(TodoTask todo) {
    return todo;
  }

  void onChange(TodoTask todo) {
    state = todo;
  }
}
