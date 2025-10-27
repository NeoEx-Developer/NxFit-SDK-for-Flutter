import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class ActiveEnergyBurnedSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double kilocalories;

  const ActiveEnergyBurnedSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.kilocalories,
  });
}
