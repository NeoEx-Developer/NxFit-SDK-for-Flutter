import 'package:logging/logging.dart';

import '../../core.dart';
import 'nxfit_logger.dart';

/// Sets up a basic logger that prints log records to the console.
///
/// This function listens to the global `logger.onRecord` stream and prints
/// each log record in a simple format:
/// `LEVEL: TIMESTAMP: LOGGER_NAME: MESSAGE`
///
/// The global log level can be used to control the verbosity of the logs.
/// The default log level is `LogLevel.info`. Example: `Logger.root.level`
///
/// After setting up the listener, it logs an "info" message to indicate
/// that the basic logger has been successfully initialized.
void setBasicLogger() {
  logger.onRecord.listen((record) {
     print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
   });

  logger.info("Basic logger initialized");
}

extension on LogLevel {
  /// Converts a [LogLevel] to a [Level] that can be used by the [Logger].
  Level toLevel() {
    switch (this) {
      case LogLevel.verbose:
        return Level.ALL;
      case LogLevel.debug:
        return Level.FINE;
      case LogLevel.info:
        return Level.INFO;
      case LogLevel.warn:
        return Level.WARNING;
    }
  }
}
