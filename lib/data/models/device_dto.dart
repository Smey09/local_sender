import 'package:equatable/equatable.dart';

class DeviceDto extends Equatable {
  final String id;
  final String name;
  final String ipAddress;
  final int port;
  final String? os;

  const DeviceDto({
    required this.id,
    required this.name,
    required this.ipAddress,
    required this.port,
    this.os,
  });

  factory DeviceDto.fromJson(Map<String, dynamic> json) {
    return DeviceDto(
      id: json['id'],
      name: json['name'],
      ipAddress: json['ipAddress'],
      port: json['port'],
      os: json['os'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ipAddress': ipAddress,
      'port': port,
      'os': os,
    };
  }

  @override
  List<Object?> get props => [id, name, ipAddress, port, os];
}