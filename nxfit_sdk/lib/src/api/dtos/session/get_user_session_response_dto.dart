import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part "get_user_session_response_dto.g.dart";

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class GetUserSessionResponseDto {
  final int id;
  final String activityType;
  final int activeDurationInSeconds;
  final OffsetDateTime startedOnLocal;
  final OffsetDateTime endedOnLocal;
  final double? distanceInMeters;
  final int? energyBurnedInCalories;
  final double? maximalOxygenConsumption;

  final UserDetails user;
  final SourceDetails source;

  @JsonKey(name: 'cadence')
  final CadenceMetrics? cadenceMetrics;

  @JsonKey(name: 'heartRate')
  final HeartRateMetrics? heartRateMetrics;

  @JsonKey(name: 'power')
  final PowerMetrics? powerMetrics;

  @JsonKey(name: 'speed')
  final SpeedMetrics? speedMetrics;

  @JsonKey(name: 'sync')
  final SyncDetails? syncDetails;

  @JsonKey(name: '_metadata')
  final Metadata metadata;

  const GetUserSessionResponseDto(this.id, this.activityType, this.activeDurationInSeconds, this.startedOnLocal, this.endedOnLocal, this.distanceInMeters, this.energyBurnedInCalories, this.maximalOxygenConsumption, this.user, this.source, this.cadenceMetrics, this.heartRateMetrics, this.powerMetrics, this.speedMetrics,
      this.syncDetails, this.metadata);

  factory GetUserSessionResponseDto.fromJson(Map<String, dynamic> json) => _$GetUserSessionResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class UserDetails {
  final int id;
  final String name;
  final String imageUrl;

  const UserDetails(this.id, this.name, this.imageUrl);

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class SourceDetails {
  final String integration;
  final String? device;
  final String? app;

  const SourceDetails(
    this.integration,
    this.device,
    this.app,
  );

  factory SourceDetails.fromJson(Map<String, dynamic> json) => _$SourceDetailsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class CadenceMetrics {
  final double avgCadencePerMinute;
  final int maxCadencePerMinute;
  final int minCadencePerMinute;
  final String? cadenceUnitShort;
  final String? cadenceUnitFull;

  const CadenceMetrics(this.avgCadencePerMinute, this.maxCadencePerMinute, this.minCadencePerMinute, this.cadenceUnitShort, this.cadenceUnitFull);

  factory CadenceMetrics.fromJson(Map<String, dynamic> json) => _$CadenceMetricsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class HeartRateMetrics {
  final double avgBPM;
  final int maxBPM;
  final int minBPM;

  const HeartRateMetrics(this.avgBPM, this.maxBPM, this.minBPM);

  factory HeartRateMetrics.fromJson(Map<String, dynamic> json) => _$HeartRateMetricsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class PowerMetrics {
  final double avgPowerInWatts;
  final int maxPowerInWatts;
  final int minPowerInWatts;

  const PowerMetrics(this.avgPowerInWatts, this.maxPowerInWatts, this.minPowerInWatts);

  factory PowerMetrics.fromJson(Map<String, dynamic> json) => _$PowerMetricsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class SpeedMetrics {
  final double avgSpeedInMetersPerSecond;
  final double maxSpeedInMetersPerSecond;
  final double minSpeedInMetersPerSecond;

  const SpeedMetrics(this.avgSpeedInMetersPerSecond, this.maxSpeedInMetersPerSecond, this.minSpeedInMetersPerSecond);

  factory SpeedMetrics.fromJson(Map<String, dynamic> json) => _$SpeedMetricsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class SyncDetails {
  final String? id;
  final String? version;

  const SyncDetails(this.id, this.version);

  factory SyncDetails.fromJson(Map<String, dynamic> json) => _$SyncDetailsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class Metadata {
  final OffsetDateTime createdOn;
  final OffsetDateTime updatedOn;
  final OffsetDateTime? completedOn;
  final String privacy;

  const Metadata(
    this.createdOn,
    this.updatedOn, {
    this.completedOn,
    this.privacy = "Public", //If this value is not set in the response then the privacy is 'Public'.
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
