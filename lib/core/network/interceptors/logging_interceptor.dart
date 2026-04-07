import 'package:dio/dio.dart';
// import '../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // AppLogger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    // AppLogger.i('REQUEST DATA: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // AppLogger.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    // AppLogger.i('RESPONSE DATA: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // AppLogger.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // AppLogger.e('ERROR MESSAGE: ${err.message}');
    super.onError(err, handler);
  }
}