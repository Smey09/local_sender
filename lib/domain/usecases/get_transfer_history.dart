import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../core/base/result.dart';
import '../../core/errors/failures.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class GetTransferHistory {
  final TransferRepository _repository = Get.find<TransferRepository>();

  Future<Result<List<Transfer>>> call() async {
    try {
      final transfers = await _repository.getTransferHistory();
      return Right(transfers);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}