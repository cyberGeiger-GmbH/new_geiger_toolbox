import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_todo_controller.g.dart';

@riverpod
class AddTodoController extends _$AddTodoController {
  @override
  Todo build(Todo todo) {
    return todo;
  }

  void onChange(Todo todo) {
    state = todo;
  }
}
