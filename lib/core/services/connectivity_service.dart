import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;

  Future<List<ConnectivityResult>> get currentConnectivity => _connectivity.checkConnectivity();

  void listenToConnectivityChanges(Function(List<ConnectivityResult>) onChanged) {
    _subscription = _connectivity.onConnectivityChanged.listen(onChanged);
  }

  void dispose() {
    _subscription?.cancel();
  }
}