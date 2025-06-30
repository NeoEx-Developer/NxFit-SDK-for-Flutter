class NetworkException implements Exception {
  final int statusCode;
  final String? url;
  final String? message;
  final String? method;
  final Exception? cause;

  /// An exception indicating an HTTP result that is NOT successful.
  NetworkException(this.statusCode, {this.url, this.message, this.method, this.cause});
}

