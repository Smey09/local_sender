import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/di/injector.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await setupInjector();
  
  runApp(const App());
}