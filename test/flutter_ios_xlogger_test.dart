import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_xlogger/flutter_ios_xlogger.dart';
import 'package:flutter_ios_xlogger/flutter_ios_xlogger_platform_interface.dart';
import 'package:flutter_ios_xlogger/flutter_ios_xlogger_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIosXloggerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIosXloggerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIosXloggerPlatform initialPlatform = FlutterIosXloggerPlatform.instance;

  test('$MethodChannelFlutterIosXlogger is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIosXlogger>());
  });

  test('getPlatformVersion', () async {
    FlutterIosXlogger flutterIosXloggerPlugin = FlutterIosXlogger();
    MockFlutterIosXloggerPlatform fakePlatform = MockFlutterIosXloggerPlatform();
    FlutterIosXloggerPlatform.instance = fakePlatform;

    expect(await flutterIosXloggerPlugin.getPlatformVersion(), '42');
  });
}
