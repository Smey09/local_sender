class EnvConfig {
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static bool get isDev => env == 'dev';
  static bool get isProd => env == 'prod';
}