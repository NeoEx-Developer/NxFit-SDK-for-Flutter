import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'step_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class StepSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final int count;

  const StepSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.count,
  });

  factory StepSample.fromJson(Map<String, dynamic> json) => _$StepSampleFromJson(json);
}
