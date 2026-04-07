import 'package:get/get.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/permission_service.dart';
import '../../core/services/storage_service.dart';
import '../../core/services/lifecycle_service.dart';
import '../../core/network/http_client.dart';
import '../../core/network/socket_client.dart';
import '../../data/datasources/local/device_local_ds.dart';
import '../../data/datasources/local/transfer_local_ds.dart';
import '../../data/datasources/network/mdns_datasource.dart';
import '../../data/datasources/network/http_transfer_ds.dart';
import '../../data/datasources/network/socket_transfer_ds.dart';
import '../../data/repositories/device_repository_impl.dart';
import '../../data/repositories/transfer_repository_impl.dart';
import '../../domain/repositories/device_repository.dart';
import '../../domain/repositories/transfer_repository.dart';

class ServiceLocator {
  static Future<void> init() async {
    // Core services - Initialize StorageService first and wait for it
    Get.lazyPut<ConnectivityService>(() => ConnectivityService());
    Get.lazyPut<PermissionService>(() => PermissionService());
    final storageService = await StorageService().init();
    Get.put<StorageService>(storageService);
    Get.lazyPut<LifecycleService>(() => LifecycleService());
    
    // Network
    Get.lazyPut<HttpClient>(() => HttpClient());
    Get.lazyPut<SocketClient>(() => SocketClient());
    
    // Data sources
    Get.lazyPut<DeviceLocalDataSource>(() => DeviceLocalDataSourceImpl());
    Get.lazyPut<TransferLocalDataSource>(() => TransferLocalDataSourceImpl());
    Get.lazyPut<MdnsDataSource>(() => MdnsDataSourceImpl());
    Get.lazyPut<HttpTransferDataSource>(() => HttpTransferDataSourceImpl());
    Get.lazyPut<SocketTransferDataSource>(() => SocketTransferDataSourceImpl());
    
    // Repositories
    Get.lazyPut<DeviceRepository>(() => DeviceRepositoryImpl());
    Get.lazyPut<TransferRepository>(() => TransferRepositoryImpl());
  }
}