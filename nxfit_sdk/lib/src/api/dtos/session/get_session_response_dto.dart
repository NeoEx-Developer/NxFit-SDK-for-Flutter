import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

import '../../converters/offsetdatetime_json_converter.dart';

part "get_session_response_dto.g.dart";

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class GetSessionResponseDto {
  final int id;
  final String activityType;
  final int activeDurationInSeconds;
  final OffsetDateTime startedOnLocal;
  final OffsetDateTime endedOnLocal;
  final double? distanceInMeters;
  final int? energyBurnedInKilocalories;
  final double? maximalOxygenConsumption;

  final UserDetails user;

  @JsonKey(name: 'cadence')
  final CadenceMetrics? cadenceMetrics;

  @JsonKey(name: 'heartRate')
  final HeartRateMetrics? heartRateMetrics;

  @JsonKey(name: 'power')
  final PowerMetrics? powerMetrics;

  @JsonKey(name: 'speed')
  final SpeedMetrics? speedMetrics;

  @JsonKey(name: '_metadata')
  final Metadata metadata;

  const GetSessionResponseDto(
    this.id,
    this.activityType,
    this.activeDurationInSeconds,
    this.startedOnLocal,
    this.endedOnLocal,
    this.distanceInMeters,
    this.energyBurnedInKilocalories,
    this.maximalOxygenConsumption,
    this.user,
    this.cadenceMetrics,
    this.heartRateMetrics,
    this.powerMetrics,
    this.speedMetrics,
    this.metadata
  );

  factory GetSessionResponseDto.fromJson(Map<String, dynamic> json) => _$GetSessionResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class UserDetails {
  final int id;
  final String name;
  final String imageUrl;

  const UserDetails(
    this.id,
    this.name,
    this.imageUrl
  );

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
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

  const CadenceMetrics(
    this.avgCadencePerMinute,
    this.maxCadencePerMinute,
    this.minCadencePerMinute,
    this.cadenceUnitShort,
    this.cadenceUnitFull
  );

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

  const HeartRateMetrics(
    this.avgBPM,
    this.maxBPM,
    this.minBPM
  );

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

  const PowerMetrics(this.avgPowerInWatts,
      this.maxPowerInWatts,
      this.minPowerInWatts
  );

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

  const SpeedMetrics(
    this.avgSpeedInMetersPerSecond,
    this.maxSpeedInMetersPerSecond,
    this.minSpeedInMetersPerSecond
  );

  factory SpeedMetrics.fromJson(Map<String, dynamic> json) => _$SpeedMetricsFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
@OffsetDateTimeJsonConverter()
class Metadata {
  final OffsetDateTime createdOn;
  final OffsetDateTime updatedOn;

  const Metadata(
    this.createdOn,
    this.updatedOn
  );

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
