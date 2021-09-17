/// Contains the predefined error codes.
class RpcErrorCode {
  static const int noError = 0;

  static const int functionNotCallable = -100;
  static const int functionNotFound = -101;
  static const int incompatibleRpcVersion = -102;
  static const int invalidArguments = -200;

  static const int encodeError = -300;
  static const int decodeError = -301;

  static const int transportError = -400;
  static const int notSuccessfulStatusCode = -401;

  static const int internalServerError = -500;

  static const int authorizationError = -600;

  static const int preCallChecksFailed = -700;

  static const int niceError = -69;
}

/// Thrown if the function returned an error.
///
/// The code identified the cause of the error.
/// It can be either one of the predefined errors (see [RpcErrorCode])
/// that are negative numbers or a user-defined code that should be
/// positive by convention. Zero indicates no error.
class FunctionError {
  final int code;

  FunctionError(this.code);

  @override
  String toString() {
    return 'Function exited with code $code';
  }
}
