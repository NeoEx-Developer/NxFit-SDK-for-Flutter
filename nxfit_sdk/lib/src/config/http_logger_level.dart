/// Determines the level of logging for HTTP requests and response from the NXFit API.
enum HttpLoggerLevel {
  /// No logging
  none,

  /// Logs only HTTP errors.
  errorOnly,

  /// Logs HTTP Headers for both request and response, as well as any errors.
  headers,

  /// Logs the body for the reqest and response, as well as the headers and any errors.
  body
}