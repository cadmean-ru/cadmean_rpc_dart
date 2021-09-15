import 'dart:convert';
import 'dart:typed_data';

abstract class CodecProvider {
  Uint8List encode(dynamic src);
  dynamic decode(Uint8List data);
  String get contentType;
}

class JsonCodecProvider implements CodecProvider {
  @override
  dynamic decode(Uint8List data) {
    return jsonDecode(String.fromCharCodes(data));
  }

  @override
  Uint8List encode(dynamic src) {
    return Uint8List.fromList(jsonEncode(src).codeUnits);
  }

  @override
  String get contentType => 'application/json';
}
