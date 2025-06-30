import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'heart_rate_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class HeartRateSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final int bpm;

  const HeartRateSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.bpm,
  });

  factory HeartRateSample.fromJson(Map<String, dynamic> json) => _$HeartRateSampleFromJson(json);
}
