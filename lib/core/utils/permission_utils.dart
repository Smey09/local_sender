import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  static Future<bool> checkStoragePermission() async {
    return await Permission.storage.isGranted;
  }

  static Future<bool> checkLocationPermission() async {
    return await Permission.location.isGranted;
  }
}