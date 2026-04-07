import 'package:dartz/dartz.dart';
import '../../core/base/result.dart';
import '../../core/errors/failures.dart';

class CancelTransfer {
  Future<Result<void>> call(String transferId) async {
    try {
      // Implementation to cancel transfer
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}