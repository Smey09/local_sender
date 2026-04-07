import 'dart:io';
import 'package:get/get.dart';
import '../../../core/network/http_client.dart';

abstract class HttpTransferDataSource {
  Future<void> sendFile(File file, String receiverIp, int port);
  Future<File> receiveFile(String fileName, String senderIp, int port);
}

class HttpTransferDataSourceImpl implements HttpTransferDataSource {
  final HttpClient _httpClient = Get.find<HttpClient>();

  @override
  Future<void> sendFile(File file, String receiverIp, int port) async {
    final url = 'http://$receiverIp:$port/upload';
    await _httpClient.post(url, data: await file.readAsBytes());
  }

  @override
  Future<File> receiveFile(String fileName, String senderIp, int port) async {
    final url = 'http://$senderIp:$port/download/$fileName';
    final response = await _httpClient.get(url);
    
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(response.data);
    
    return file;
  }
}