import '../entities/transfer.dart';

abstract class TransferRepository {
  Future<List<Transfer>> getTransferHistory();
  Future<void> saveTransfer(Transfer transfer);
  Future<void> updateTransfer(Transfer transfer);
  Future<void> sendFile(Transfer transfer);
  Future<void> receiveFile(Transfer transfer);
}