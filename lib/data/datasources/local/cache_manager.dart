import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CacheManager {
  static Future<String> getCacheDirectory() async {
    final directory = await getApplicationCacheDirectory();
    return directory.path;
  }

  static Future<File> createTempFile(String fileName) async {
    final cacheDir = await getCacheDirectory();
    final filePath = '$cacheDir/$fileName';
    return File(filePath);
  }

  static Future<void> clearCache() async {
    final cacheDir = await getCacheDirectory();
    final directory = Directory(cacheDir);
    if (await directory.exists()) {
      await directory.delete(recursive: true);
      await directory.create();
    }
  }

  static Future<int> getCacheSize() async {
    final cacheDir = await getCacheDirectory();
    final directory = Directory(cacheDir);
    if (!await directory.exists()) return 0;

    int totalSize = 0;
    await for (var entity in directory.list(recursive: true)) {
      if (entity is File) {
        totalSize += await entity.length();
      }
    }
    return totalSize;
  }
}