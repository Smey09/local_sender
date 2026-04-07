import 'package:equatable/equatable.dart';
import '../../core/constants/transfer_status.dart';

class TransferDto extends Equatable {
  final String id;
  final String fileName;
  final int fileSize;
  final String senderId;
  final String receiverId;
  final TransferStatus status;
  final double progress;
  final DateTime createdAt;
  final DateTime? completedAt;

  const TransferDto({
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

  factory TransferDto.fromJson(Map<String, dynamic> json) {
    return TransferDto(
      id: json['id'],
      fileName: json['fileName'],
      fileSize: json['fileSize'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      status: TransferStatus.values[json['status']],
      progress: json['progress'],
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'fileSize': fileSize,
      'senderId': senderId,
      'receiverId': receiverId,
      'status': status.index,
      'progress': progress,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, fileName, fileSize, senderId, receiverId, status, progress, createdAt, completedAt];
}