import 'package:cadmean_rpc/cadmean_rpc.dart';
import 'package:test/test.dart';

void main() {
  group('RPC', () {
    var rpc = RpcClient('http://testrpc.cadmean.ru');

    test('Should make call concat', () async {
      var res = await rpc.function('concat').call(['am', 'og', 'us']);
      expect(res.error, equals(RpcErrorCode.noError));
      expect(res.result, equals('amogus'));
    });

    test('Should make call getDate', () async {
      var res = await rpc.function('getDate').call();
      expect(res.error, equals(RpcErrorCode.noError));
      print(res.result);
    });

    test('Should make call sum', () async {
      var res = await rpc.function('sum').call([42, 27]);
      expect(res.error, equals(RpcErrorCode.noError));
      expect(res.result, equals(69));
    });

    test('Should make call square', () async {
      var res = await rpc.function('square').call([3]);
      expect(res.error, equals(RpcErrorCode.noError));
      expect(res.result, equals(9));
    });

    test('Should make call error', () async {
      var res = await rpc.function('error').call([true]);
      expect(res.error, equals(42));
    });

    test('Should make call weatherForecast.get', () async {
      var res = await rpc.function('weatherForecast.get').call();
      expect(res.error, equals(RpcErrorCode.noError));
      print(res.result);
    });

    test('Should make call user.get', () async {
      var res =
          await rpc.function('auth').call(['email@example.com', 'password']);
      expect(res.error, equals(RpcErrorCode.noError));

      res = await rpc.function('user.get').call();
      expect(res.error, equals(RpcErrorCode.noError));

      print(res.result);
    });
  });
}
