import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ios_xlogger_method_channel.dart';

abstract class FlutterIosXloggerPlatform extends PlatformInterface {
  /// Constructs a FlutterIosXloggerPlatform.
  FlutterIosXloggerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIosXloggerPlatform _instance = MethodChannelFlutterIosXlogger();

  /// The default instance of [FlutterIosXloggerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIosXlogger].
  static FlutterIosXloggerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIosXloggerPlatform] when
  /// they register themselves.
  static set instance(FlutterIosXloggerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
