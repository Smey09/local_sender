import 'package:get/get.dart';
import '../../../domain/usecases/receive_file.dart';
import '../presentation/controllers/receive_controller.dart';

class ReceiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiveFile>(() => ReceiveFile());
    Get.lazyPut<ReceiveController>(() => ReceiveController());
  }
}