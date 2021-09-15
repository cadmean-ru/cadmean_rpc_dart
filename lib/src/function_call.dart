import 'dart:convert';

class FunctionCall {
  List<dynamic> arguments = List.empty();
  String authorization = '';
  Map<String, dynamic> metaData = {};

  FunctionCall();

  FunctionCall.withArguments(this.arguments);

  FunctionCall.fromJson(Map<String, dynamic> json)
      : arguments = json['args'],
        authorization = json['auth'],
        metaData = json['meta'];

  Map toJson() {
    var jsonArgs = arguments.map((e) {
      if (e is List || e is Map) return jsonEncode(e);
      return e;
    }).toList();
    return <String, dynamic>{
      'args': jsonArgs,
      'auth': authorization,
    };
  }
}
