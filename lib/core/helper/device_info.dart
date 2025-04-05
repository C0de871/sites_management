import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  late final DeviceInfoPlugin _deviceInfoPlugin;
  DeviceInfo({required DeviceInfoPlugin deviceInfoPlugin}) {
    _deviceInfoPlugin = deviceInfoPlugin;
  }

  Future<bool> isAndroid11OrAbove() async {
    final androidInfo = await _deviceInfoPlugin.androidInfo;
    return androidInfo.version.sdkInt >= 30; //?andriod 11 =SDK 30
  }
}
