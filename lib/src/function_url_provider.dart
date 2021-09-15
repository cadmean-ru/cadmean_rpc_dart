import 'function.dart';

abstract class FunctionUrlProvider {
  String getUrl(RpcFunction f);
}

class DefaultFunctionUrlProvider implements FunctionUrlProvider {
  var prefix = 'api/rpc';

  @override
  String getUrl(RpcFunction f) {
    return '$prefix/${f.name}';
  }
}
