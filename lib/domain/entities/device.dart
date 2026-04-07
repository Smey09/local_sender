import 'package:equatable/equatable.dart';
import '../../data/models/device_dto.dart';

class Device extends Equatable {
  final String id;
  final String name;
  final String ipAddress;
  final int port;
  final String? os;

  const Device({
    required this.id,
    required this.name,
    required this.ipAddress,
    required this.port,
    this.os,
  });

  factory Device.fromDto(DeviceDto dto) {
    return Device(
      id: dto.id,
      name: dto.name,
      ipAddress: dto.ipAddress,
      port: dto.port,
      os: dto.os,
    );
  }

  DeviceDto toDto() {
    return DeviceDto(
      id: id,
      name: name,
      ipAddress: ipAddress,
      port: port,
      os: os,
    );
  }

  @override
  List<Object?> get props => [id, name, ipAddress, port, os];
}