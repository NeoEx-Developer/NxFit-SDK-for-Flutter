import 'network_exception.dart';

/// Indicates an HTTP status code of 503 SERVICE UNAVAILABLE was received.
///
/// The service was not available. This is likely because the url was not reachable or invalid.
class ServiceUnavailableException extends NetworkException {
  /// The service was not available. This is likely because the url was not reachable or invalid.
  ServiceUnavailableException({String? url, String? message, String? method, Exception? cause}) : super(503, url: url, message: message, method: method, cause: cause);
}
