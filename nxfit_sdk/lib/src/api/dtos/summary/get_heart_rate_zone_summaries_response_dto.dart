
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'get_heart_rate_zone_summaries_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)
class GetHeartRateZoneSummariesResponseDto {
  @JsonKey(name: "results")
  final List<HeartRateZoneSummary> heartRateZoneSummaries;

  const GetHeartRateZoneSummariesResponseDto(this.heartRateZoneSummaries);

  factory GetHeartRateZoneSummariesResponseDto.fromJson(Map<String, dynamic> json) => _$GetHeartRateZoneSummariesResponseDtoFromJson(json);
}

@internal
@immutable
@JsonSerializable(createToJson: false)
class HeartRateZoneSummary {
  final int zone;
  final int minBPM;
  final int maxBPM;
  final int durationInSeconds;

  const HeartRateZoneSummary(this.zone, this.minBPM, this.maxBPM, this.durationInSeconds);

  factory HeartRateZoneSummary.fromJson(Map<String, dynamic> json) => _$HeartRateZoneSummaryFromJson(json);
}
