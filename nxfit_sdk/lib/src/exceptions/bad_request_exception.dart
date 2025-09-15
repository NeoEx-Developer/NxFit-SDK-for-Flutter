import 'network_exception.dart';

/// Indicates an HTTP status code of 400 BAD REQUEST was received.
///
/// The server has rejected this request due to something that is perceived to be a client error (ex: malformed request syntax, invalid request message framing, or deceptive request routing). See 'requestBody' property for a detailed description from the server.
class BadRequestException extends NetworkException {
  /// The server has rejected this request due to something that is perceived to be a client error (ex: malformed request syntax, invalid request message framing, or deceptive request routing). See 'requestBody' property for a detailed description from the server.
  BadRequestException({String? url, String? message, String? method, Exception? cause}) : super(400, url: url, message: message, method: method, cause: cause);
}
