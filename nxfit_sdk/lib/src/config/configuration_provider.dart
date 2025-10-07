import '../enums/log_level.dart';
import 'http_logger_level.dart';

/// Defines the configuration requirements for the NxFit SDK. An implementation of this must be provided when building [NxFit].
///
/// See also [NxFit.build].
class ConfigurationProvider {
  ///  The base URL for the NXFit platform service. This should be in the format: **{scheme}://{domain}**. There should not be a trailing slash.
  ///
  ///  **Example:** https://api.nxfit.com.
  final String baseUrl;

  /// Use this to help debug communication issues via logging. Depending on the level set, logs
  /// the URL, query parameters, headers and body of both the request and response.
  ///
  /// Since this may include sensitive information it is HIGHLY recommended that this be set to
  /// [none] for production builds.
  ///
  /// Production recommendation : [HttpLoggerLevel.none]
  ///
  /// Development recommendation: [HttpLoggerLevel.body]
  ///
  /// Default: [HttpLoggerLevel.none]
  ///
  /// See also [HttpLoggerLevel].
  final HttpLoggerLevel httpLoggerLevel;

  /// Specifies the minimum level of log messages that should be processed by the SDK native components (Android & iOS).
  ///
  /// The Dart/Flutter components use the [logging](https://pub.dev/packages/logging) package and that should be initialized by the
  /// consuming app.
  ///
  /// This does not affect the [httpLoggerLevel] which is configured separately.
  final LogLevel minLogLevel;

  /// Specifies the number of seconds to wait before timing out an HTTP request.
  ///
  /// Default: 60 seconds
  final int connectTimeoutSeconds;

  ConfigurationProvider(
    this.baseUrl, {
    this.httpLoggerLevel = HttpLoggerLevel.none,
    this.minLogLevel = LogLevel.warn,
    this.connectTimeoutSeconds = 60,
  });
}
