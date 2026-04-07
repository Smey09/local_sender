import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'router/app_router.dart';
import 'config/app_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      theme: AppConfig.theme,
      darkTheme: AppConfig.darkTheme,
      themeMode: AppConfig.themeMode,
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('km', ''),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}