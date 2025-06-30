import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class CadenceSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final int valuePerMinute;

  const CadenceSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.valuePerMinute,
  });
}
