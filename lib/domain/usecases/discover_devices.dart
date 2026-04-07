import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../core/base/result.dart';
import '../../core/errors/failures.dart';
import '../entities/device.dart';
import '../repositories/device_repository.dart';

class DiscoverDevices {
  final DeviceRepository _repository = Get.find<DeviceRepository>();

  Future<Result<List<Device>>> call() async {
    try {
      final devices = await _repository.discoverDevices();
      return Right(devices);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}