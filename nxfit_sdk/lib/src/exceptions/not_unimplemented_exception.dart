import 'network_exception.dart';

/// Indicates an HTTP status code of 501 NOT IMPLEMENTED was received.
class NotImplementedException extends NetworkException {
  /// Indicates an HTTP status code of 501 NOT IMPLEMENTED was received.
  NotImplementedException({String? url, String? message, String? method, Exception? cause}) : super(501, url: url, message: message, method: method, cause: cause);
}
