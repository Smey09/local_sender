import 'package:flutter/material.dart';
import '../../../../domain/entities/device.dart';
import 'device_tile.dart';

class DeviceList extends StatelessWidget {
  final List<Device> devices;

  const DeviceList({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return DeviceTile(
          device: device,
          onTap: () {
            // Navigate to transfer page
            // Get.toNamed('/transfer', arguments: device);
          },
        );
      },
    );
  }
}