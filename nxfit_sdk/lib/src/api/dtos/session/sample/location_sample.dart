import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../../converters/offsetdatetime_json_converter.dart';

part 'location_sample.g.dart';

@internal
@immutable

@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class LocationSample {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final int activeTimeInSeconds;
  final double? latitude;
  final double? longitude;
  final int? altitude;
  final double? speed;
  final double? heading;

  const LocationSample({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTimeInSeconds,
    this.latitude,
    this.longitude,
    this.altitude,
    this.speed,
    this.heading,
  });

  factory LocationSample.fromJson(Map<String, dynamic> json) => _$LocationSampleFromJson(json);
}
