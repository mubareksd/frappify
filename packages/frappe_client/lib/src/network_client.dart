import 'package:dio/dio.dart';
import 'package:frappe_client/src/network_interceptor.dart';
import 'package:frappe_client/src/retry_interceptor.dart';

/// Network client
///
/// This class is responsible for sending requests to the Frappe API
/// and receiving responses.
///
/// It also handles the retry logic and the network interceptor.
///
class NetworkClient {
  /// Network client factory
  ///
  /// Returns a NetworkClient instance
  factory NetworkClient() {
    return _instance;
  }

  NetworkClient._internal() {
    _configureDio();
  }

  static final NetworkClient _instance = NetworkClient._internal();

  /// Dio instance
  late final Dio dio;

  void _configureDio() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          // 'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );

    dio.interceptors.addAll([
      NetworkInterceptor(),
      RetryInterceptor(dio: dio),
    ]);
  }

  /// Update cookie
  ///
  /// [cookie] is the cookie to update
  void updateCookie(String? cookie) {
    if (cookie != null) {
      dio.options.headers['Cookie'] = cookie;
    } else {
      dio.options.headers.remove('Cookie');
    }
  }

  /// Update base URL
  ///
  /// [baseUrl] is the base URL to update
  void updateBaseUrl(String baseUrl) {
    dio.options.baseUrl = baseUrl;
  }
}
