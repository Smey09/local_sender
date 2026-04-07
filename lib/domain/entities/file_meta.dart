import 'package:equatable/equatable.dart';
import '../../data/models/file_meta_dto.dart';

class FileMeta extends Equatable {
  final String name;
  final String path;
  final int size;
  final String mimeType;
  final DateTime lastModified;

  const FileMeta({
    required this.name,
    required this.path,
    required this.size,
    required this.mimeType,
    required this.lastModified,
  });

  factory FileMeta.fromDto(FileMetaDto dto) {
    return FileMeta(
      name: dto.name,
      path: dto.path,
      size: dto.size,
      mimeType: dto.mimeType,
      lastModified: dto.lastModified,
    );
  }

  FileMetaDto toDto() {
    return FileMetaDto(
      name: name,
      path: path,
      size: size,
      mimeType: mimeType,
      lastModified: lastModified,
    );
  }

  @override
  List<Object?> get props => [name, path, size, mimeType, lastModified];
}