import 'dart:io';

import 'package:app_logger/app_logger.dart';
import 'package:dio/dio.dart';

/// Retry interceptor
class RetryInterceptor extends Interceptor {
  /// Retry interceptor
  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelays = const [1, 2, 3],
  });

  /// Dio
  final Dio dio;

  /// Retries
  final int retries;

  /// Retry delays
  final List<int> retryDelays;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final extra = Map<String, int>.from(err.requestOptions.extra);
    final retryCount = extra['retryCount'] ?? 0;

    if (_shouldRetry(err) && retryCount < retries) {
      if (!err.requestOptions.path.contains('ping')) {
        await AppLogger.logInfo(
          'Retrying request (${retryCount + 1}/$retries): ${err.requestOptions.path}',
          LogType.network,
        );
      }

      await Future<void>.delayed(
        Duration(seconds: retryDelays[retryCount]),
      );

      extra['retryCount'] = retryCount + 1;
      err.requestOptions.extra = extra;

      try {
        final response = await _retry(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return super.onError(err, handler);
      }
    }

    return super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      extra: requestOptions.extra,
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  bool _shouldRetry(DioException error) {
    return error.error is SocketException ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.response?.statusCode == 408 || // Request Timeout
        error.response?.statusCode == 429 || // Too Many Requests
        (error.response?.statusCode ?? 0) >= 500; // Server Errors
  }
}
