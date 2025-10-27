// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSessionResponseDto _$GetSessionResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetSessionResponseDto(
  (json['id'] as num).toInt(),
  json['activityType'] as String,
  (json['activeDurationInSeconds'] as num).toInt(),
  const OffsetDateTimeJsonConverter().fromJson(
    json['startedOnLocal'] as String,
  ),
  const OffsetDateTimeJsonConverter().fromJson(json['endedOnLocal'] as String),
  (json['distanceInMeters'] as num?)?.toDouble(),
  (json['energyBurnedInKilocalories'] as num?)?.toInt(),
  (json['maximalOxygenConsumption'] as num?)?.toDouble(),
  UserDetails.fromJson(json['user'] as Map<String, dynamic>),
  json['cadence'] == null
      ? null
      : CadenceMetrics.fromJson(json['cadence'] as Map<String, dynamic>),
  json['heartRate'] == null
      ? null
      : HeartRateMetrics.fromJson(json['heartRate'] as Map<String, dynamic>),
  json['power'] == null
      ? null
      : PowerMetrics.fromJson(json['power'] as Map<String, dynamic>),
  json['speed'] == null
      ? null
      : SpeedMetrics.fromJson(json['speed'] as Map<String, dynamic>),
  Metadata.fromJson(json['_metadata'] as Map<String, dynamic>),
);

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
  (json['id'] as num).toInt(),
  json['name'] as String,
  json['imageUrl'] as String,
);

CadenceMetrics _$CadenceMetricsFromJson(Map<String, dynamic> json) =>
    CadenceMetrics(
      (json['avgCadencePerMinute'] as num).toDouble(),
      (json['maxCadencePerMinute'] as num).toInt(),
      (json['minCadencePerMinute'] as num).toInt(),
      json['cadenceUnitShort'] as String?,
      json['cadenceUnitFull'] as String?,
    );

HeartRateMetrics _$HeartRateMetricsFromJson(Map<String, dynamic> json) =>
    HeartRateMetrics(
      (json['avgBPM'] as num).toDouble(),
      (json['maxBPM'] as num).toInt(),
      (json['minBPM'] as num).toInt(),
    );

PowerMetrics _$PowerMetricsFromJson(Map<String, dynamic> json) => PowerMetrics(
  (json['avgPowerInWatts'] as num).toDouble(),
  (json['maxPowerInWatts'] as num).toInt(),
  (json['minPowerInWatts'] as num).toInt(),
);

SpeedMetrics _$SpeedMetricsFromJson(Map<String, dynamic> json) => SpeedMetrics(
  (json['avgSpeedInMetersPerSecond'] as num).toDouble(),
  (json['maxSpeedInMetersPerSecond'] as num).toDouble(),
  (json['minSpeedInMetersPerSecond'] as num).toDouble(),
);

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  const OffsetDateTimeJsonConverter().fromJson(json['createdOn'] as String),
  const OffsetDateTimeJsonConverter().fromJson(json['updatedOn'] as String),
);
