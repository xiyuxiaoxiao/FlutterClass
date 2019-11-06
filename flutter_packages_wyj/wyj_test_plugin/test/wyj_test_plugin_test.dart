import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wyj_test_plugin/wyj_test_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('wyj_test_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await WyjTestPlugin.platformVersion, '42');
  });
}
