/// Contains the predefined error codes.
class RpcErrorCode {
  static const String? noError = null;

  static const String functionNotCallable = "function_not_callable";
  static const String functionNotFound = "function_not_found";
  static const String incompatibleRpcVersion = "incompatible_rpc_version";
  static const String invalidArguments = "invalid_arguments";

  static const String encodeError = "encode_error";
  static const String decodeError = "decode_error";

  static const String transportError = "transport_error";
  static const String notSuccessfulStatusCode = "not_successful_status_code";

  static const String internalServerError = "internal_server_error";

  static const String authorizationError = "authorization_error";

  static const String preCallChecksFailed = "pre_call_checks_failed";

  static const String niceError = "nice_error";
}

/// Thrown if the function returned an error.
///
/// The code identified the cause of the error.
/// It can be either one of the predefined errors (see [RpcErrorCode])
/// that are negative numbers or a user-defined code that should be
/// positive by convention. Zero indicates no error.
class FunctionError {
  final String code;

  FunctionError(this.code);

  @override
  String toString() {
    return 'Function exited with code $code';
  }
}
