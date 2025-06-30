
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'get_heart_rate_zones_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetHeartRateZonesResponseDto {
  @JsonKey(name: "results")
  final List<HeartRateZone> heartRateZones;

  const GetHeartRateZonesResponseDto(this.heartRateZones);

  factory GetHeartRateZonesResponseDto.fromJson(Map<String, dynamic> json) => _$GetHeartRateZonesResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
class HeartRateZone {
  final int zone;
  final int minBPM;
  final int maxBPM;

  const HeartRateZone(this.zone, this.minBPM, this.maxBPM);

  factory HeartRateZone.fromJson(Map<String, dynamic> json) => _$HeartRateZoneFromJson(json);
}