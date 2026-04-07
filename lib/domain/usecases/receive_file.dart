import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../core/base/result.dart';
import '../../core/errors/failures.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class ReceiveFile {
  final TransferRepository _repository = Get.find<TransferRepository>();

  Future<Result<void>> call(Transfer transfer) async {
    try {
      await _repository.receiveFile(transfer);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}