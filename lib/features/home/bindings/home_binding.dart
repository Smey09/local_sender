import 'package:get/get.dart';
import '../../../domain/usecases/discover_devices.dart';
import '../presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverDevices>(() => DiscoverDevices());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}