import 'network_exception.dart';

/// Indicates an HTTP status code of 409 CONFLICT was received.
///
/// The request could not be processed because of conflict in the request. One possible cause is when attempting to create (eg POST) something that has already been created.
class ConflictException extends NetworkException {
  /// The request could not be processed because of conflict in the request. One possible cause is when attempting to create (eg POST) something that has already been created.
  ConflictException({String? url, String? message, String? method, Exception? cause}) : super(409, url: url, message: message, method: method, cause: cause);
}
