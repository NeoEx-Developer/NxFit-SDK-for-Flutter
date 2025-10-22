// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_heart_rate_zones_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHeartRateZonesResponseDto _$GetHeartRateZonesResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetHeartRateZonesResponseDto(
  (json['results'] as List<dynamic>)
      .map((e) => HeartRateZone.fromJson(e as Map<String, dynamic>))
      .toList(),
);

HeartRateZone _$HeartRateZoneFromJson(Map<String, dynamic> json) =>
    HeartRateZone(
      (json['zone'] as num).toInt(),
      (json['minBPM'] as num).toInt(),
      (json['maxBPM'] as num).toInt(),
    );
