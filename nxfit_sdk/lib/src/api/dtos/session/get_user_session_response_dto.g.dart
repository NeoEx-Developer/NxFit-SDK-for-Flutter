// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserSessionResponseDto _$GetUserSessionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetUserSessionResponseDto(
      (json['id'] as num).toInt(),
      json['activityType'] as String,
      (json['activeDurationInSeconds'] as num).toInt(),
      const OffsetDateTimeJsonConverter()
          .fromJson(json['startedOnLocal'] as String),
      const OffsetDateTimeJsonConverter()
          .fromJson(json['endedOnLocal'] as String),
      (json['distanceInMeters'] as num?)?.toDouble(),
      (json['energyBurnedInKilocalories'] as num?)?.toInt(),
      (json['maximalOxygenConsumption'] as num?)?.toDouble(),
      UserDetails.fromJson(json['user'] as Map<String, dynamic>),
      SourceDetails.fromJson(json['source'] as Map<String, dynamic>),
      json['sync'] == null
          ? null
          : SyncDetails.fromJson(json['sync'] as Map<String, dynamic>),
      json['cadence'] == null
          ? null
          : CadenceMetrics.fromJson(json['cadence'] as Map<String, dynamic>),
      json['floorsClimbed'] == null
          ? null
          : FloorsClimbedMetrics.fromJson(
              json['floorsClimbed'] as Map<String, dynamic>),
      json['heartRate'] == null
          ? null
          : HeartRateMetrics.fromJson(
              json['heartRate'] as Map<String, dynamic>),
      json['power'] == null
          ? null
          : PowerMetrics.fromJson(json['power'] as Map<String, dynamic>),
      json['respiratoryRate'] == null
          ? null
          : RespiratoryRateMetrics.fromJson(
              json['respiratoryRate'] as Map<String, dynamic>),
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

SourceDetails _$SourceDetailsFromJson(Map<String, dynamic> json) =>
    SourceDetails(
      json['integration'] as String,
      json['device'] as String?,
      json['app'] as String?,
    );

CadenceMetrics _$CadenceMetricsFromJson(Map<String, dynamic> json) =>
    CadenceMetrics(
      (json['avgCadencePerMinute'] as num).toDouble(),
      (json['maxCadencePerMinute'] as num).toDouble(),
      (json['minCadencePerMinute'] as num).toDouble(),
      json['cadenceUnitShort'] as String?,
      json['cadenceUnitFull'] as String?,
    );

HeartRateMetrics _$HeartRateMetricsFromJson(Map<String, dynamic> json) =>
    HeartRateMetrics(
      (json['avgBPM'] as num).toDouble(),
      (json['maxBPM'] as num).toInt(),
      (json['minBPM'] as num).toInt(),
    );

FloorsClimbedMetrics _$FloorsClimbedMetricsFromJson(
        Map<String, dynamic> json) =>
    FloorsClimbedMetrics(
      (json['avgFloorsClimbed'] as num).toDouble(),
      (json['maxFloorsClimbed'] as num).toDouble(),
      (json['minFloorsClimbed'] as num).toDouble(),
    );

PowerMetrics _$PowerMetricsFromJson(Map<String, dynamic> json) => PowerMetrics(
      (json['avgPowerInWatts'] as num).toDouble(),
      (json['maxPowerInWatts'] as num).toDouble(),
      (json['minPowerInWatts'] as num).toDouble(),
    );

RespiratoryRateMetrics _$RespiratoryRateMetricsFromJson(
        Map<String, dynamic> json) =>
    RespiratoryRateMetrics(
      (json['avgRespiratoryRateInBreathsPerMinute'] as num).toDouble(),
      (json['maxRespiratoryRateInBreathsPerMinute'] as num).toDouble(),
      (json['minRespiratoryRateInBreathsPerMinute'] as num).toDouble(),
    );

SpeedMetrics _$SpeedMetricsFromJson(Map<String, dynamic> json) => SpeedMetrics(
      (json['avgSpeedInMetersPerSecond'] as num).toDouble(),
      (json['maxSpeedInMetersPerSecond'] as num).toDouble(),
      (json['minSpeedInMetersPerSecond'] as num).toDouble(),
    );

SyncDetails _$SyncDetailsFromJson(Map<String, dynamic> json) => SyncDetails(
      json['externalId'] as String,
      _$JsonConverterFromJson<String, OffsetDateTime>(
          json['completedOn'], const OffsetDateTimeJsonConverter().fromJson),
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      const OffsetDateTimeJsonConverter().fromJson(json['createdOn'] as String),
      const OffsetDateTimeJsonConverter().fromJson(json['updatedOn'] as String),
      processedOn: _$JsonConverterFromJson<String, OffsetDateTime>(
          json['processedOn'], const OffsetDateTimeJsonConverter().fromJson),
      privacy: json['privacy'] as String? ?? "Public",
    );
