import 'service_locator.dart';

Future<void> setupInjector() async {
  await ServiceLocator.init();
}