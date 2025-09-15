import 'network_exception.dart';

/// Indicates an HTTP status code of 304 NOT MODIFIED was received.
///
///The server response indicates that the resource has not been modified based on the values for the 'If-None-Match' or 'If-Modified-Since' request headers.
class NotModifiedException extends NetworkException {
  /// The server response indicates that the resource has not been modified based on the values for the 'If-None-Match' or 'If-Modified-Since' request headers.
  NotModifiedException({String? url, String? message, String? method, Exception? cause}) : super(304, url: url, message: message, method: method, cause: cause);
}
