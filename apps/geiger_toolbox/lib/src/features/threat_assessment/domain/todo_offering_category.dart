import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

class TodoOfferingCategory {
  final String category;
  final List<TodoOffering> offerings;
  bool isExpanded; // Tracks whether the category is expanded or collapsed

  TodoOfferingCategory({required this.category, required this.offerings, this.isExpanded = true});

  TodoOfferingCategory copyWith({bool? isExpanded}) {
    return TodoOfferingCategory(category: category, offerings: offerings, isExpanded: isExpanded ?? this.isExpanded);
  }

  @override
  String toString() {
    return 'TodoOfferingCategory(category: $category, offerings: $offerings, isExpanded: $isExpanded)';
  }
}
