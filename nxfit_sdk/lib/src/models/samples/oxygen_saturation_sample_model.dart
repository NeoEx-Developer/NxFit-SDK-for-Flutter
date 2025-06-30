import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class OxygenSaturationSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double percent;

  const OxygenSaturationSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.percent,
  });
}
