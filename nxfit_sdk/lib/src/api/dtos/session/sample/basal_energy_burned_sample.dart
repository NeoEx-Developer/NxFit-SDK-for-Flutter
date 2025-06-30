import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'basal_energy_burned_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class BasalEnergyBurnedSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double calories;

  const BasalEnergyBurnedSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.calories,
  });

  factory BasalEnergyBurnedSample.fromJson(Map<String, dynamic> json) => _$BasalEnergyBurnedSampleFromJson(json);
}
