import 'package:cadmean_rpc/cadmean_rpc.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Function call', () {
    test('toJson', () {
      var arg = {
        'test': 'value',
      };
      var call = FunctionCall.withArguments([arg]);
      print(call.toJson());
    });
  });
}
