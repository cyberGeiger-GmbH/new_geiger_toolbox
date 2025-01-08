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
