import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_offering.freezed.dart';

//* offeringId is the with hypen separated name of [Offering] name
typedef OfferingId = String;

@freezed
class TodoOffing with _$TodoOffing {
  factory TodoOffing(
      {required OfferingId id,
      required Offering offering,
      required bool added,
      final DateTime? datePlanned}) = _OfferingStatus;
}
