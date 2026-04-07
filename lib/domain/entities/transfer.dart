import 'package:equatable/equatable.dart';
import '../../data/models/transfer_dto.dart';
import '../../core/constants/transfer_status.dart';

class Transfer extends Equatable {
  final String id;
  final String fileName;
  final int fileSize;
  final String senderId;
  final String receiverId;
  final TransferStatus status;
  final double progress;
  final DateTime createdAt;
  final DateTime? completedAt;

  const Transfer({
    required this.id,
    required this.fileName,
    required this.fileSize,
    required this.senderId,
    required this.receiverId,
    required this.status,
    required this.progress,
    required this.createdAt,
    this.completedAt,
  });

  factory Transfer.fromDto(TransferDto dto) {
    return Transfer(
      id: dto.id,
      fileName: dto.fileName,
      fileSize: dto.fileSize,
      senderId: dto.senderId,
      receiverId: dto.receiverId,
      status: dto.status,
      progress: dto.progress,
      createdAt: dto.createdAt,
      completedAt: dto.completedAt,
    );
  }

  TransferDto toDto() {
    return TransferDto(
      id: id,
      fileName: fileName,
      fileSize: fileSize,
      senderId: senderId,
      receiverId: receiverId,
      status: status,
      progress: progress,
      createdAt: createdAt,
      completedAt: completedAt,
    );
  }

  Transfer copyWith({
    String? id,
    String? fileName,
    int? fileSize,
    String? senderId,
    String? receiverId,
    TransferStatus? status,
    double? progress,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Transfer(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  List<Object?> get props => [id, fileName, fileSize, senderId, receiverId, status, progress, createdAt, completedAt];
}