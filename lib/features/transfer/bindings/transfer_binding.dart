import 'package:get/get.dart';
import '../../../domain/usecases/get_transfer_history.dart';
import '../presentation/controllers/transfer_controller.dart';

class TransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetTransferHistory>(() => GetTransferHistory());
    Get.lazyPut<TransferController>(() => TransferController());
  }
}