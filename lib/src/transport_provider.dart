import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'function_error.dart';

abstract class TransportProvider {
  Future<Uint8List> send(String url, Uint8List data, String contentType);
}

class HttpTransportProvider implements TransportProvider {
  final _client = http.Client();

  @override
  Future<Uint8List> send(String url, Uint8List data, String contentType) async {
    var req = http.Request('POST', Uri.parse(url));
    req.bodyBytes = data;
    req.headers['Content-Type'] = contentType;
    req.headers['Cadmean-RPC-Version'] = '3.0';

    http.StreamedResponse res;
    try {
      res = await _client.send(req);
    } catch (e) {
      throw FunctionError(RpcErrorCode.transportError);
    }

    if (res.statusCode != 200) {
      throw FunctionError(RpcErrorCode.notSuccessfulStatusCode);
    }

    return res.stream.toBytes();
  }
}
