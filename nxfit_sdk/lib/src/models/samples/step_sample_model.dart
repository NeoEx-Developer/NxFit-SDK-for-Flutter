import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class StepSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int count;

  const StepSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.count,
  });
}
