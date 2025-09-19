import 'package:frappe_client/src/network_client.dart';
import 'package:frappe_dart/frappe_dart.dart';

/// Frappe client
///
/// This is a client for the Frappe API
///
/// [baseUrl] is the base URL of the Frappe API
/// [cookie] is the cookie to use for the Frappe API
///
class FrappeClient extends FrappeV15 {
  /// Frappe client factory
  ///
  /// [baseUrl] is the base URL of the Frappe API
  /// [cookie] is the cookie to use for the Frappe API
  ///
  /// Returns a Frappe client
  factory FrappeClient({
    required String baseUrl,
    String? cookie,
  }) {
    return FrappeClient._(
      baseUrl: baseUrl,
      cookie: cookie,
      dio: NetworkClient().dio,
    );
  }

  FrappeClient._({
    required super.baseUrl,
    required super.dio,
    super.cookie,
  }) {
    NetworkClient().updateBaseUrl(baseUrl);
    if (cookie != null) {
      NetworkClient().updateCookie(cookie);
    }
  }

  @override
  set cookie(String? newCookie) {
    super.cookie = newCookie;
    NetworkClient().updateCookie(newCookie);
  }

  @override
  set baseUrl(String newBaseUrl) {
    super.baseUrl = newBaseUrl;
    NetworkClient().updateBaseUrl(newBaseUrl);
  }
}
