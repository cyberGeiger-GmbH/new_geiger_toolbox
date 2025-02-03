import 'package:conversational_agent_client/src/utilities/log_handling.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'status_codes.g.dart';

class StatusCodes {
  final Ref ref;
  const StatusCodes(this.ref);

  StatusCode? getStatus(int? statusCode) {
    final log = ref.read(logHandlerProvider("StatusCode 🌎", packageName: "Conversational_agent_client"));
    
    if (statusCode == StatusCode.unauthorised.code) {
      log.w("UNAUTHORISED: either no API key was provided or it wasn't valid");

      return StatusCode.unauthorised;
    } else if (statusCode == StatusCode.forbidden.code) {
      log.w("FORBIDDEN: No user agent has been specified in the request");

      return StatusCode.forbidden;
    } else if (statusCode == StatusCode.notFound.code) {
      log.i("NOT FOUND: the account could not be found");

      return StatusCode.notFound;
    } else if (statusCode == StatusCode.tooManyRequest.code) {
      log.w("TOO MANY REQUEST: the rate limit has been exceeded");

      return StatusCode.tooManyRequest;
    } else if (statusCode == StatusCode.serviceUnavailable.code) {
      log.w("SERVICE UNAVAILABLE: conversational_agent_client not available");

      return StatusCode.serviceUnavailable;
    } else if (statusCode == StatusCode.success.code) {
      log.i("$statusCode");

      return StatusCode.success;
    } else {
      return null;
    }
  }
}

enum StatusCode {
  success(200),
  found(302),
  unauthorised(401),
  forbidden(403),
  notFound(404),
  tooManyRequest(429),
  serviceUnavailable(503);

  const StatusCode(this.code);
  final int code;
}

@riverpod
StatusCodes statusCodes(Ref ref) {
  return StatusCodes(ref);
}
