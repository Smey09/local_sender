import 'package:get/get.dart';
import '../../../../domain/entities/device.dart';
import '../../../../domain/usecases/discover_devices.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final DiscoverDevices _discoverDevices = Get.find<DiscoverDevices>();
  
  final RxList<Device> devices = <Device>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<HomeState> state = const HomeState().obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedDevices();
  }

  Future<void> loadSavedDevices() async {
    // Load saved devices from repository
  }

  Future<void> discoverDevices() async {
    isLoading.value = true;
    errorMessage.value = '';
    
    final result = await _discoverDevices();
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        state.value = HomeState.error(failure.message);
      },
      (discoveredDevices) {
        devices.assignAll(discoveredDevices);
        state.value = HomeState.success(discoveredDevices);
      },
    );
    
    isLoading.value = false;
  }
}