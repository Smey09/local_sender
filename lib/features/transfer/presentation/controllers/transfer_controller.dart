import 'package:get/get.dart';
import '../../../../domain/entities/transfer.dart';
import '../../../../domain/usecases/get_transfer_history.dart';
import '../state/transfer_state.dart';

class TransferController extends GetxController {
  final GetTransferHistory _getTransferHistory = Get.find<GetTransferHistory>();
  
  final RxList<Transfer> transfers = <Transfer>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<TransferState> state = const TransferState().obs;

  @override
  void onInit() {
    super.onInit();
    loadTransferHistory();
  }

  Future<void> loadTransferHistory() async {
    isLoading.value = true;
    errorMessage.value = '';
    
    final result = await _getTransferHistory();
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        state.value = TransferState.error(failure.message);
      },
      (transferList) {
        transfers.assignAll(transferList);
        state.value = TransferState.success(transferList);
      },
    );
    
    isLoading.value = false;
  }
}