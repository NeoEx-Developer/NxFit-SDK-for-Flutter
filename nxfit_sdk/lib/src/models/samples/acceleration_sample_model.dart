import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class AccelerationSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double x;
  final double y;
  final double z;

  const AccelerationSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.x,
    required this.y,
    required this.z,
  });
}
