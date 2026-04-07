import '../entities/device.dart';

abstract class DeviceRepository {
  Future<List<Device>> discoverDevices();
  Future<List<Device>> getSavedDevices();
  Future<void> saveDevice(Device device);
  Future<void> removeDevice(String deviceId);
}