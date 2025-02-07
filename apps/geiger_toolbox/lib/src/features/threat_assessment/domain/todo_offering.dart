import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_offering.freezed.dart';

//* offeringId is the with hypen separated name of [Offering] name
typedef OfferingId = String;

enum Status { recommended, planned, done }

@freezed
class TodoOffering with _$TodoOffering {
  const factory TodoOffering(
      {required OfferingId id,
      required Status status,
      required DateTime dateRecommendated,
      DateTime? lastUpdated,
      required Offering offering}) = _TodoOffering;
}
