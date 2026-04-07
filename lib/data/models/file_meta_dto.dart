import 'package:equatable/equatable.dart';

class FileMetaDto extends Equatable {
  final String name;
  final String path;
  final int size;
  final String mimeType;
  final DateTime lastModified;

  const FileMetaDto({
    required this.name,
    required this.path,
    required this.size,
    required this.mimeType,
    required this.lastModified,
  });

  factory FileMetaDto.fromJson(Map<String, dynamic> json) {
    return FileMetaDto(
      name: json['name'],
      path: json['path'],
      size: json['size'],
      mimeType: json['mimeType'],
      lastModified: DateTime.parse(json['lastModified']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
      'size': size,
      'mimeType': mimeType,
      'lastModified': lastModified.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [name, path, size, mimeType, lastModified];
}