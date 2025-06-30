import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../enums/distance_type.dart';

@immutable
class DistanceSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double meters;
  final DistanceType type;

  const DistanceSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    required this.meters,
    required this.type,
  });
}