import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';

/// Network interceptor
class NetworkInterceptor extends Interceptor {
  /// Network interceptor
  NetworkInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!options.path.contains('ping')) {
      await AppLogger.logInfo(
        'REQUEST[${options.method}] => PATH: ${options.path} ${options.data}',
        LogType.network,
      );
    }

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (!response.requestOptions.path.contains('ping')) {
      await AppLogger.logInfo(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} ${response.requestOptions.data}',
        LogType.network,
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!err.requestOptions.path.contains('ping')) {
      ///Log the error
      await AppLogger.reportError(
        err,
        err.stackTrace,
        'API Error: ${err.message}',
        LogType.network,
      );
    }

    return super.onError(err, handler);
  }
}
