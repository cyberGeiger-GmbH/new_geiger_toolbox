import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_offering.freezed.dart';

//* offeringId is the with hypen separated name of [Offering] name
typedef OfferingId = String;

enum Status { recommended, planned, done }

@freezed
class TodoOffering with _$TodoOffering {
  const factory TodoOffering({
    required OfferingId id,
    required Status status,

    required DateTime dateRecommendated,
    DateTime? lastUpdated,
    required Offering offering,
  }) = _TodoOffering;
}

extension TodoOfferingListSort on List<TodoOffering> {
  List<TodoOffering> sortByStatus() {
    sort((a, b) {
      // Prioritize 'planned' status first
      if (a.status == Status.planned && b.status != Status.planned) {
        return -1; // `a` should come first
      } else if (b.status == Status.planned && a.status != Status.planned) {
        return 1; // `b` should come first
      }

      // If both are 'planned', sort by dateRecommendated (or another criterion)
      if (a.status == Status.planned && b.status == Status.planned) {
        return a.dateRecommendated.compareTo(b.dateRecommendated);
      }

      // For the 'done' and 'recommended' statuses, retain their relative order.
      if (a.status == Status.done && b.status != Status.done) {
        return 1; // `a` (done) comes after other statuses
      } else if (b.status == Status.done && a.status != Status.done) {
        return -1; // `b` (done) comes after other statuses
      }

      // For 'recommended' status, keep it in the middle.
      return a.status.index.compareTo(b.status.index);
    });

    return this;
  }
}
