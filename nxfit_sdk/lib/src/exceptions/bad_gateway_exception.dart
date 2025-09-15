import 'network_exception.dart';

/// Indicates an HTTP status code of 502 BAD GATEWAY was received.
///
/// Indicates that the server, while acting as a gateway or proxy, received an invalid response from the upstream server. This could be DNS issues (has the server moved recently?), firewall issues or host issues.
class BadGatewayException extends NetworkException {
  /// Indicates that the server, while acting as a gateway or proxy, received an invalid response from the upstream server. This could be DNS issues (has the server moved recently?), firewall issues or host issues.
  BadGatewayException({String? url, String? message, String? method, Exception? cause}) : super(502, url: url, message: message, method: method, cause: cause);
}
