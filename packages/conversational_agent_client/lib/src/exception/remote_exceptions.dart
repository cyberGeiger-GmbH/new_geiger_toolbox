sealed class RemoteExceptions implements Exception {
  const RemoteExceptions({required this.code, required this.message});
  final String code;
  final String message;

  @override
  String toString() => 'AppException(code: $code, message: $message)';
}

//
class NewsFeedException extends RemoteExceptions {
  NewsFeedException()
      : super(
            code: 'news-feed-errror',
            message: "Failed get recommendated news feed for this SME");
}
