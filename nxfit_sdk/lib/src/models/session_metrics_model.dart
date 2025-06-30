import 'package:meta/meta.dart';

@immutable
class SessionMetricsModel {
  final int activityCount;
  final double? avgBPM;
  final int? maxBPM;
  final int? minBPM;
  final int? energyBurnedInCalories;
  final int activeTimeInSeconds;
  final int activeTimeGoalInSeconds;

  const SessionMetricsModel({
      this.activityCount = 0,
      this.avgBPM,
      this.maxBPM,
      this.minBPM,
      this.energyBurnedInCalories,
      this.activeTimeInSeconds = 0,
      this.activeTimeGoalInSeconds = 0
  });
}
