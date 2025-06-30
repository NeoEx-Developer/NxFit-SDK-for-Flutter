import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class BasalEnergyBurnedSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double calories;

  const BasalEnergyBurnedSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.calories,
  });
}
