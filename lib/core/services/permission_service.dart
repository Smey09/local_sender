import 'package:get/get.dart';
import '../utils/permission_utils.dart';

class PermissionService extends GetxService {
  Future<bool> requestStoragePermission() async {
    return await PermissionUtils.requestStoragePermission();
  }

  Future<bool> requestLocationPermission() async {
    return await PermissionUtils.requestLocationPermission();
  }

  Future<bool> hasStoragePermission() async {
    return await PermissionUtils.checkStoragePermission();
  }

  Future<bool> hasLocationPermission() async {
    return await PermissionUtils.checkLocationPermission();
  }
}