// ignore_for_file: public_member_api_docs, sort_constructors_first
///Base class fro all cliend-side errors that can be generated by the app
sealed class AppException implements Exception {
  const AppException({required this.code, required this.message});
  final String code;
  final String message;

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}

//
class UserNotFoundException extends AppException {
  UserNotFoundException() : super(code: 'user-not-found', message: "User profile has not be created");
}


class CachedNewsFeedException extends AppException {
  CachedNewsFeedException () : super(code: 'fail-read-newsfeed-cache', message: "Fail to retrived cached news data");
}

class CachedNewsFeedStoreException extends AppException {
  CachedNewsFeedStoreException () : super(code: 'fail-cache-newsfeed', message: "Fail to cache news data");
}

