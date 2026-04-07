import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/storage_service.dart';
import '../state/settings_state.dart';

class SettingsController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();
  
  final RxBool isDarkMode = false.obs;
  final Rx<SettingsState> state = const SettingsState().obs;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final darkMode = _storage.getBool('dark_mode') ?? false;
    isDarkMode.value = darkMode;
  }

  Future<void> toggleTheme(bool value) async {
    isDarkMode.value = value;
    await _storage.saveBool('dark_mode', value);
    
    // Update theme
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}