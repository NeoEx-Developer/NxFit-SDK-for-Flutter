import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class RestingHeartRateSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int bpm;

  const RestingHeartRateSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.bpm,
  });
}
