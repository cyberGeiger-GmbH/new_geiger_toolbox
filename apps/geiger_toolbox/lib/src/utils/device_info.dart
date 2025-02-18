import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info.g.dart';

enum DeviceType { android, iphone, windows, mac, linux, web }

class Device {
  final String model;
  final DeviceType type;
  final String version;

  const Device({required this.model, required this.version, required this.type});
}

//get the device info of current device
@Riverpod(keepAlive: true)
Future<Device> deviceType(Ref ref) async {
  final plugin = DeviceInfoPlugin();
  if (defaultTargetPlatform == TargetPlatform.android) {
    final data = await plugin.androidInfo;
    return Device(version: "android ${data.version.release}", type: DeviceType.android, model: data.model);
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    final data = await plugin.iosInfo;
    return Device(version: "${data.systemName} ${data.systemVersion}", type: DeviceType.iphone, model: data.name);
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    final data = await plugin.windowsInfo;
    return Device(
      version: 'Windows ${data.majorVersion}.${data.minorVersion} (Build ${data.buildNumber})',
      type: DeviceType.windows,
      model: data.productName,
    );
  } else if (defaultTargetPlatform == TargetPlatform.macOS) {
    final data = await plugin.macOsInfo;
    return Device(version: '${data.osRelease} (${data.arch})', type: DeviceType.mac, model: data.modelName);
  } else if (defaultTargetPlatform == TargetPlatform.linux) {
    final data = await plugin.linuxInfo;
    return Device(version: '${data.version} (${data.id})', type: DeviceType.linux, model: data.prettyName);
  } else {
    final data = await plugin.webBrowserInfo;

    return Device(version: "${data.appName} ${data.appVersion}", type: DeviceType.web, model: data.browserName.name);
  }
}
