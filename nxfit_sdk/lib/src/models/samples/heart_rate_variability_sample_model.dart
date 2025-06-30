import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class HeartRateVariabilitySampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double variabilityMs;

  const HeartRateVariabilitySampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.variabilityMs,
  });
}
