import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtils {
  static String getFileName(String filePath) {
    return path.basename(filePath);
  }

  static String getFileExtension(String filePath) {
    return path.extension(filePath);
  }

  static int getFileSize(File file) {
    return file.lengthSync();
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}