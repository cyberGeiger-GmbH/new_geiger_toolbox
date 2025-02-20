import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todos_category_controller.g.dart';

@Riverpod(keepAlive: true)
class TodosCategoryController extends _$TodosCategoryController {
  @override
  TodoOfferingCategory build(TodoOfferingCategory category) {
    return category.copyWith(isExpanded: true);
  }

  void toggleExpanded(bool isExpanded) {
    state = state.copyWith(isExpanded: isExpanded);
  }
}
