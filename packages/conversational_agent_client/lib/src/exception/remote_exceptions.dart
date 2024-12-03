
sealed class RemoteExceptions  {
  final String code;
  final String message;

  const RemoteExceptions({required this.code, required this.message});
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

class ConnectionTimeoutException extends RemoteExceptions {
  ConnectionTimeoutException()
      : super(code: 'connection-time-out', message: "Connection timeout");
}

class ServerTimeOutException extends RemoteExceptions {
  ServerTimeOutException()
      : super(code: 'server-time-out', message: "Application Timeout");
}

class InterConnectionException extends RemoteExceptions {
  InterConnectionException()
      : super(
            code: 'fail-internet-connection',
            message:
                "Fail to connect to the internet. Please check your connection");
}

class ConnectionErrorException extends RemoteExceptions {
  ConnectionErrorException()
      : super(
            code: 'server-connection-exception',
            message: "Can't connect to the server");
}
