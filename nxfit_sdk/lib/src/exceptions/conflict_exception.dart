import 'network_exception.dart';

class ConflictException extends NetworkException {
  ConflictException({String? url, String? message, String? method, Exception? cause}) : super(409, url: url, message: message, method: method, cause: cause);
}
