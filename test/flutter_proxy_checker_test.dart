import 'package:flutter/services.dart';
import 'package:flutter_proxy_checker/flutter_proxy_checker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_proxy_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isEnabledProxy', () async {
    var result = await FlutterProxyChecker.isEnabledProxy();
    expect(result, true);
  });
}
