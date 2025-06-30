import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class PowerSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int watts;

  const PowerSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.watts,
  });
}
