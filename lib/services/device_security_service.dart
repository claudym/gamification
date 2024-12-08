import 'dart:io';

// import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceSecurityService {
  Future<bool> isDeviceSecure() async {
    try {
      // Check if the device is jailbroken or rooted
      // bool isJailBroken = await FlutterJailbreakDetection.jailbroken;

      // Check if the device is real or an emulator
      bool isRealDevice = await _isRealDevice();
      // return isRealDevice && !isJailBroken;
      return isRealDevice;
    } catch (e) {
      print('Error checking device security: $e');
      return false;
    }
  }

  Future<bool> _isRealDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return !androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    }
    return false;
  }
}
