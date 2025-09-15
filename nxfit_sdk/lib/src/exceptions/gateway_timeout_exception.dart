import 'network_exception.dart';

/// Indicates an HTTP status code of 504 GATEWAY TIMEOUT was received.
///
/// Indicates that the server, while acting as a gateway or proxy, did not get a response in time from the upstream server that it needed in order to complete the request. This could be because the server cannot access services that it depends on, eg: database.
class GatewayTimeoutException extends NetworkException {
  /// Indicates that the server, while acting as a gateway or proxy, did not get a response in time from the upstream server that it needed in order to complete the request. This could be because the server cannot access services that it depends on, eg: database.
  GatewayTimeoutException({String? url, String? message, String? method, Exception? cause}) : super(504, url: url, message: message, method: method, cause: cause);
}
