// lib/utils/permission_util.dart

import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  /// Requests necessary permissions for Bluetooth scanning (Bluetooth and Location)
  static Future<bool> requestBluetoothPermissions() async {
    // Request permissions for Android 12+ (Scan and Connect)
    final bluetoothScanStatus = await Permission.bluetoothScan.request();
    final bluetoothConnectStatus = await Permission.bluetoothConnect.request();

    // Location permission is still needed for Bluetooth scanning on older Android
    final locationStatus = await Permission.locationWhenInUse.request();

    // Check if all essential permissions are granted
    if (bluetoothScanStatus.isGranted &&
        bluetoothConnectStatus.isGranted &&
        locationStatus.isGranted) {
      return true;
    } else {
      // If any essential permission is permanently denied, prompt user to open settings.
      if (bluetoothScanStatus.isPermanentlyDenied || bluetoothConnectStatus.isPermanentlyDenied || locationStatus.isPermanentlyDenied) {
        openAppSettings();
      }
      return false;
    }
  }
}