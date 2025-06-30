import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class ExerciseTimeSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int minutes;

  const ExerciseTimeSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.minutes,
  });
}
