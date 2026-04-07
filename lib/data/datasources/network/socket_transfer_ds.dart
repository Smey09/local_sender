import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import '../../../core/network/socket_client.dart';

abstract class SocketTransferDataSource {
  Future<void> sendFile(File file, String receiverIp, int port);
  Future<File> receiveFile(String fileName, String senderIp, int port);
}

class SocketTransferDataSourceImpl implements SocketTransferDataSource {
  final SocketClient _socketClient = Get.find<SocketClient>();

  @override
  Future<void> sendFile(File file, String receiverIp, int port) async {
    await _socketClient.connect(receiverIp, port);
    
    final fileData = await file.readAsBytes();
    final fileName = file.path.split('/').last;
    
    // Send file metadata
    final metadata = {
      'type': 'file',
      'name': fileName,
      'size': fileData.length,
    };
    await _socketClient.sendData(json.encode(metadata));
    
    // Send file data
    await _socketClient.sendData(base64.encode(fileData));
    
    _socketClient.disconnect();
  }

  @override
  Future<File> receiveFile(String fileName, String senderIp, int port) async {
    await _socketClient.connect(senderIp, port);
    
    // Request file
    final request = {'type': 'request', 'name': fileName};
    await _socketClient.sendData(json.encode(request));
    
    // Receive file data
    String? data;
    await for (final chunk in _socketClient.dataStream) {
      data = chunk;
      break;
    }
    
    _socketClient.disconnect();
    
    if (data != null) {
      final fileData = base64.decode(data);
      final tempDir = Directory.systemTemp;
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(fileData);
      return file;
    } else {
      throw Exception('Failed to receive file');
    }
  }
}