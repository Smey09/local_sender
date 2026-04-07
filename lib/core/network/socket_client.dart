import 'dart:io';
import 'dart:convert';

class SocketClient {
  Socket? _socket;

  Future<void> connect(String host, int port) async {
    _socket = await Socket.connect(host, port);
  }

  Future<void> sendData(String data) async {
    if (_socket != null) {
      _socket!.write(data);
      await _socket!.flush();
    }
  }

  Stream<String> get dataStream {
    return _socket!.map(utf8.decode).transform(const LineSplitter());
  }

  void disconnect() {
    _socket?.close();
    _socket = null;
  }

  bool get isConnected => _socket != null;
}