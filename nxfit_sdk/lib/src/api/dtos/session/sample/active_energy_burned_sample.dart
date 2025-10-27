import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'active_energy_burned_sample.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class ActiveEnergyBurnedSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double kilocalories;

  const ActiveEnergyBurnedSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    required this.kilocalories,
  });

  factory ActiveEnergyBurnedSample.fromJson(Map<String, dynamic> json) => _$ActiveEnergyBurnedSampleFromJson(json);
}
