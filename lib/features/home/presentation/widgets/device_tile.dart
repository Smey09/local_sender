import 'package:flutter/material.dart';
import '../../../../domain/entities/device.dart';

class DeviceTile extends StatelessWidget {
  final Device device;
  final VoidCallback? onTap;

  const DeviceTile({
    super.key,
    required this.device,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.devices),
      title: Text(device.name),
      subtitle: Text('${device.ipAddress}:${device.port}'),
      trailing: device.os != null ? Text(device.os!) : null,
      onTap: onTap,
    );
  }
}