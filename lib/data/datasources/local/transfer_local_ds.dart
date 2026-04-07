import 'dart:convert';
import 'package:get/get.dart';
import '../../models/transfer_dto.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/constants/storage_constants.dart';

abstract class TransferLocalDataSource {
  Future<List<TransferDto>> getTransfers();
  Future<void> saveTransfer(TransferDto transfer);
  Future<void> updateTransfer(TransferDto transfer);
  Future<void> removeTransfer(String transferId);
  Future<void> clearTransfers();
}

class TransferLocalDataSourceImpl implements TransferLocalDataSource {
  final StorageService _storage = Get.find<StorageService>();

  @override
  Future<List<TransferDto>> getTransfers() async {
    final transfersJson = _storage.getString(StorageConstants.transfersKey);
    if (transfersJson == null) return [];

    final transfersList = json.decode(transfersJson) as List;
    return transfersList.map((json) => TransferDto.fromJson(json)).toList();
  }

  @override
  Future<void> saveTransfer(TransferDto transfer) async {
    final transfers = await getTransfers();
    transfers.add(transfer);

    final transfersJson = json.encode(transfers.map((t) => t.toJson()).toList());
    await _storage.saveString(StorageConstants.transfersKey, transfersJson);
  }

  @override
  Future<void> updateTransfer(TransferDto transfer) async {
    final transfers = await getTransfers();
    final index = transfers.indexWhere((t) => t.id == transfer.id);
    if (index != -1) {
      transfers[index] = transfer;
      final transfersJson = json.encode(transfers.map((t) => t.toJson()).toList());
      await _storage.saveString(StorageConstants.transfersKey, transfersJson);
    }
  }

  @override
  Future<void> removeTransfer(String transferId) async {
    final transfers = await getTransfers();
    transfers.removeWhere((t) => t.id == transferId);

    final transfersJson = json.encode(transfers.map((t) => t.toJson()).toList());
    await _storage.saveString(StorageConstants.transfersKey, transfersJson);
  }

  @override
  Future<void> clearTransfers() async {
    await _storage.remove(StorageConstants.transfersKey);
  }
}