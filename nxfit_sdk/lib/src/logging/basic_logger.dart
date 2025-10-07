import 'package:logging/logging.dart';

import '../../core.dart';

/// Sets up a basic logger that logs to the console. The [minLogLevel] parameter specifies the minimum log level to log.
/// Logs with a level lower than this will be ignored.
///
/// This uses the [logging](https://pub.dev/packages/logging) package. It is recommended that
/// the consuming application set up its own logging configuration if more advanced logging is required.
void setBasicLogger(LogLevel minLogLevel) {
  Logger.root.level = minLogLevel.toLevel();

  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });
}

extension on LogLevel {
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
