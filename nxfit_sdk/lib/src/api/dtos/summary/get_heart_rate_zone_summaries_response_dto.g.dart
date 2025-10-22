// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_heart_rate_zone_summaries_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHeartRateZoneSummariesResponseDto
_$GetHeartRateZoneSummariesResponseDtoFromJson(Map<String, dynamic> json) =>
    GetHeartRateZoneSummariesResponseDto(
      (json['results'] as List<dynamic>)
          .map((e) => HeartRateZoneSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

HeartRateZoneSummary _$HeartRateZoneSummaryFromJson(
  Map<String, dynamic> json,
) => HeartRateZoneSummary(
  (json['zone'] as num).toInt(),
  (json['minBPM'] as num).toInt(),
  (json['maxBPM'] as num).toInt(),
  (json['durationInSeconds'] as num).toInt(),
);
