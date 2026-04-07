import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/receive_controller.dart';

class ReceiveDialog extends GetView<ReceiveController> {
  const ReceiveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Receive File'),
      content: Obx(() {
        if (controller.isLoading.value) {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Receiving file...'),
            ],
          );
        }

        return const Text('File received successfully!');
      }),
      actions: [
        TextButton(
          onPressed: controller.isLoading.value ? null : () => Get.back(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}