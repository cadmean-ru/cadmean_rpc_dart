class FunctionCall {
  List<dynamic> arguments = List.empty();
  String authorization = '';
  Map<String, dynamic> metaData = {};

  FunctionCall();

  FunctionCall.withArguments(this.arguments);

  FunctionCall.fromJson(Map<String, dynamic> json)
      : arguments = json['args'],
        authorization = json['auth'],
        metaData = json['metaData'];

  Map toJson() {
    return <String, dynamic>{
      'args': arguments,
      'auth': authorization,
    };
  }
}
