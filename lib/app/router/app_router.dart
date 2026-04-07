import 'package:get/get.dart';
import 'route_names.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/transfer/bindings/transfer_binding.dart';
import '../../features/transfer/presentation/pages/transfer_page.dart';
import '../../features/settings/bindings/settings_binding.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

class AppRouter {
  static String get initialRoute => RouteNames.home;

  static final routes = [
    GetPage(
      name: RouteNames.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.transfer,
      page: () => const TransferPage(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: RouteNames.settings,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
  ];
}