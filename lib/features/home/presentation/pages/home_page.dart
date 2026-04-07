import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/device_list.dart';
import '../widgets/empty_state.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Sender'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.discoverDevices,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed('/settings'),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.devices.isEmpty) {
          return const EmptyState();
        }

        return DeviceList(devices: controller.devices);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.discoverDevices,
        child: const Icon(Icons.search),
      ),
    );
  }
}