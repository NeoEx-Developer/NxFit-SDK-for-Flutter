import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class LocationSampleModel {
  final OffsetDateTime timestamp;
  final int intervalInSeconds;
  final Duration activeTime;
  final double? latitude;
  final double? longitude;
  final int? altitude;
  final double? speed;
  final double? heading;

  const LocationSampleModel({
    required this.timestamp,
    required this.intervalInSeconds,
    required this.activeTime,
    this.latitude,
    this.longitude,
    this.altitude,
    this.speed,
    this.heading,
  });
}
