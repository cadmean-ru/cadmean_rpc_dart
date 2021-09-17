/// Contains the result of a cadRPC function call or an error code.
class FunctionOutput {
  final int error;
  final dynamic result;
  Map<String, dynamic>? metaData = {};

  FunctionOutput.withError(this.error) : result = null;

  FunctionOutput.withResult(this.result) : error = 0;

  FunctionOutput.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        result = json['result'],
        metaData = json['metaData'];
}
