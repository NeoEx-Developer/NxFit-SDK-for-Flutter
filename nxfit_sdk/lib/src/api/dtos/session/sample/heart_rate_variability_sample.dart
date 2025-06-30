import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'heart_rate_variability_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class HeartRateVariabilitySample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double variabilityMs;

  const HeartRateVariabilitySample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.variabilityMs,
  });

  factory HeartRateVariabilitySample.fromJson(Map<String, dynamic> json) => _$HeartRateVariabilitySampleFromJson(json);
}