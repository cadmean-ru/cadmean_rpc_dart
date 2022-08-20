import 'dart:typed_data';

import 'function_call.dart';
import 'function_output.dart';
import 'rpc_client.dart';
import 'function_error.dart';
import 'rpc_data_type.dart';
import 'jwt_auth_ticket.dart';

/// A reference to a cadRPC function.
class RpcFunction {
  final String name;
  RpcClient _client;

  RpcFunction(this.name, this._client);

  /// Calls this function on the server with the given arguments.
  /// Returns [FunctionOutput] that will contain the returned value or an error.
  Future<FunctionOutput> call([List arguments = const []]) async {
    var responseData = await _makeCallAndSend(arguments);
    var outputJson = _client.configuration.codecProvider.decode(responseData);
    var output = FunctionOutput.fromJson(outputJson);
    _processMetaData(output);
    return output;
  }

  /// Calls this function on the server with the given arguments.
  /// Returns the result of the function.
  /// Throws [FunctionError] if the call failed with an error.
  Future<dynamic> callThrowing([List arguments = const []]) async {
    var output = await call(arguments);
    if (output.error != null && output.error != RpcErrorCode.noError) {
      throw FunctionError(output.error!);
    }
    return output.result;
  }

  Future<Uint8List> _makeCallAndSend(List arguments) {
    var call = FunctionCall.withArguments(arguments);
    _authorizeCallIfPossible(call);
    return _sendCall(call);
  }

  Future<Uint8List> _sendCall(FunctionCall call) {
    var data = _client.configuration.codecProvider.encode(call.toJson());
    var url =
        '${_client.serverUrl}/${_client.configuration.functionUrlProvider.getUrl(this)}';
    return _client.configuration.transportProvider
        .send(url, data, _client.configuration.codecProvider.contentType);
  }

  void _authorizeCallIfPossible(FunctionCall call) {
    if (_client.configuration.authTicketHolder.ticket != null) {
      call.authorization =
          _client.configuration.authTicketHolder.ticket!.accessToken;
    }
  }

  void _processMetaData(FunctionOutput output) {
    if (output.metaData == null) return;
    var meta = output.metaData as Map<String, dynamic>;

    if (meta['resultType'] == RpcDataType.authTicket) {
      var ticker =
          JwtAuthTicket.fromJson(output.result as Map<String, dynamic>);
      _client.configuration.authTicketHolder.ticket = ticker;
    }
  }
}
