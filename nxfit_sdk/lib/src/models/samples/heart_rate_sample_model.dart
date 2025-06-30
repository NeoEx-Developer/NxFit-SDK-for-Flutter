import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class HeartRateSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int bpm;

  const HeartRateSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.bpm,
  });
}
