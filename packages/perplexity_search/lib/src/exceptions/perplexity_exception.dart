sealed class PerplexityException {
  final String code;
  final String message;

  const PerplexityException({required this.code, required this.message});
  @override
  String toString() => 'PerplexityException(code: $code, message: $message)';
}

class ServerException extends PerplexityException {
  ServerException({required super.code, required super.message});
}
