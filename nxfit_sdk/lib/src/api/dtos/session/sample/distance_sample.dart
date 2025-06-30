import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'distance_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class DistanceSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double meters;
  final int type;

  const DistanceSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.meters,
    required this.type,
  });

  factory DistanceSample.fromJson(Map<String, dynamic> json) => _$DistanceSampleFromJson(json);
}
