import 'rpc_configuration.dart';
import 'function.dart';

class RpcClient {
  final String serverUrl;
  final RpcConfiguration configuration = RpcConfiguration.def();

  RpcClient(this.serverUrl);

  RpcFunction function(String name) {
    return RpcFunction(name, this);
  }
}
