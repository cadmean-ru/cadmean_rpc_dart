import 'rpc_configuration.dart';
import 'function.dart';

/// RpcClient is the main class that you use to make cadRPC calls.
class RpcClient {
  final String serverUrl;
  final RpcConfiguration configuration = RpcConfiguration.def();

  /// Creates a new RpcClient instance with the given server url.
  RpcClient(this.serverUrl);

  /// Creates an instance of [RpcFunction] with the given name.
  ///
  /// The function's name must match the name of the function on the server.
  RpcFunction function(String name) {
    return RpcFunction(name, this);
  }
}
