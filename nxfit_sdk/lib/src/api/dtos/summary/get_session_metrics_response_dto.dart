import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'get_session_metrics_response_dto.g.dart';

@internal
@immutable
@JsonSerializable(createToJson: false)

class GetSessionMetricsResponseDto {
  final int activityCount;
  final double avgBPM;
  final int maxBPM;
  final int minBPM;
  final int energyBurnedInKilocalories;
  final int activeTimeInSeconds;
  final int activeTimeGoalInSeconds;

  const GetSessionMetricsResponseDto(
      this.activityCount,
      this.avgBPM,
      this.maxBPM,
      this.minBPM,
      this.energyBurnedInKilocalories,
      this.activeTimeInSeconds,
      this.activeTimeGoalInSeconds
  );

  factory GetSessionMetricsResponseDto.fromJson(Map<String, dynamic> json) => _$GetSessionMetricsResponseDtoFromJson(json);
}
