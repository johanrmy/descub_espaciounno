import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static Future<Map<String, String>> getDeviceModelAndBrand() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    Map<String, String> deviceData = {'model': 'Unknown', 'brand': 'Unknown'};

    try {
      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceData['model'] = iosInfo.utsname.machine;
        deviceData['brand'] = 'Apple';
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceData['model'] = androidInfo.model;
        deviceData['brand'] = androidInfo.brand;
      }
    } catch (e) {
      print('Error getting device info: $e');
    }

    return deviceData;
  }

  static Future<String> getDeviceModel() async {
    return (await getDeviceModelAndBrand())['model'] ?? 'Unknown';
  }

  static Future<String> getDeviceBrand() async {
    return (await getDeviceModelAndBrand())['brand'] ?? 'Unknown';
  }
}
