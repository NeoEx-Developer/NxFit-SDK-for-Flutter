import 'network_exception.dart';

/// Indicates an HTTP status code of 401 UNAUTHORIZED was received.
///
/// Current user has not been authenticated and has attempted to access protected resources. Perhaps the user needs to authenticate.
class UnauthorizedException extends NetworkException {
  /// Current user has not been authenticated and has attempted to access protected resources. Perhaps the user needs to authenticate.
  UnauthorizedException({String? url, String? message, String? method, Exception? cause}) : super(401, url: url, message: message, method: method, cause: cause);
}
