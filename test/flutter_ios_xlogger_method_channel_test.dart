import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_xlogger/flutter_ios_xlogger_method_channel.dart';

void main() {
  MethodChannelFlutterIosXlogger platform = MethodChannelFlutterIosXlogger();
  const MethodChannel channel = MethodChannel('flutter_ios_xlogger');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
