
import 'network_exception.dart';

/// Indicates an HTTP status code of 403 FORBIDDEN was received.
///
/// The authenticated user is forbidden from accessing the resource. This is typically caused when a user attempts to access a resource he does not have privileges for.
class ForbiddenException extends NetworkException {
  /// The authenticated user is forbidden from accessing the resource. This is typically caused when a user attempts to access a resource he does not have privileges for.
  ForbiddenException({String? url, String? message, String? method, Exception? cause}) : super(403, url: url, message: message, method: method, cause: cause);
}
