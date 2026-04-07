import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme'),
            subtitle: const Text('Light/Dark mode'),
            trailing: Obx(() => Switch(
              value: controller.isDarkMode.value,
              onChanged: controller.toggleTheme,
            )),
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Version 1.0.0'),
            onTap: () {
              // Show about dialog
            },
          ),
        ],
      ),
    );
  }
}