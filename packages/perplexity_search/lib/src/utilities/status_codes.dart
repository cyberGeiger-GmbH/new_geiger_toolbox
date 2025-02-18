import 'package:perplexity_search/src/utilities/enums.dart';
import 'package:perplexity_search/src/utilities/logging_handler.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_codes.g.dart';

class StatusCodes {
  final Ref ref;
  const StatusCodes(this.ref);

  StatusCode? getStatus(int? statusCode) {
    final log = ref.read(loggingHandlerProvider("Perplexity search 🌎"));
    if (statusCode == StatusCode.unauthorised.code) {
      log.w("UNAUTHORISED $statusCode: either no API key was provided or it wasn't valid");

      return StatusCode.unauthorised;
    } else if (statusCode == StatusCode.forbidden.code) {
      log.w("FORBIDDEN: No user agent has been specified in the request");

      return StatusCode.forbidden;
    } else if (statusCode == StatusCode.notFound.code) {
      log.i("NOT FOUND $statusCode: the account could not be found");

      return StatusCode.notFound;
    } else if (statusCode == StatusCode.tooManyRequest.code) {
      log.w("TOO MANY REQUEST $statusCode: the rate limit has been exceeded");

      return StatusCode.tooManyRequest;
    } else if (statusCode == StatusCode.serviceUnavailable.code) {
      log.w("SERVICE UNAVAILABLE $statusCode: conversational_agent_client not available");

      return StatusCode.serviceUnavailable;
    } else if (statusCode == StatusCode.success.code) {
      log.i("SUCCESS $statusCode=>");

      return StatusCode.success;
    } else {
      return null;
    }
  }
}

@riverpod
StatusCodes statusCodes(Ref ref) {
  return StatusCodes(ref);
}
