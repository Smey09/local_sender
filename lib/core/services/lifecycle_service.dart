import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LifecycleService extends GetxService with WidgetsBindingObserver {
  final RxBool _isAppInForeground = true.obs;

  bool get isAppInForeground => _isAppInForeground.value;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _isAppInForeground.value = true;
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _isAppInForeground.value = false;
        break;
    }
  }
}