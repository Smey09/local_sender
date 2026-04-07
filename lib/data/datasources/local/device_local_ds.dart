import 'dart:convert';
import 'package:get/get.dart';
import '../../models/device_dto.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/constants/storage_constants.dart';

abstract class DeviceLocalDataSource {
  Future<List<DeviceDto>> getDevices();
  Future<void> saveDevice(DeviceDto device);
  Future<void> removeDevice(String deviceId);
  Future<void> clearDevices();
}

class DeviceLocalDataSourceImpl implements DeviceLocalDataSource {
  final StorageService _storage = Get.find<StorageService>();

  @override
  Future<List<DeviceDto>> getDevices() async {
    final devicesJson = _storage.getString(StorageConstants.devicesKey);
    if (devicesJson == null) return [];

    final devicesList = json.decode(devicesJson) as List;
    return devicesList.map((json) => DeviceDto.fromJson(json)).toList();
  }

  @override
  Future<void> saveDevice(DeviceDto device) async {
    final devices = await getDevices();
    devices.removeWhere((d) => d.id == device.id);
    devices.add(device);

    final devicesJson = json.encode(devices.map((d) => d.toJson()).toList());
    await _storage.saveString(StorageConstants.devicesKey, devicesJson);
  }

  @override
  Future<void> removeDevice(String deviceId) async {
    final devices = await getDevices();
    devices.removeWhere((d) => d.id == deviceId);

    final devicesJson = json.encode(devices.map((d) => d.toJson()).toList());
    await _storage.saveString(StorageConstants.devicesKey, devicesJson);
  }

  @override
  Future<void> clearDevices() async {
    await _storage.remove(StorageConstants.devicesKey);
  }
}