import 'package:flutter/material.dart';
import '../../shared/themes/app_theme.dart';

class AppConfig {
  static const String appName = 'Local Sender';
  static ThemeData get theme => AppTheme.light;
  static ThemeData get darkTheme => AppTheme.dark;
  static ThemeMode get themeMode => ThemeMode.system;
}