import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offering_status.freezed.dart';

//* offeringId is the with hypen separated name of [Offering] name
typedef OfferingId = String;

@freezed
class OfferingStatus with _$OfferingStatus {
  factory OfferingStatus(
      {required final OfferingId id,
      required final Offering offering,
      @Default(false) final bool? added}) = _OfferingStatus;
}
