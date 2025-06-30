import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'magnetic_field_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class MagneticFieldSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double x;
  final double y;
  final double z;

  const MagneticFieldSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.x,
    required this.y,
    required this.z,
  });

  factory MagneticFieldSample.fromJson(Map<String, dynamic> json) => _$MagneticFieldSampleFromJson(json);
}
