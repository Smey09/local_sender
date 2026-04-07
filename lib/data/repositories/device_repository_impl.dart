import 'package:get/get.dart';
import '../../domain/repositories/device_repository.dart';
import '../../domain/entities/device.dart';
import '../models/device_dto.dart';
import '../datasources/local/device_local_ds.dart';
import '../datasources/network/mdns_datasource.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceLocalDataSource _localDataSource = Get.find<DeviceLocalDataSource>();
  final MdnsDataSource _mdnsDataSource = Get.find<MdnsDataSource>();

  @override
  Future<List<Device>> discoverDevices() async {
    final devicesDto = await _mdnsDataSource.discoverDevices();
    return devicesDto.map((dto) => Device.fromDto(dto)).toList();
  }

  @override
  Future<List<Device>> getSavedDevices() async {
    final devicesDto = await _localDataSource.getDevices();
    return devicesDto.map((dto) => Device.fromDto(dto)).toList();
  }

  @override
  Future<void> saveDevice(Device device) async {
    final deviceDto = DeviceDto(
      id: device.id,
      name: device.name,
      ipAddress: device.ipAddress,
      port: device.port,
      os: device.os,
    );
    await _localDataSource.saveDevice(deviceDto);
  }

  @override
  Future<void> removeDevice(String deviceId) async {
    await _localDataSource.removeDevice(deviceId);
  }
}