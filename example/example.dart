import 'package:cadmean_rpc/cadmean_rpc.dart';

void main() async {
  var rpc = RpcClient('http://testrpc.cadmean.ru');
  var sum = await rpc.function('sum').call([1, 2]);
  print(sum.result); // 3
}
