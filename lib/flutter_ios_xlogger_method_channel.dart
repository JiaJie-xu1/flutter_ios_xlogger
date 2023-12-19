import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ios_xlogger_platform_interface.dart';

/// An implementation of [FlutterIosXloggerPlatform] that uses method channels.
class MethodChannelFlutterIosXlogger extends FlutterIosXloggerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_ios_xlogger');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> open(int level, String cacheDir, String logDir,
      String namePrefix, int cacheDays, bool consoleLogOpen, String pubKey) {
    return methodChannel.invokeMethod<void>('open', {
      'level': level,
      'cacheDir': cacheDir,
      'logDir': logDir,
      'namePrefix': namePrefix,
      'cacheDays': cacheDays,
      'consoleLogOpen': consoleLogOpen,
      'pubKey': pubKey
    });
  }

  Future<void> close() {
    return methodChannel.invokeMethod<void>('close');
  }

  Future<void> flush() {
    return methodChannel.invokeMethod<void>('flush');
  }
}
