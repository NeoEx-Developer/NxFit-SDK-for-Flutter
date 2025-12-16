// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_metrics_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSessionMetricsResponseDto _$GetSessionMetricsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GetSessionMetricsResponseDto(
      (json['activityCount'] as num).toInt(),
      (json['avgBPM'] as num).toDouble(),
      (json['maxBPM'] as num).toInt(),
      (json['minBPM'] as num).toInt(),
      (json['energyBurnedInKilocalories'] as num).toInt(),
      (json['activeTimeInSeconds'] as num).toInt(),
      (json['activeTimeGoalInSeconds'] as num).toInt(),
    );
