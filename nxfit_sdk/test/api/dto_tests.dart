import 'package:flutter_test/flutter_test.dart';
import 'package:nxfit_sdk/src/api/dtos/badge/get_badges_response_dto.dart';
import 'package:nxfit_sdk/src/api/dtos/summary/get_heart_rate_zone_summaries_response_dto.dart';
import 'package:nxfit_sdk/src/api/dtos/summary/get_session_metrics_response_dto.dart';

void dtoTests() {
  group('DTO', () {
    test("GetBadgesResponseDto deserializes", () {
      const id = 1;
      const title = "Title";
      const description = "Description";
      const imageUrl = "Image URL";
      const progress = 0.75;
      const datestamp = "2002-02-27T14:15:01-05:00";

      final Map<String, dynamic> json = {
        "results": [
          <String, dynamic>{
            "id": id,
            "title": title,
            "description": description,
            "imageUrl": imageUrl,
            "progress": progress,
            "startedOn": datestamp,
            "endedOn": datestamp,
            "completedOn": datestamp
          }
        ]
      };

      final dto = GetBadgesResponseDto.fromJson(json);

      expect(1, dto.badges.length);

      final firstBadge = dto.badges.first;

      expect(id, firstBadge.id);
      expect(title, firstBadge.title);
      expect(description, firstBadge.description);
      expect(imageUrl, firstBadge.imageUrl);
      expect(progress, firstBadge.progress);

      expect(2002, firstBadge.startedOn!.year);
      expect(2, firstBadge.startedOn!.monthOfYear);
      expect(27, firstBadge.startedOn!.dayOfMonth);
      expect(14, firstBadge.startedOn!.hourOfDay);
      expect(15, firstBadge.startedOn!.minuteOfHour);
      expect(1, firstBadge.startedOn!.secondOfMinute);

      expect(firstBadge.startedOn, firstBadge.endedOn);
      expect(firstBadge.startedOn, firstBadge.completedOn);
    });

    test("GetSessionMetricsResponseDto deserializes", () {
      const activityCount = 123;
      const avgBPM = 133.33;
      const maxBPM = 155;
      const minBPM = 100;
      const energyBurnedInCalories = 323;
      const activeTimeInSeconds = 444;
      const activeTimeGoalInSeconds = 500;

      final Map<String, dynamic> json = {
        "activityCount": activityCount,
        "avgBPM": avgBPM,
        "maxBPM": maxBPM,
        "minBPM": minBPM,
        "energyBurnedInCalories": energyBurnedInCalories,
        "activeTimeInSeconds": activeTimeInSeconds,
        "activeTimeGoalInSeconds": activeTimeGoalInSeconds
      };

      final dto = GetSessionMetricsResponseDto.fromJson(json);

      expect(activityCount, dto.activityCount);
      expect(avgBPM, dto.avgBPM);
      expect(maxBPM, dto.maxBPM);
      expect(minBPM, dto.minBPM);
      expect(energyBurnedInCalories, dto.energyBurnedInCalories);
      expect(activeTimeInSeconds, dto.activeTimeInSeconds);
      expect(activeTimeGoalInSeconds, dto.activeTimeGoalInSeconds);
    });

    test("GetHeartRateZoneSummariesResponseDto deserializes", () {
      const int zone0 = 1;
      const int minBPM0 = 111;
      const int maxBPM0 = 121;
      const int durationInSeconds0 = 100;
      const int zone1 = 2;
      const int minBPM1 = 211;
      const int maxBPM1 = 221;
      const int durationInSeconds1 = 200;

      final Map<String, dynamic> json = {
        "results": [
          <String, dynamic>{
            "zone": zone0,
            "minBPM": minBPM0,
            "maxBPM": maxBPM0,
            "durationInSeconds": durationInSeconds0,
          },
          {
            "zone": zone1,
            "minBPM": minBPM1,
            "maxBPM": maxBPM1,
            "durationInSeconds": durationInSeconds1,
          }
        ]
      };

      final dto = GetHeartRateZoneSummariesResponseDto.fromJson(json);

      expect(2, dto.heartRateZoneSummaries.length);

      expect(zone0, dto.heartRateZoneSummaries[0].zone);
      expect(minBPM0, dto.heartRateZoneSummaries[0].minBPM);
      expect(maxBPM0, dto.heartRateZoneSummaries[0].maxBPM);
      expect(durationInSeconds0, dto.heartRateZoneSummaries[0].durationInSeconds);

      expect(zone1, dto.heartRateZoneSummaries[1].zone);
      expect(minBPM1, dto.heartRateZoneSummaries[1].minBPM);
      expect(maxBPM1, dto.heartRateZoneSummaries[1].maxBPM);
      expect(durationInSeconds1, dto.heartRateZoneSummaries[1].durationInSeconds);
    });

    test("GetHeartRateZoneSummariesResponseDto deserializes", () {
      const int zone1 = 1;
      const minBpm1 = 100;
      const maxBpm1 = 150;
      const durationInSeconds1 = 77;
      const int zone2 = 2;
      const minBpm2 = 110;
      const maxBpm2 = 160;
      const durationInSeconds2 = 88;

      final Map<String, dynamic> json = {
        "results": [
          <String, dynamic>{
            "zone": zone1,
            "minBPM": minBpm1,
            "maxBPM": maxBpm1,
            "durationInSeconds": durationInSeconds1,
          },
          {
            "zone": zone2,
            "minBPM": minBpm2,
            "maxBPM": maxBpm2,
            "durationInSeconds": durationInSeconds2,
          }
        ]
      };

      final dto = GetHeartRateZoneSummariesResponseDto.fromJson(json);

      expect(2, dto.heartRateZoneSummaries.length);

      expect(zone1, dto.heartRateZoneSummaries[0].zone);
      expect(minBpm1, dto.heartRateZoneSummaries[0].minBPM);
      expect(maxBpm1, dto.heartRateZoneSummaries[0].maxBPM);
      expect(durationInSeconds1, dto.heartRateZoneSummaries[0].durationInSeconds);

      expect(zone2, dto.heartRateZoneSummaries[1].zone);
      expect(minBpm2, dto.heartRateZoneSummaries[1].minBPM);
      expect(maxBpm2, dto.heartRateZoneSummaries[1].maxBPM);
      expect(durationInSeconds2, dto.heartRateZoneSummaries[1].durationInSeconds);
    });
  });
}
